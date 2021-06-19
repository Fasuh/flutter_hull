import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_otoczka/core/style/colors.dart';
import 'package:flutter_otoczka/features/calculate/domain/entities/plane.dart';
import 'package:flutter_otoczka/features/calculate/domain/entities/point.dart';

class CalculatorPainter extends CustomPainter {
  CalculatorPainter({required this.plane});

  final Plane plane;
  Offset offset = Offset.zero;
  double scale = 0.0;

  Paint get blackPaint => Paint();

  Paint get redNonStrokePaint => Paint()
    ..color = defaultLineColor
    ..style = PaintingStyle.stroke
    ..strokeWidth = 4;

  Offset get smallestOffset {
    final list = List.from(plane.points).cast<Point>();
    list.sort((a, b) => a.x.compareTo(b.x));
    final smallestX = list.first.x;
    list.sort((a, b) => a.y.compareTo(b.y));
    final smallestY = list.first.y;
    return Offset(smallestX, smallestY);
  }

  Offset get biggestOffset {
    final list = List.from(plane.points).cast<Point>();
    list.sort((a, b) => b.x.compareTo(a.x));
    final biggestX = list.first.x;
    list.sort((a, b) => b.y.compareTo(a.y));
    final biggestY = list.first.y;
    return Offset(biggestX, biggestY);
  }

  @override
  void paint(Canvas canvas, Size size) {
    initializeScale(size);
    initializeOffset(size);
    drawChart(canvas, size);
    drawPoints(canvas, size);
    drawConvexHull(canvas, size);
    drawPointsLabels(canvas, size);
  }

  void initializeScale(Size size) {
    final smallest = smallestOffset;
    final biggest = biggestOffset;
    final distance = biggest - smallest;
    if (distance.distance != 0.0) {
      final bottomRightPoint = size.bottomRight(Offset.zero);
      final aspect = bottomRightPoint.dy < bottomRightPoint.dx ? bottomRightPoint.dy : bottomRightPoint.dx;
      scale = (aspect / distance.distance) * 0.6;
    } else {
      scale = 0.0;
    }
  }

  void initializeOffset(Size size) {
    final bottomRightPoint = size.bottomRight(Offset.zero);
    final smallest = smallestOffset;

    offset = bottomRightPoint * 0.2;

    offset = Offset(offset.dx - smallest.dx * scale, offset.dy);
    offset = Offset(offset.dx, offset.dy - smallest.dy * scale);
  }

  void drawPointsLabels(Canvas canvas, Size size) {
    plane.points.forEach((point) {
      final position = offsetFromPoint(point, size);
      ui.ParagraphBuilder paragraphBuilder = ui.ParagraphBuilder(
        ui.ParagraphStyle(
          fontWeight: FontWeight.bold,
          textAlign: TextAlign.center,
          fontSize: 20,
          maxLines: 1,
        ),
      )
        ..pushStyle(ui.TextStyle(color: defaultTextColor))
        ..addText(point.id);
      final paragraph = paragraphBuilder.build()..layout(ui.ParagraphConstraints(width: 20));
      final offset = pointLabelOffset(point);
      canvas.drawParagraph(paragraph, (position - Offset(paragraph.width/2, paragraph.height/2)) + offset * 20);
    });
  }

  void drawConvexHull(Canvas canvas, Size size) {
    final path = Path();
    final firstPoint = offsetFromPoint(plane.convexHull.first, size);
    path.moveTo(firstPoint.dx, firstPoint.dy);
    plane.convexHull.skip(1).forEach((point) {
      final offset = offsetFromPoint(point, size);
      path.lineTo(offset.dx, offset.dy);
    });
    path.lineTo(firstPoint.dx, firstPoint.dy);
    canvas.drawPath(path, redNonStrokePaint);
  }

  void drawPoints(Canvas canvas, Size size) {
    plane.points.forEach((point) {
      canvas.drawCircle(offsetFromPoint(point, size), 8, blackPaint);
    });
  }

  void drawChart(Canvas canvas, Size size) {
    canvas.drawLine(
      Offset(offset.dx, 0.0),
      Offset(offset.dx, size.bottomRight(Offset.zero).dy),
      blackPaint,
    );
    canvas.drawLine(
      Offset(0.0, size.bottomRight(Offset.zero).dy - offset.dy),
      Offset(size.bottomRight(Offset.zero).dx, size.bottomRight(Offset.zero).dy - offset.dy),
      blackPaint,
    );
  }

  Offset pointLabelOffset(Point point) {
    switch (point.id) {
      case 'A':
        return Offset(1, -1);
      case 'B':
        return Offset(-1, -1);
      case 'C':
        return Offset(-1, 1);
      case 'D':
        return Offset(1, 1);
      default:
        throw UnimplementedError();
    }
  }

  Offset offsetFromPoint(Point point, Size size) {
    final maxSize = size.bottomRight(Offset.zero);
    final scaledPoint = Offset(point.x, point.y) * scale + offset;
    return Offset(scaledPoint.dx, maxSize.dy - scaledPoint.dy);
  }

  @override
  bool shouldRepaint(covariant CalculatorPainter oldDelegate) => oldDelegate.plane != plane;
}
