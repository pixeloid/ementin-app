import 'dart:ui';

import 'package:flutter/widgets.dart';

class CustomRectTween extends RectTween {
  late Cubic _cubic;

  CustomRectTween({
    required Rect begin,
    required Rect end,
    required Cubic cubic,
  }) : super(begin: begin, end: end) {
    _cubic = cubic;
  }

  @override
  Rect lerp(double t) {
    double height = end!.top - begin!.top;
    double width = end!.left - begin!.left;

    double transformedY = _cubic.transform(t);

    double animatedX = begin!.left + (t * width);
    double animatedY = begin!.top + (transformedY * height);

    return Rect.fromLTWH(animatedX, animatedY, 1, 1);
  }
}
