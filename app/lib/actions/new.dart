import 'package:butterfly/bloc/document_bloc.dart';
import 'package:butterfly/models/document.dart';
import 'package:butterfly/models/palette.dart';
import 'package:flutter/material.dart';

class NewIntent extends Intent {
  final BuildContext context;

  const NewIntent(this.context);
}

class NewAction extends Action<NewIntent> {
  final DocumentBloc bloc;

  NewAction(this.bloc);

  @override
  void invoke(NewIntent intent) {
    bloc.clearHistory();
    bloc.emit(DocumentLoadSuccess(AppDocument(
        name: DateTime.now().toIso8601String(),
        createdAt: DateTime.now(),
        palettes: ColorPalette.getMaterialPalette(intent.context))));
  }
}
