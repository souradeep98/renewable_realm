import 'package:journey_of_centuries/src/utils.dart';

abstract final class GameAssets {
  static String get images => "assets/images";

  static Pattern get wavesPattern => RegExp(r"waves[0-9]+\.png");

  static String wavesAt(int index) {
    if (index.isNotInRange(1, 6)) {
      throw "Waves asset valid range is 1 - 6";
    }
    return "waves$index.png";
  }
}

class GameAsset {

}
