part of '../mechanical_components.dart';

class WorldEventLogs {}

class WorldEvent extends JsonConvertible {
  final DateTime time;
  final Type loggerComponent;
  final WorldLog log;

  WorldEvent({
    required DateTime time,
    required this.loggerComponent,
    required this.log,
  }) : time = time.toUtc();

  @override
  Map<String, dynamic> toMap() {
    return {
      'time': time.toIso8601String(),
      'loggerComponent': loggerComponent.toString(),
      'log': log.toMap(),
    };
  }
}

abstract class WorldLog extends JsonConvertible {
  @override
  String toString();
}
