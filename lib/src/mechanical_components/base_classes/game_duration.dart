part of '../../mechanical_components.dart';

class GameDuration extends Equatable with JsonConvertible {
  final int hours;

  static const int hoursPerDay = 24;

  static const int hoursPerWeek = hoursPerDay * 7;

  static const int hoursPerMonth = hoursPerDay * 30;

  static const int hoursPerYear = hoursPerMonth * 12;

  static const int hoursPerCentury = hoursPerYear * 100;

  const GameDuration({
    int centuries = 0,
    int years = 0,
    int months = 0,
    int weeks = 0,
    int days = 0,
    int hours = 0,
  }) : this._hours(
          (centuries * hoursPerCentury) +
              (years * hoursPerYear) +
              (months * hoursPerMonth) +
              (weeks * hoursPerWeek) +
              (days * hoursPerDay) +
              hours,
        );

  const GameDuration._hours(this.hours);

  static const Duration gameHoursToRealDurationScale = Duration(seconds: 2);

  int get days => hours ~/ 24;

  int get weeks => days ~/ 7;

  int get months => days ~/ 30;

  int get years => months ~/ 12;

  int get centuries => years ~/ 100;

  Duration get realDuration => gameHoursToRealDurationScale * hours;

  @override
  List<Object?> get props => [hours];

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'hours': hours,
    };
  }

  factory GameDuration.fromMap(Map<String, dynamic> map) {
    return GameDuration(
      hours: map['hours'] as int,
    );
  }

  factory GameDuration.fromJson(String source) =>
      GameDuration.fromMap(json.decode(source) as Map<String, dynamic>);

  String toPrettyString() {
    return super.toString();
  }

  static const GameDuration zero = GameDuration();

  bool operator >(GameDuration other) => days > other.days;

  bool operator >=(GameDuration other) => days >= other.days;

  bool operator <(GameDuration other) => days < other.days;

  bool operator <=(GameDuration other) => days <= other.days;

  GameDuration operator +(GameDuration other) =>
      GameDuration._hours(hours + other.hours);

  GameDuration operator -(GameDuration other) =>
      GameDuration._hours(hours - other.hours);
}

extension DurationExt on Duration {
  GameDuration toGameDuration() => GameDuration._hours(
        inSeconds ~/ GameDuration.gameHoursToRealDurationScale.inSeconds,
      );
}
