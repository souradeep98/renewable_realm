import 'package:flame/game.dart';
import 'package:flutter/widgets.dart';
import 'package:journey_of_centuries/src/game.dart';

void main() {
  runApp(
    GameWidget<JourneyOfCenturies>(
      game: JourneyOfCenturies(),
    ),
  );
}
