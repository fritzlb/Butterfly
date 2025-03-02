import 'dart:math';

import '../converter/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'colors.dart';
import 'pack.dart';
import 'point.dart';
import 'property.dart';
import 'text.dart';
import 'texture.dart';

part 'element.freezed.dart';
part 'element.g.dart';

@freezed
sealed class ElementConstraint with _$ElementConstraint {
  const factory ElementConstraint({
    @Default(0) double size,
    @Default(0) double length,
    @Default(true) bool includeArea,
  }) = _ElementConstraint;

  factory ElementConstraint.fromJson(Map<String, dynamic> json) =>
      _$ElementConstraintFromJson(json);
}

abstract class SourcedElement {
  String get source;
}

@freezed
@immutable
sealed class ElementConstraints with _$ElementConstraints {
  const factory ElementConstraints.scaled(
      {@Default(1) double scaleX,
      @Default(1) double scaleY}) = ScaledElementConstraints;
  const factory ElementConstraints.fixed(double height, double width) =
      FixedElementConstraints;
  const factory ElementConstraints.dynamic({
    @Default(0) double height,
    @Default(0) double width,
    @Default(0) double aspectRatio,
    @Default(true) bool includeArea,
  }) = DynamicElementConstraints;

  factory ElementConstraints.fromJson(Map<String, dynamic> json) =>
      _$ElementConstraintsFromJson(json);
}

abstract class PathElement {
  List<PathPoint> get points;
  PathProperty get property;
}

mixin LabelElement {
  String get layer;
  Point<double> get position;
  double get scale;
  PackAssetLocation get styleSheet;
  ElementConstraint get constraint;
  int get foreground;

  AreaProperty get areaProperty {
    final element = this as PadElement;
    return element.maybeMap(
      markdown: (e) => e.areaProperty,
      text: (e) => e.area.areaProperty,
      orElse: () => throw UnimplementedError(),
    );
  }

  String get text {
    final element = this as PadElement;
    return element.maybeMap(
      markdown: (e) => e.text,
      text: (e) => e.area.paragraph.text,
      orElse: () => throw UnimplementedError(),
    );
  }
}

@Freezed(equal: false)
sealed class PadElement with _$PadElement {
  @Implements<PathElement>()
  factory PadElement.pen({
    @Default(0) double rotation,
    @Default('') String layer,
    double? zoom,
    @Default([]) List<PathPoint> points,
    @Default(PenProperty()) PenProperty property,
    @Default({}) Map<String, dynamic> extra,
  }) = PenElement;

  @With<LabelElement>()
  factory PadElement.text({
    @Default(0) double rotation,
    @Default('') String layer,
    @DoublePointJsonConverter()
    @Default(Point(0.0, 0.0))
    Point<double> position,
    @Default(1.0) double scale,
    @Default(PackAssetLocation()) PackAssetLocation styleSheet,
    required TextArea area,
    @Default(ElementConstraint(size: 1000)) ElementConstraint constraint,
    @Default(BasicColors.black) int foreground,
    @Default({}) Map<String, dynamic> extra,
  }) = TextElement;

  @With<LabelElement>()
  factory PadElement.markdown({
    @Default(0) double rotation,
    @Default('') String layer,
    @DoublePointJsonConverter()
    @Default(Point(0.0, 0.0))
    Point<double> position,
    @Default(1.0) double scale,
    @Default(PackAssetLocation()) PackAssetLocation styleSheet,
    @Default(AreaProperty()) AreaProperty areaProperty,
    required String text,
    @Default(ElementConstraint(size: 1000)) ElementConstraint constraint,
    @Default(BasicColors.black) int foreground,
    @Default({}) Map<String, dynamic> extra,
  }) = MarkdownElement;

  @Implements<SourcedElement>()
  factory PadElement.image({
    @Default(0) double rotation,
    @Default('') String layer,
    @DoublePointJsonConverter()
    @Default(Point(0.0, 0.0))
    Point<double> position,
    @Default(ScaledElementConstraints(scaleX: 1, scaleY: 1))
    ElementConstraints? constraints,
    required String source,
    required double width,
    required double height,
    @Default({}) Map<String, dynamic> extra,
  }) = ImageElement;

  @Implements<SourcedElement>()
  factory PadElement.svg({
    @Default(0) double rotation,
    @Default('') String layer,
    @DoublePointJsonConverter()
    @Default(Point(0.0, 0.0))
    Point<double> position,
    @Default(ScaledElementConstraints(scaleX: 1, scaleY: 1))
    ElementConstraints? constraints,
    required String source,
    required double width,
    required double height,
    @Default({}) Map<String, dynamic> extra,
  }) = SvgElement;

  factory PadElement.shape({
    @Default(0) double rotation,
    @Default('') String layer,
    @DoublePointJsonConverter()
    @Default(Point(0.0, 0.0))
    Point<double> firstPosition,
    @DoublePointJsonConverter()
    @Default(Point(0.0, 0.0))
    Point<double> secondPosition,
    @Default(ShapeProperty(shape: RectangleShape())) ShapeProperty property,
    @Default({}) Map<String, dynamic> extra,
  }) = ShapeElement;

  factory PadElement.texture({
    @Default(0) double rotation,
    @Default('') String layer,
    @Default(SurfaceTexture.pattern()) SurfaceTexture texture,
    @DoublePointJsonConverter()
    @Default(Point(0.0, 0.0))
    Point<double> firstPosition,
    @DoublePointJsonConverter()
    @Default(Point(0.0, 0.0))
    Point<double> secondPosition,
    @Default({}) Map<String, dynamic> extra,
  }) = TextureElement;

  factory PadElement.fromJson(Map<String, dynamic> json) =>
      _$PadElementFromJson(json);
}
