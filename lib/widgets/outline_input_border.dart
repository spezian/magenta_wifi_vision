import 'package:flutter/material.dart';

class MagentaOutlineInputBorder extends OutlineInputBorder {
  const MagentaOutlineInputBorder({
    super.borderRadius,
    super.borderSide,
    super.gapPadding
  });

  @override
  ShapeBorder? lerpFrom(ShapeBorder? a, double t) {
    if (a is MagentaOutlineInputBorder) {
      return MagentaOutlineInputBorder(
        borderSide: BorderSide.lerp(a.borderSide, borderSide, t),
        borderRadius: BorderRadius.lerp(a.borderRadius, borderRadius, t)!,
      );
    }
    return super.lerpFrom(a, t);
  }

  @override
  bool get isOutline => false;

  @override
  void paint(
      final Canvas canvas,
      final Rect rect, {
        final double? gapStart,
        final double gapExtent = 0.0,
        final double gapPercentage = 0.0,
        final TextDirection? textDirection,
      }) {
    super.paint(
      canvas,
      rect,
      textDirection: textDirection,
    );
  }
}