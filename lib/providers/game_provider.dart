import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:touch_the_pixel/main.dart';
import 'package:touch_the_pixel/model/game_state.dart';

class GameProvider with ChangeNotifier, DiagnosticableTreeMixin {
  GameProvider() {
    model = const GameState.gameUpdate(0, 0);
  }

  GameState model;
  Pixel currentPixel;
  Offset lastClick;

  double get accuracy {
    final _acc = (model.score / model.totalClicks) * 100;

    if (_acc.isFinite) {
      return _acc;
    }

    return 0;
  }

  void foundPixel() {
    if (model.score >= 4) {
      model = GameState.won(model.score + 1, model.totalClicks + 1);
    } else {
      model = GameState.gameUpdate(model.score + 1, model.totalClicks + 1, clickedPixel: true);
      currentPixel = null;
    }

    notifyListeners();
  }

  void reset() {
    model = const GameState.gameUpdate(0, 0);
    lastClick = null;

    notifyListeners();
  }

  void missedPixel() {
    if (model.totalClicks < 99) {
      model = GameState.gameUpdate(model.score, model.totalClicks + 1);
    } else {
      model = GameState.lost(model.score, model.totalClicks);
    }

    notifyListeners();
  }

  void updatePixel(BoxConstraints constraints) {
    if (currentPixel != null) {
      return;
    }

    final _rand = Random();

    final _randomOffset = Offset((_rand.nextDouble() * constraints.biggest.width / 2) - constraints.biggest.width / 4,
        (_rand.nextDouble() * constraints.biggest.height / 2) - constraints.biggest.height / 4);

    currentPixel = Pixel(Offset(constraints.biggest.width / 2, constraints.biggest.height / 2) + _randomOffset);
  }

  void click(Offset clickPosition) {
    lastClick = clickPosition;
    final _missedOffset = lastClick - currentPixel.position;

    if (_missedOffset.distance <= 1.0) {
      foundPixel();
    } else {
      missedPixel();
    }
  }
}
