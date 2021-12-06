import 'package:butterfly/bloc/document_bloc.dart';
import 'package:butterfly/cubits/editing.dart';
import 'package:butterfly/cubits/selection.dart';
import 'package:butterfly/models/elements/label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class LabelElementDialog extends StatelessWidget {
  final int index;
  final DocumentBloc bloc;
  final SelectionCubit selectionCubit;
  final EditingCubit editingCubit;

  const LabelElementDialog(
      {Key? key,
      required this.index,
      required this.bloc,
      required this.selectionCubit,
      required this.editingCubit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocBuilder<DocumentBloc, DocumentState>(
        builder: (context, state) {
          if (state is! DocumentLoadSuccess) return Container();
          if (state.document.content.length <= index) return Container();
          var element = state.document.content[index] as LabelElement;
          return SizedBox(
            height: 300,
            child: Column(
              children: [
                const SizedBox(
                  height: 70,
                  child:
                      Center(child: Icon(PhosphorIcons.textTLight, size: 36)),
                ),
                const Divider(thickness: 1),
                Expanded(
                    child: ListView(children: [
                  ListTile(
                    title: Text(AppLocalizations.of(context)!.move),
                    leading: const Icon(PhosphorIcons.arrowsOutCardinalLight),
                    onTap: () {
                      // Get current mouse position
                      editingCubit.move(element);
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                      title: Text(AppLocalizations.of(context)!.edit),
                      leading: const Icon(PhosphorIcons.textTLight),
                      onTap: () {
                        var _textController =
                            TextEditingController(text: element.text);
                        void submit() {
                          Navigator.of(context).pop();
                          var layer =
                              element.copyWith(text: _textController.text);
                          bloc.add(LayerChanged(index, layer));
                          selectionCubit.change(layer);
                        }

                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                    title: Text(AppLocalizations.of(context)!
                                        .enterText),
                                    content: TextField(
                                      controller: _textController,
                                      autofocus: true,
                                      keyboardType: TextInputType.multiline,
                                      minLines: 3,
                                      maxLines: 5,
                                      onSubmitted: (text) => submit(),
                                    ),
                                    actions: [
                                      TextButton(
                                        child: Text(
                                            AppLocalizations.of(context)!
                                                .cancel),
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                      ),
                                      TextButton(
                                          child: Text(
                                              AppLocalizations.of(context)!.ok),
                                          onPressed: submit)
                                    ]));
                      }),
                  ListTile(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                    title: Text(AppLocalizations.of(context)!
                                        .areYouSure),
                                    content: Text(AppLocalizations.of(context)!
                                        .reallyDelete),
                                    actions: [
                                      TextButton(
                                        child: Text(
                                            AppLocalizations.of(context)!.no),
                                        onPressed: () {
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        },
                                      ),
                                      TextButton(
                                        child: Text(
                                            AppLocalizations.of(context)!.yes),
                                        onPressed: () {
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                          bloc.add(LayersRemoved([element]));
                                        },
                                      ),
                                    ]));
                      },
                      title: Text(AppLocalizations.of(context)!.delete),
                      leading: const Icon(PhosphorIcons.trashLight))
                ])),
              ],
            ),
          );
        },
      ),
    );
  }
}
