part of '../mechanical_components.dart';

abstract final class Upgrades {
  static Upgrade<T> getFromID<T extends Upgradable>(String id) {
    return _upgrades[id]! as Upgrade<T>;
  }

  static final Map<String, Upgrade> _upgrades = {};
}
