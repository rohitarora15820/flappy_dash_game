import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit() : super(GameState());

  void startPlaying() {
    emit(state.copyWith(
      currentPlayingState: PlayingState.playing,
      currentScores: 0,
    ));
  }

  void increaseScore() {
    emit(state.copyWith(
      currentScores: state.currentScrore + 1,
    ));
  }

  void gameOver() {
    emit(state.copyWith(
      currentPlayingState: PlayingState.gameOver,
    ));
  }

  restartGame() {
    emit(state.copyWith(
      currentPlayingState: PlayingState.none,
      currentScores: 0,
    ));
  }
}
