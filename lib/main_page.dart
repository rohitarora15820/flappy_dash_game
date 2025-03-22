import 'package:flame/game.dart';
import 'package:flappy_dash/bloc/game/game_cubit.dart';
import 'package:flappy_dash/widgets/game_over_widget.dart';
import 'package:flappy_dash/widgets/tap_to_play.dart';
import 'package:flappy_dash/widgets/top_score.dart';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'flappy_dash_game.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late FlappyDashGame _flappyDashGame;
  late GameCubit gameCubit;
  PlayingState? _latestPlayingState;

  @override
  void initState() {
    gameCubit = BlocProvider.of<GameCubit>(context);
    // TODO: implement initState
    _flappyDashGame = FlappyDashGame(gameCubit);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GameCubit, GameState>(
      listener: (context, state) {
        if (state.currentPlayingState == PlayingState.none &&
            _latestPlayingState == PlayingState.gameOver) {
          setState(() {
            _flappyDashGame = FlappyDashGame(gameCubit);
          });
        }
        _latestPlayingState = state.currentPlayingState;
      },
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              GameWidget(game: _flappyDashGame),
              if (state.currentPlayingState == PlayingState.gameOver)
                GameOver(),
              if (state.currentPlayingState == PlayingState.none)
                Align(
                  alignment: Alignment(0, 0.2),
                  child: TapToPlay()
                ),
              if (state.currentPlayingState != PlayingState.gameOver)
                TopScore(),
            ],
          ),
        );
      },
    );
  }
}
