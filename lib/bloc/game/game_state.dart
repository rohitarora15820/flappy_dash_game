part of 'game_cubit.dart';

class GameState with EquatableMixin {
  const GameState({
    this.currentScrore = 0,
    this.currentPlayingState = PlayingState.none,
  });

  final int currentScrore;
  final PlayingState currentPlayingState;

  GameState copyWith({int? currentScores, PlayingState? currentPlayingState}) =>
      GameState(
          currentScrore: currentScores ?? currentScrore,
        currentPlayingState: currentPlayingState ?? this.currentPlayingState,
      
      );

  @override
  List<Object> get props => [currentScrore, currentPlayingState];
}

enum PlayingState { none, playing, paused, gameOver }
