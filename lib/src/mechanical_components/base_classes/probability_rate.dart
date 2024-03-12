part of '../../mechanical_components.dart';

class ProbabilityRate with EquatableMixin, JsonConvertible {
  final int amount;
  final Rate<double> rate;

  const ProbabilityRate({
    required this.amount,
    required this.rate,
  });

  @override
  List<Object?> get props => [amount, rate];

  @override
  Map<String, dynamic> toMap() {
    return {
      'amount': amount,
      'rate': rate.toMap(),
    };
  }
}
