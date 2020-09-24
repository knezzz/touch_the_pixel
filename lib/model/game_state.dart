import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_state.freezed.dart';

@freezed
abstract class GameState with _$GameState {
  const factory GameState.gameUpdate(int score, int totalClicks, {bool clickedPixel}) = GameStateGameUpdate;
  const factory GameState.lost(int score, int totalClicks) = GameStateLost;
  const factory GameState.won(int score, int totalClicks) = GameStateWon;
}
