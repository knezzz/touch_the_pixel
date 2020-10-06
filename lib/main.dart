import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:touch_the_pixel/providers/game_provider.dart';
import 'package:touch_the_pixel/widget/game_lost.dart';
import 'package:touch_the_pixel/widget/game_update.dart';
import 'package:touch_the_pixel/widget/game_won.dart';

void main() {
  runApp(MaterialApp(theme: ThemeData.dark(), home: const TouchThePixel()));
}

class TouchThePixel extends StatelessWidget {
  const TouchThePixel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GameProvider>(
      create: (_) => GameProvider(),
      builder: (context, child) {
        return Consumer<GameProvider>(
          builder: (context, provider, _) {
            return Scaffold(
              body: SafeArea(
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    provider.updatePixel(constraints);

                    return Stack(
                      children: [
                        GestureDetector(
                          onTapDown: (TapDownDetails tdd) {
                            provider.model.maybeWhen(
                              won: (_, __) => provider.reset(),
                              lost: (_, __) => provider.reset(),
                              orElse: () => provider.click(tdd.localPosition),
                            );
                          },
                          child: Container(
                            color: Colors.black,
                            child: CustomPaint(
                              painter: PixelPainter(provider),
                              size: constraints.biggest,
                            ),
                          ),
                        ),
                        provider.model.maybeMap(
                          gameUpdate: (_) => const GameUpdate(),
                          won: (_) => const GameWon(),
                          lost: (_) => const GameLost(),
                          orElse: () => const SizedBox.shrink(),
                        ),
                      ],
                    );
                  },
                ),
              ),
              floatingActionButton: provider.accuracy < 50.0
                  ? FloatingActionButton(
                      onPressed: () {
                        provider.reset();
                      },
                    )
                  : null,
            );
          },
        );
      },
    );
  }
}

class PixelPainter extends CustomPainter {
  PixelPainter(this.provider);

  final GameProvider provider;

  @override
  void paint(Canvas canvas, Size size) {
    Offset _missedOffset;
    final _pixel = provider.currentPixel;
    final clickedPoint = provider.lastClick;
    final _didClickPixel = provider.model.maybeMap(
      gameUpdate: (model) => model.clickedPixel ?? false,
      orElse: () => false,
    );

    final _showText = provider.model.maybeMap(
      won: (_) => false,
      lost: (_) => false,
      orElse: () => true,
    );

    final _showLine = provider.model.maybeMap(
      gameUpdate: (model) => !(model.clickedPixel ?? false),
      orElse: () => true,
    );

    if (clickedPoint != null) {
      _missedOffset = clickedPoint - _pixel.position;
    }

    canvas.save();
    canvas.translate(_pixel.position.dx, _pixel.position.dy);
    canvas.drawRect(
        Rect.fromCenter(
          center: Offset.zero,
          height: _pixel.size,
          width: _pixel.size,
        ),
        Paint()..color = _pixel.color);

    if (provider.model.maybeMap(orElse: () => false, gameUpdate: (update) => update.totalClicks == 0)) {
      canvas.drawCircle(
          Offset.zero,
          30.0,
          Paint()
            ..color = Colors.white38
            ..strokeWidth = 2.0
            ..style = PaintingStyle.stroke);
    }

    if (_showText && _missedOffset != null) {
      canvas.restore();
      canvas.save();
      canvas.translate(clickedPoint.dx, clickedPoint.dy);

      final TextPainter _painter = TextPainter(
          text: TextSpan(
            text: _didClickPixel
                ? 'You clicked the pixel\nMoving to new location'
                : 'Missed for: ${_missedOffset.distance.toStringAsFixed(2)}',
            style: TextStyle(
              color: _didClickPixel ? Colors.green : Colors.red,
              fontSize: 14.0,
            ),
          ),
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center)
        ..layout();

      _painter.paint(canvas, const Offset(-50.0, -80.0));

      if (_showLine) {
        canvas.drawLine(Offset.zero, _missedOffset * -1, Paint()..color = Colors.red);
      } else {
        canvas.drawCircle(
            _missedOffset * -1,
            30.0,
            Paint()
              ..color = Colors.green.withOpacity(0.4)
              ..strokeWidth = 2.0
              ..style = PaintingStyle.stroke);
      }
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class Pixel {
  Pixel(this.position, {this.size = 1, this.color = Colors.white});

  final Offset position;
  final double size;
  final Color color;
}
