import 'dart:async';
import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flappy_dash/bloc/game/game_cubit.dart';
import 'package:flappy_dash/components/hidden_coin.dart';
import 'package:flappy_dash/components/pipe.dart';
import 'package:flappy_dash/flappy_dash_game.dart';

class Dash extends PositionComponent with CollisionCallbacks,HasGameRef<FlappyDashGame>,FlameBlocReader<GameCubit,GameState> {
  Dash()
    : super(
        position: Vector2(0, 0),
        size: Vector2.all(80.0),
        anchor: Anchor.center,
        priority: 10
      );

  late Sprite _sprite;

  final Vector2 _gravity =Vector2(0,1400.0);

  Vector2 velocity= Vector2(0,0);

  final _jumpForce=Vector2(0,-500);


  void jump(){
    if(bloc.state.currentPlayingState != PlayingState.playing){
       return;
    }
    velocity = _jumpForce;
  }

  @override
  Future<void> onLoad() async {
    // TODO: implement onLoad
    await super.onLoad();
 

    _sprite = await Sprite.load('dash.png');

    final radius= size.x /2;
    final center=size/2;
    add(CircleHitbox(
      radius: radius * 0.75,
      anchor: Anchor.center,
      position: center * 1.1
    ));
  }

  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
  if(bloc.state.currentPlayingState != PlayingState.playing){
       return;
    }
    velocity += _gravity * dt;

    position += velocity * dt;
  }

  @override
  void render(Canvas canvas) {
    // TODO: implement render
    super.render(canvas);
    _sprite.render(canvas, size: size);
  }



   @override
  void onCollision(Set<Vector2> points, PositionComponent other) {
    super.onCollision(points, other);

    if(bloc.state.currentPlayingState != PlayingState.playing){
      return;
    }
    if(other is HiddenCoin){
      // add score logic and hide coin

      //score++ ; // add score logic here
      bloc.increaseScore();
      print("coin collected");
      other.removeFromParent(); 
    }else if(other is Pipe){
      print("game Over..");
      bloc.gameOver();
      // TODO: implement game over logic
    }
  }
}
