part of '../../mechanical_components.dart';

class University with JsonConvertible, Upgradable {
  @override
  Map<Upgrade<University>, UpgradeStatus> get upgrades => {};
}
