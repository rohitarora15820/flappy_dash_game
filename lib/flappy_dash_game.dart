import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flappy_dash/audio_helper.dart';
import 'package:flappy_dash/bloc/game/game_cubit.dart';
import 'package:flappy_dash/components/dash.dart';
import 'package:flappy_dash/components/flappy_dash_root_component.dart';
import 'package:flappy_dash/components/parallax_background.dart';
import 'package:flappy_dash/components/pipe_pair.dart';
import 'package:flappy_dash/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FlappyDashGame extends FlameGame<FlappyDashWorld>
    with KeyboardEvents, HasCollisionDetection {
  FlappyDashGame(this.gameCubit)
    : super(
        world: FlappyDashWorld(),
        camera: CameraComponent.withFixedResolution(width: 600, height: 1000),
      );

  final GameCubit gameCubit;

  @override
  KeyEventResult onKeyEvent(
    KeyEvent event,
    Set<LogicalKeyboardKey> keysPressed,
  ) {
    final isKeyDown = event is KeyDownEvent;

    final isSpace = keysPressed.contains(LogicalKeyboardKey.space);

    if (isSpace && isKeyDown) {
      world.onSpaceDown();
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }
}

class FlappyDashWorld extends World with TapCallbacks,HasGameRef<FlappyDashGame> {
  late FlappyDashRootComponent _rootComponent;

  @override
  Future<void> onLoad() async{
    super.onLoad(); 
    await getIt.get<AudioHelper>().initialize();
    add(
      FlameBlocProvider<GameCubit,GameState>(
        create: () => game.gameCubit,
        children: [_rootComponent = FlappyDashRootComponent()],
      ),
    );
  }

  void onSpaceDown() => _rootComponent.onSpaceDown();

  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);
    _rootComponent.onTabPressed(event);
  }
}



