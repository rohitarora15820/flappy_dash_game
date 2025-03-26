
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';


class HiddenCoin extends PositionComponent{
  HiddenCoin({
    required super.position
  }):super(
    size: Vector2.all(40.0),
    anchor: Anchor.center
  );


@override
  void onLoad() {
  
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