part of '../../mechanical_components.dart';

class Range<T extends num> with JsonConvertible, EquatableMixin {
  final T lowerRange;
  final T upperRange;

  const Range({
    required this.lowerRange,
    required this.upperRange,
  });

  @override
  List<Object?> get props => [lowerRange, upperRange];

  @override
  Map<String, dynamic> toMap() {
    return {
      'lowerRange': lowerRange,
      'upperRange': upperRange,
    };
  }
}
