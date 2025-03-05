import 'dart:async';
import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/palette.dart';

class HiddenCoin extends PositionComponent{
  HiddenCoin({
    required super.position
  }):super(
    size: Vector2.all(24.0),
    anchor: Anchor.center
  );


@override
  void onLoad() {
    // TODO: implement onLoad
    super.onLoad();
    add(CircleHitbox(
      // passive detect collision but doesn't affect other
      collisionType: CollisionType.passive
    ));
  }


// @override
//   void render(Canvas canvas) {
//     // TODO: implement render
//     super.render(canvas);
//     canvas.drawCircle((size/2).toOffset(), size.x/2, BasicPalette.yellow.paint());
//   }
}