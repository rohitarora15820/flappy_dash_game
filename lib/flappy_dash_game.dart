import 'dart:async';

import 'dart:ui';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';

import 'package:flappy_dash/components/dash.dart';
import 'package:flappy_dash/components/parallax_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FlappyDashGame extends FlameGame<FlappyDashWorld> with KeyboardEvents {
  FlappyDashGame()
    : super(
        world: FlappyDashWorld(),
        camera: CameraComponent.withFixedResolution(width: 600, height: 1000),
      );

  @override
  void onGameResize(Vector2 size) {
    // TODO: implement onGameResize
    super.onGameResize(size);

    print("onGame Resize: $size");
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();

    // Load Asset

    print("OnLoad");
  }

  @override
  void onMount() {
    // TODO: implement onMount
    super.onMount();
  }

  @override
  void update(double dt) {
    super.update(dt);

    print("onUpdate $dt");
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    print("onRender");
  }

  @override
  void onRemove() {
    // TODO: implement onRemove
    super.onRemove();
  }

    @override
  KeyEventResult onKeyEvent(
    KeyEvent event,
    Set<LogicalKeyboardKey> keysPressed,
  ) {
    final isKeyDown = event is KeyDownEvent;

    final isSpace = keysPressed.contains(LogicalKeyboardKey.space);

    if (isSpace && isKeyDown) {
      world.onSpacePressed();
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }
}

class FlappyDashWorld extends World with TapCallbacks {

 late Dash _dash;
  @override
  void onLoad() {
    // TODO: implement onLoad
    super.onLoad();
    add(DashParallaxBackground());
    add(_dash=Dash());
   
    
  }

  @override
  void onTapDown(TapDownEvent event) {
    // TODO: implement onTapDown
    super.onTapDown(event);
// call jump event
_dash.jump();

  }

  onSpacePressed(){
    _dash.jump();
  }


}




