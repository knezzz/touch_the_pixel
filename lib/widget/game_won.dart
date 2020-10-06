import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:touch_the_pixel/providers/game_provider.dart';

class GameWon extends StatelessWidget {
  const GameWon({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 4),
          Text(
            'You won!',
            style: Theme.of(context).textTheme.headline1.copyWith(fontWeight: FontWeight.w100),
          ),
          const Spacer(),
          Text(
            'Click accuracy: ${context.watch<GameProvider>().accuracy.toStringAsFixed(4)}%',
            style: Theme.of(context).textTheme.headline3,
          ),
          const Spacer(),
          Text(
            'Congratulations!',
            style: Theme.of(context).textTheme.headline3.copyWith(fontWeight: FontWeight.w100),
          ),
          const Spacer(),
          Text(
            'Click anywhere to play again',
            style: Theme.of(context).textTheme.headline6.copyWith(fontWeight: FontWeight.w100),
          ),
          const Spacer(flex: 6),
        ],
      ),
    );
  }
}
