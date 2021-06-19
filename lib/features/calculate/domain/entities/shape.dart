import 'package:flutter_otoczka/generated/l10n.dart';

enum Shape {
  Dot,
  Line,
  Triangle,
  Quadrangle,
}

extension ShapeText on Shape {
  String get name {
    switch (this) {
      case Shape.Dot:
        return S.current.shapeDot;
      case Shape.Line:
        return S.current.shapeLine;
      case Shape.Triangle:
        return S.current.shapeTriangle;
      case Shape.Quadrangle:
        return S.current.shapeQuadrangle;
    }
  }
}
