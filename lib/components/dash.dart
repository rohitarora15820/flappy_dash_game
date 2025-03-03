import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/palette.dart';

class Dash extends PositionComponent {
  Dash()
    : super(
        position: Vector2(0, 0),
        size: Vector2.all(80.0),
        anchor: Anchor.center,
      );

  late Sprite _sprite;

  final Vector2 _gravity =Vector2(0,1400.0);

  Vector2 velocity= Vector2(0,0);

  final _jumpForce=Vector2(0,-500);


  void jump(){
    velocity = _jumpForce;
  }

  @override
  Future<void> onLoad() async {
    // TODO: implement onLoad
    await super.onLoad();
 

    _sprite = await Sprite.load('dash.png');
  }

  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);

    velocity += _gravity * dt;

    position += velocity * dt;
  }

  @override
  void render(Canvas canvas) {
    // TODO: implement render
    super.render(canvas);
    _sprite.render(canvas, size: size);
  }
}
