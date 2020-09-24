// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'game_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$GameStateTearOff {
  const _$GameStateTearOff();

// ignore: unused_element
  GameStateGameUpdate gameUpdate(int score, int totalClicks,
      {bool clickedPixel}) {
    return GameStateGameUpdate(
      score,
      totalClicks,
      clickedPixel: clickedPixel,
    );
  }

// ignore: unused_element
  GameStateLost lost(int score, int totalClicks) {
    return GameStateLost(
      score,
      totalClicks,
    );
  }

// ignore: unused_element
  GameStateWon won(int score, int totalClicks) {
    return GameStateWon(
      score,
      totalClicks,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $GameState = _$GameStateTearOff();

/// @nodoc
mixin _$GameState {
  int get score;
  int get totalClicks;

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result gameUpdate(int score, int totalClicks, bool clickedPixel),
    @required Result lost(int score, int totalClicks),
    @required Result won(int score, int totalClicks),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result gameUpdate(int score, int totalClicks, bool clickedPixel),
    Result lost(int score, int totalClicks),
    Result won(int score, int totalClicks),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result gameUpdate(GameStateGameUpdate value),
    @required Result lost(GameStateLost value),
    @required Result won(GameStateWon value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result gameUpdate(GameStateGameUpdate value),
    Result lost(GameStateLost value),
    Result won(GameStateWon value),
    @required Result orElse(),
  });

  $GameStateCopyWith<GameState> get copyWith;
}

/// @nodoc
abstract class $GameStateCopyWith<$Res> {
  factory $GameStateCopyWith(GameState value, $Res Function(GameState) then) =
      _$GameStateCopyWithImpl<$Res>;
  $Res call({int score, int totalClicks});
}

/// @nodoc
class _$GameStateCopyWithImpl<$Res> implements $GameStateCopyWith<$Res> {
  _$GameStateCopyWithImpl(this._value, this._then);

  final GameState _value;
  // ignore: unused_field
  final $Res Function(GameState) _then;

  @override
  $Res call({
    Object score = freezed,
    Object totalClicks = freezed,
  }) {
    return _then(_value.copyWith(
      score: score == freezed ? _value.score : score as int,
      totalClicks:
          totalClicks == freezed ? _value.totalClicks : totalClicks as int,
    ));
  }
}

/// @nodoc
abstract class $GameStateGameUpdateCopyWith<$Res>
    implements $GameStateCopyWith<$Res> {
  factory $GameStateGameUpdateCopyWith(
          GameStateGameUpdate value, $Res Function(GameStateGameUpdate) then) =
      _$GameStateGameUpdateCopyWithImpl<$Res>;
  @override
  $Res call({int score, int totalClicks, bool clickedPixel});
}

/// @nodoc
class _$GameStateGameUpdateCopyWithImpl<$Res>
    extends _$GameStateCopyWithImpl<$Res>
    implements $GameStateGameUpdateCopyWith<$Res> {
  _$GameStateGameUpdateCopyWithImpl(
      GameStateGameUpdate _value, $Res Function(GameStateGameUpdate) _then)
      : super(_value, (v) => _then(v as GameStateGameUpdate));

  @override
  GameStateGameUpdate get _value => super._value as GameStateGameUpdate;

  @override
  $Res call({
    Object score = freezed,
    Object totalClicks = freezed,
    Object clickedPixel = freezed,
  }) {
    return _then(GameStateGameUpdate(
      score == freezed ? _value.score : score as int,
      totalClicks == freezed ? _value.totalClicks : totalClicks as int,
      clickedPixel:
          clickedPixel == freezed ? _value.clickedPixel : clickedPixel as bool,
    ));
  }
}

/// @nodoc
class _$GameStateGameUpdate implements GameStateGameUpdate {
  const _$GameStateGameUpdate(this.score, this.totalClicks, {this.clickedPixel})
      : assert(score != null),
        assert(totalClicks != null);

  @override
  final int score;
  @override
  final int totalClicks;
  @override
  final bool clickedPixel;

  @override
  String toString() {
    return 'GameState.gameUpdate(score: $score, totalClicks: $totalClicks, clickedPixel: $clickedPixel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GameStateGameUpdate &&
            (identical(other.score, score) ||
                const DeepCollectionEquality().equals(other.score, score)) &&
            (identical(other.totalClicks, totalClicks) ||
                const DeepCollectionEquality()
                    .equals(other.totalClicks, totalClicks)) &&
            (identical(other.clickedPixel, clickedPixel) ||
                const DeepCollectionEquality()
                    .equals(other.clickedPixel, clickedPixel)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(score) ^
      const DeepCollectionEquality().hash(totalClicks) ^
      const DeepCollectionEquality().hash(clickedPixel);

  @override
  $GameStateGameUpdateCopyWith<GameStateGameUpdate> get copyWith =>
      _$GameStateGameUpdateCopyWithImpl<GameStateGameUpdate>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result gameUpdate(int score, int totalClicks, bool clickedPixel),
    @required Result lost(int score, int totalClicks),
    @required Result won(int score, int totalClicks),
  }) {
    assert(gameUpdate != null);
    assert(lost != null);
    assert(won != null);
    return gameUpdate(score, totalClicks, clickedPixel);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result gameUpdate(int score, int totalClicks, bool clickedPixel),
    Result lost(int score, int totalClicks),
    Result won(int score, int totalClicks),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (gameUpdate != null) {
      return gameUpdate(score, totalClicks, clickedPixel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result gameUpdate(GameStateGameUpdate value),
    @required Result lost(GameStateLost value),
    @required Result won(GameStateWon value),
  }) {
    assert(gameUpdate != null);
    assert(lost != null);
    assert(won != null);
    return gameUpdate(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result gameUpdate(GameStateGameUpdate value),
    Result lost(GameStateLost value),
    Result won(GameStateWon value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (gameUpdate != null) {
      return gameUpdate(this);
    }
    return orElse();
  }
}

abstract class GameStateGameUpdate implements GameState {
  const factory GameStateGameUpdate(int score, int totalClicks,
      {bool clickedPixel}) = _$GameStateGameUpdate;

  @override
  int get score;
  @override
  int get totalClicks;
  bool get clickedPixel;
  @override
  $GameStateGameUpdateCopyWith<GameStateGameUpdate> get copyWith;
}

/// @nodoc
abstract class $GameStateLostCopyWith<$Res>
    implements $GameStateCopyWith<$Res> {
  factory $GameStateLostCopyWith(
          GameStateLost value, $Res Function(GameStateLost) then) =
      _$GameStateLostCopyWithImpl<$Res>;
  @override
  $Res call({int score, int totalClicks});
}

/// @nodoc
class _$GameStateLostCopyWithImpl<$Res> extends _$GameStateCopyWithImpl<$Res>
    implements $GameStateLostCopyWith<$Res> {
  _$GameStateLostCopyWithImpl(
      GameStateLost _value, $Res Function(GameStateLost) _then)
      : super(_value, (v) => _then(v as GameStateLost));

  @override
  GameStateLost get _value => super._value as GameStateLost;

  @override
  $Res call({
    Object score = freezed,
    Object totalClicks = freezed,
  }) {
    return _then(GameStateLost(
      score == freezed ? _value.score : score as int,
      totalClicks == freezed ? _value.totalClicks : totalClicks as int,
    ));
  }
}

/// @nodoc
class _$GameStateLost implements GameStateLost {
  const _$GameStateLost(this.score, this.totalClicks)
      : assert(score != null),
        assert(totalClicks != null);

  @override
  final int score;
  @override
  final int totalClicks;

  @override
  String toString() {
    return 'GameState.lost(score: $score, totalClicks: $totalClicks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GameStateLost &&
            (identical(other.score, score) ||
                const DeepCollectionEquality().equals(other.score, score)) &&
            (identical(other.totalClicks, totalClicks) ||
                const DeepCollectionEquality()
                    .equals(other.totalClicks, totalClicks)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(score) ^
      const DeepCollectionEquality().hash(totalClicks);

  @override
  $GameStateLostCopyWith<GameStateLost> get copyWith =>
      _$GameStateLostCopyWithImpl<GameStateLost>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result gameUpdate(int score, int totalClicks, bool clickedPixel),
    @required Result lost(int score, int totalClicks),
    @required Result won(int score, int totalClicks),
  }) {
    assert(gameUpdate != null);
    assert(lost != null);
    assert(won != null);
    return lost(score, totalClicks);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result gameUpdate(int score, int totalClicks, bool clickedPixel),
    Result lost(int score, int totalClicks),
    Result won(int score, int totalClicks),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (lost != null) {
      return lost(score, totalClicks);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result gameUpdate(GameStateGameUpdate value),
    @required Result lost(GameStateLost value),
    @required Result won(GameStateWon value),
  }) {
    assert(gameUpdate != null);
    assert(lost != null);
    assert(won != null);
    return lost(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result gameUpdate(GameStateGameUpdate value),
    Result lost(GameStateLost value),
    Result won(GameStateWon value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (lost != null) {
      return lost(this);
    }
    return orElse();
  }
}

abstract class GameStateLost implements GameState {
  const factory GameStateLost(int score, int totalClicks) = _$GameStateLost;

  @override
  int get score;
  @override
  int get totalClicks;
  @override
  $GameStateLostCopyWith<GameStateLost> get copyWith;
}

/// @nodoc
abstract class $GameStateWonCopyWith<$Res> implements $GameStateCopyWith<$Res> {
  factory $GameStateWonCopyWith(
          GameStateWon value, $Res Function(GameStateWon) then) =
      _$GameStateWonCopyWithImpl<$Res>;
  @override
  $Res call({int score, int totalClicks});
}

/// @nodoc
class _$GameStateWonCopyWithImpl<$Res> extends _$GameStateCopyWithImpl<$Res>
    implements $GameStateWonCopyWith<$Res> {
  _$GameStateWonCopyWithImpl(
      GameStateWon _value, $Res Function(GameStateWon) _then)
      : super(_value, (v) => _then(v as GameStateWon));

  @override
  GameStateWon get _value => super._value as GameStateWon;

  @override
  $Res call({
    Object score = freezed,
    Object totalClicks = freezed,
  }) {
    return _then(GameStateWon(
      score == freezed ? _value.score : score as int,
      totalClicks == freezed ? _value.totalClicks : totalClicks as int,
    ));
  }
}

/// @nodoc
class _$GameStateWon implements GameStateWon {
  const _$GameStateWon(this.score, this.totalClicks)
      : assert(score != null),
        assert(totalClicks != null);

  @override
  final int score;
  @override
  final int totalClicks;

  @override
  String toString() {
    return 'GameState.won(score: $score, totalClicks: $totalClicks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GameStateWon &&
            (identical(other.score, score) ||
                const DeepCollectionEquality().equals(other.score, score)) &&
            (identical(other.totalClicks, totalClicks) ||
                const DeepCollectionEquality()
                    .equals(other.totalClicks, totalClicks)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(score) ^
      const DeepCollectionEquality().hash(totalClicks);

  @override
  $GameStateWonCopyWith<GameStateWon> get copyWith =>
      _$GameStateWonCopyWithImpl<GameStateWon>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result gameUpdate(int score, int totalClicks, bool clickedPixel),
    @required Result lost(int score, int totalClicks),
    @required Result won(int score, int totalClicks),
  }) {
    assert(gameUpdate != null);
    assert(lost != null);
    assert(won != null);
    return won(score, totalClicks);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result gameUpdate(int score, int totalClicks, bool clickedPixel),
    Result lost(int score, int totalClicks),
    Result won(int score, int totalClicks),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (won != null) {
      return won(score, totalClicks);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result gameUpdate(GameStateGameUpdate value),
    @required Result lost(GameStateLost value),
    @required Result won(GameStateWon value),
  }) {
    assert(gameUpdate != null);
    assert(lost != null);
    assert(won != null);
    return won(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result gameUpdate(GameStateGameUpdate value),
    Result lost(GameStateLost value),
    Result won(GameStateWon value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (won != null) {
      return won(this);
    }
    return orElse();
  }
}

abstract class GameStateWon implements GameState {
  const factory GameStateWon(int score, int totalClicks) = _$GameStateWon;

  @override
  int get score;
  @override
  int get totalClicks;
  @override
  $GameStateWonCopyWith<GameStateWon> get copyWith;
}
