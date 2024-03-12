part of '../utils.dart';

extension NumExt on num {
  bool isInRange(num min, num max) {
    return this >= min && this <= max;
  }

  bool isNotInRange(num min, num max) {
    return this < min || this > max;
  }
}
