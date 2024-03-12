part of '../../mechanical_components.dart';

mixin Upgradable on JsonConvertible {
  Map<Upgrade, UpgradeStatus> get upgrades;

  @override
  Map<String, dynamic> toMap() {
    return upgradesToMap(upgrades);
  }

  static Map<String, dynamic> upgradesToMap(
    Map<Upgrade, UpgradeStatus> upgrades,
  ) {
    return upgrades.map<String, dynamic>(
      (key, value) => MapEntry<String, dynamic>(
        key.id,
        value.toMap(),
      ),
    );
  }

  static Map<Upgrade, UpgradeStatus> upgradesFromMap(Map<String, dynamic> map) {
    return map.map<Upgrade, UpgradeStatus>(
      (key, value) => MapEntry<Upgrade, UpgradeStatus>(
        Upgrade.fromID(key),
        UpgradeStatus.fromMap(value as Map<String, dynamic>),
      ),
    );
  }
}

abstract class UpgradeStatus with EquatableMixin, JsonConvertible {
  const UpgradeStatus();

  @mustCallSuper
  @override
  Map<String, dynamic> toMap() {
    return {
      'typeName': runtimeType.toString(),
    };
  }

  factory UpgradeStatus.fromMap(Map<String, dynamic> map) {
    final String typeName = map['typeName']! as String;

    return switch (typeName) {
      'UpgradeStatusNotPerformed' => UpgradeStatusNotPerformed.fromMap(map),
      'UpgradeStatusPerforming' => UpgradeStatusPerforming.fromMap(map),
      'UpgradeStatusPerformed' => UpgradeStatusPerformed.fromMap(map),
      _ => throw "Unknown typename for UpgradeStatus: $typeName",
    };
  }
}

class UpgradeStatusNotPerformed extends UpgradeStatus {
  final bool enabled;

  const UpgradeStatusNotPerformed({
    required this.enabled,
  });

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      ...super.toMap(),
      'enabled': enabled,
    };
  }

  @override
  List<Object?> get props => [enabled];

  UpgradeStatusNotPerformed copyWith({
    bool? enabled,
  }) {
    return UpgradeStatusNotPerformed(
      enabled: enabled ?? this.enabled,
    );
  }

  factory UpgradeStatusNotPerformed.fromMap(Map<String, dynamic> map) {
    return UpgradeStatusNotPerformed(
      enabled: map['enabled'] as bool,
    );
  }

  factory UpgradeStatusNotPerformed.fromJson(String source) =>
      UpgradeStatusNotPerformed.fromMap(
          json.decode(source) as Map<String, dynamic>,);
}

class UpgradeStatusPerforming extends UpgradeStatus {
  final DateTime timeOfStart;
  final bool isPaused;

  UpgradeStatusPerforming({
    required DateTime timeOfStart,
    required this.isPaused,
  }) : timeOfStart = timeOfStart.toUtc();

  // ignore: unused_element
  const UpgradeStatusPerforming._({
    required this.timeOfStart,
    required this.isPaused,
  });

  @override
  List<Object?> get props => [
        timeOfStart,
        isPaused,
      ];

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      ...super.toMap(),
      'timeOfStart': timeOfStart.toIso8601String(),
      'isPaused': isPaused,
    };
  }

  UpgradeStatusPerforming copyWith({
    DateTime? timeOfStart,
    bool? isPaused,
  }) {
    return UpgradeStatusPerforming(
      timeOfStart: timeOfStart ?? this.timeOfStart,
      isPaused: isPaused ?? this.isPaused,
    );
  }

  factory UpgradeStatusPerforming.fromMap(Map<String, dynamic> map) {
    return UpgradeStatusPerforming(
      timeOfStart: DateTime.parse(map['timeOfStart'] as String),
      isPaused: map['isPaused'] as bool,
    );
  }

  factory UpgradeStatusPerforming.fromJson(String source) =>
      UpgradeStatusPerforming.fromMap(
          json.decode(source) as Map<String, dynamic>,);
}

class UpgradeStatusPerformed extends UpgradeStatus {
  final DateTime timeOfStart;
  final DateTime timeOfCompletion;

  UpgradeStatusPerformed({
    required DateTime timeOfStart,
    required DateTime timeOfCompletion,
  })  : timeOfStart = timeOfStart.toUtc(),
        timeOfCompletion = timeOfCompletion.toUtc();

  // ignore: unused_element
  const UpgradeStatusPerformed._({
    required this.timeOfStart,
    required this.timeOfCompletion,
  });

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      ...super.toMap(),
      'timeOfStart': timeOfStart.toIso8601String(),
      'timeOfCompletion': timeOfCompletion.toIso8601String(),
    };
  }

  @override
  List<Object?> get props => [
        timeOfStart,
        timeOfCompletion,
      ];

  UpgradeStatusPerformed copyWith({
    DateTime? timeOfStart,
    DateTime? timeOfCompletion,
  }) {
    return UpgradeStatusPerformed(
      timeOfStart: timeOfStart ?? this.timeOfStart,
      timeOfCompletion: timeOfCompletion ?? this.timeOfCompletion,
    );
  }

  factory UpgradeStatusPerformed.fromMap(Map<String, dynamic> map) {
    return UpgradeStatusPerformed(
      timeOfStart: DateTime.parse(map['timeOfStart'] as String),
      timeOfCompletion: DateTime.parse(map['timeOfCompletion'] as String),
    );
  }

  factory UpgradeStatusPerformed.fromJson(String source) =>
      UpgradeStatusPerformed.fromMap(
          json.decode(source) as Map<String, dynamic>,);
}

class Upgrade<T extends Upgradable>
    with GameEntity, EquatableMixin, JsonConvertible {
  @override
  final String id;
  final T Function(T oldInstance) apply;
  final String name;
  final String description;
  final List<String> effects;
  final GameDuration performDuration;

  const Upgrade._({
    required this.id,
    required this.apply,
    required this.performDuration,
    required this.name,
    required this.description,
    required this.effects,
  });

  factory Upgrade.fromID(String id) {
    return Upgrades.getFromID(id);
  }

  @override
  List<Object?> get props => [
        id,
        apply,
        performDuration,
        name,
        description,
        effects,
      ];

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
    };
  }
}
