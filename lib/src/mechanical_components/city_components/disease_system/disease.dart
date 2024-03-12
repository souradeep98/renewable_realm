// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../../../mechanical_components.dart';

enum Disease {
  commonCold(
    contagiousness: ProbabilityRate(
      amount: 2,
      rate: Rate<double>(amount: 0.2, duration: GameDuration(hours: 24)),
    ),
    effectDuration: GameDuration(hours: 24),
  ),
  dementia.chronic(
    disabilityDelay: GameDuration(years: 8),
    effectDuration: GameDuration(years: 5),
    oddsOfOccurence: ProbabilityRate(
      amount: 1,
      rate: Rate<double>(amount: 0.00005, duration: GameDuration(hours: 24)),
    ),
    mortalityRate: 0,
  ),
  ;

  final ProbabilityRate oddsOfOccurence;
  final ProbabilityRate? contagiousness;
  final GameDuration effectDuration;
  final GameDuration disabilityDelay;
  final double mortalityRate;
  final Rate<int>? educationLevelModifier;

  GameDuration get lastingDuration => effectDuration + disabilityDelay;

  const Disease({
    // ignore: unused_element
    this.oddsOfOccurence = const ProbabilityRate(
      amount: 1,
      rate: Rate<double>(amount: 0, duration: GameDuration(days: 1)),
    ),
    // ignore: unused_element
    this.contagiousness,
    required this.effectDuration,
    // ignore: unused_element
    this.disabilityDelay = GameDuration.zero,
    // ignore: unused_element
    this.mortalityRate = 1,
    // ignore: unused_element
    this.educationLevelModifier,
  });

  const Disease.chronic({
    // ignore: unused_element
    this.oddsOfOccurence = const ProbabilityRate(
      amount: 1,
      rate: Rate<double>(amount: 0, duration: GameDuration(days: 1)),
    ),
    // ignore: unused_element
    this.contagiousness,
    // ignore: unused_element
    required this.disabilityDelay,
    required this.effectDuration,
    // ignore: unused_element
    this.mortalityRate = 1,
    // ignore: unused_element
    this.educationLevelModifier,
  });
}
