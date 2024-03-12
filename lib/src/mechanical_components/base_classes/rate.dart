part of '../../mechanical_components.dart';

class Rate<T extends num> extends Equatable with JsonConvertible {
  final T amount;
  final GameDuration duration;
  
  const Rate({
    required this.amount,
    required this.duration,
  });

  @override
  List<Object?> get props => [amount, duration];

  @mustCallSuper
  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'amount': amount,
      'duration': duration.toMap(),
    };
  }

  factory Rate.fromMap(Map<String, dynamic> map) {
    return Rate(
      amount: map['amount'] as T,
      duration: GameDuration.fromMap(map['duration'] as Map<String, dynamic>),
    );
  }

  factory Rate.fromJson(String source) => Rate<T>.fromMap(json.decode(source) as Map<String, dynamic>);

  Rate<T> copyWith({
    T? amount,
    GameDuration? duration,
  }) {
    return Rate<T>(
      amount: amount ?? this.amount,
      duration: duration ?? this.duration,
    );
  }
}
