import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:touch_the_pixel/providers/game_provider.dart';

void main() {
  runApp(MaterialApp(theme: ThemeData.dark(), home: TouchThePixel()));
}

class TouchThePixel extends StatelessWidget {
  TouchThePixel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GameProvider>(
      create: (_) => GameProvider(),
      builder: (context, child) {
        return Consumer<GameProvider>(
          builder: (context, provider, _) {
            double _accuracy = ((provider.model.score / provider.model.totalClicks) * 100);

            if (!_accuracy.isFinite) {
              _accuracy = 0;
            }

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
                          gameUpdate: (model) {
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
                                        'Total clicks: ${model.totalClicks.toString().padLeft(3, '0')}/100',
                                        style: Theme.of(context).textTheme.headline6,
                                      ),
                                      Text(
                                        'Click accuracy: ${_accuracy.toStringAsFixed(4)}%',
                                        style: Theme.of(context).textTheme.caption,
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '${model.score}/5',
                                    style: Theme.of(context).textTheme.headline4,
                                  ),
                                ],
                              ),
                            );
                          },
                          won: (model) {
                            return Positioned.fill(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Spacer(
                                    flex: 4,
                                  ),
                                  Text(
                                    'You won!',
                                    style: Theme.of(context).textTheme.headline1.copyWith(fontWeight: FontWeight.w100),
                                  ),
                                  Spacer(),
                                  Text(
                                    'Click accuracy: ${_accuracy.toStringAsFixed(4)}%',
                                    style: Theme.of(context).textTheme.headline3,
                                  ),
                                  Spacer(),
                                  Text(
                                    'Congratulations!',
                                    style: Theme.of(context).textTheme.headline3.copyWith(fontWeight: FontWeight.w100),
                                  ),
                                  Spacer(),
                                  Text(
                                    'Click anywhere to play again',
                                    style: Theme.of(context).textTheme.headline6.copyWith(fontWeight: FontWeight.w100),
                                  ),
                                  Spacer(
                                    flex: 6,
                                  ),
                                ],
                              ),
                            );
                          },
                          lost: (model) {
                            return Positioned.fill(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Spacer(
                                    flex: 4,
                                  ),
                                  Text(
                                    'You lost!',
                                    style: Theme.of(context).textTheme.headline1.copyWith(fontWeight: FontWeight.w100),
                                  ),
                                  Spacer(),
                                  Text(
                                    'Click accuracy: ${_accuracy.toStringAsFixed(4)}%',
                                    style: Theme.of(context).textTheme.headline3,
                                  ),
                                  Spacer(),
                                  Text(
                                    'Click better!',
                                    style: Theme.of(context).textTheme.headline2.copyWith(fontWeight: FontWeight.w100),
                                  ),
                                  Spacer(),
                                  Text(
                                    'Click anywhere to try again',
                                    style: Theme.of(context).textTheme.headline4.copyWith(fontWeight: FontWeight.w100),
                                  ),
                                  Spacer(
                                    flex: 6,
                                  ),
                                ],
                              ),
                            );
                          },
                          orElse: () => SizedBox.shrink(),
                        ),
                      ],
                    );
                  },
                ),
              ),
              floatingActionButton: provider.model.totalClicks > 5 && _accuracy < 15.0
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

      _painter.paint(canvas, Offset(-50.0, -80.0));

      if (_showLine) {
        canvas.drawLine(Offset.zero, _missedOffset * -1, Paint()..color = Colors.red);
      } else {
        canvas.drawCircle(
            _missedOffset * -1,
            20.0,
            Paint()
              ..color = Colors.green
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
