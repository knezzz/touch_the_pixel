import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:touch_the_pixel/providers/game_provider.dart';

class GameUpdate extends StatelessWidget {
  const GameUpdate({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _provider = context.watch<GameProvider>();

    return Positioned(
      top: 24.0,
      left: 24.0,
      right: 24.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total clicks: ${_provider.model.totalClicks.toString().padLeft(3, '0')}/100',
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                'Click accuracy: ${_provider.accuracy.toStringAsFixed(4)}%',
                style: Theme.of(context).textTheme.caption,
              ),
            ],
          ),
          Text(
            '${_provider.model.score}/5',
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
    );
  }
}
