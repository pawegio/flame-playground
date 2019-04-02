import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flutter/gestures.dart';

class BoxGame extends Game {
  Size screenSize;
  double centerX;
  double centerY;
  bool hasWon = false;

  @override
  void render(Canvas canvas) {
    // draw black background
    Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint bgPaint = Paint();
    bgPaint.color = Color(0xff000000);
    canvas.drawRect(bgRect, bgPaint);

    // draw white box
    Rect boxRect = Rect.fromLTWH(centerX - 75, centerY - 75, 150, 150);
    Paint boxPaint = Paint();
    if (hasWon) {
      boxPaint.color = Color(0xff00ff00);
    } else {
      boxPaint.color = Color(0xffffffff);
    }
    canvas.drawRect(boxRect, boxPaint);
  }

  @override
  void update(double t) {
    // TODO: implement update
  }

  @override
  void resize(Size size) {
    screenSize = size;
    centerX = screenSize.width / 2;
    centerY = screenSize.height / 2;
    super.resize(size);
  }

  void onTapDown(TapDownDetails d) {
    if (d.globalPosition.dx >= centerX - 75
        && d.globalPosition.dx <= centerX + 75
        && d.globalPosition.dy >= centerY - 75
        && d.globalPosition.dy <= centerY + 75
    ) {
      hasWon = true;
    }
  }
}
