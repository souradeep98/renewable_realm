part of '../../mechanical_components.dart';

abstract class Service
    with
        GameEntity,
        JsonConvertible,
        PeriodicExecutor,
        Dependable,
        Dependent,
        Buildable {
  @override
  final String id;

  const Service({required this.id});

  bool get isServiceActive;
}
