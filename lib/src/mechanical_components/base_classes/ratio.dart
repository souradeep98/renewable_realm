part of '../../mechanical_components.dart';

class Ratio<T extends num> with JsonConvertible, EquatableMixin {
  final T total;
  final T current;

  const Ratio({
    required this.total,
    required this.current,
  });

  Ratio copyWith({
    T? total,
    T? current,
  }) {
    return Ratio(
      total: total ?? this.total,
      current: current ?? this.current,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'total': total,
      'current': current,
    };
  }

  factory Ratio.fromMap(Map<String, dynamic> map) {
    return Ratio(
      total: map['total'] as T,
      current: map['current'] as T,
    );
  }

  factory Ratio.fromJson(String source) =>
      Ratio.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object?> get props => [
        current,
        total,
      ];
}
