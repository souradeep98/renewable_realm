part of '../../mechanical_components.dart';

mixin PeriodicExecutor {
  void execute();

  GameDuration get periodicExecuteDelay;

  bool get executeOnInitialize => true;
}
