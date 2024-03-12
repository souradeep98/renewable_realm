// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../mechanical_components.dart';

class InfluenceSystem {}

class Influence<T> extends Equatable {
  final T Function(T oldInstance, GameDuration durationPassedSinceApply) apply;
  final GameDuration delayBeforeApplication;
  final GameDuration? periodicDelay;

  const Influence({
    required this.apply,
    this.delayBeforeApplication = GameDuration.zero,
    this.periodicDelay,
  });

  @override
  List<Object?> get props => [
        apply,
        delayBeforeApplication,
        periodicDelay,
      ];
}

mixin Influencer {
  Map<Type, Influence> get influences;
}

mixin Influenceable<T> {
  late T _value;

  set value(T newValue) {
    if (eualityChecker(_value, newValue)) {
      return;
    }

    _value = newValue;
  }

  T get value => _value;

  final Map<Influence, DateTime> pendingApplicableInfluences = {};

  bool eualityChecker(T a, T b) => a == b;
}

abstract class PeriodicSystemAndInfluenceable<T>
    with Influenceable<T>, PeriodicExecutor {
  @override
  bool get executeOnInitialize => false;

  @override
  GameDuration get periodicExecuteDelay => const GameDuration(days: 1);
}

class DiseaseSystem
    extends PeriodicSystemAndInfluenceable<Map<Disease, (DateTime?, double)>> {
  final Map<Disease, Map<DateTime, int>> _cases = {};

  Set<Disease> get currentDiseases =>
      _cases.entries.map<Disease>((e) => e.key).toSet();

  @override
  void execute() {
    // Task: evaluate current cases (evaluate recoveries, disabilities, deaths and contaminations), evaluate occurrence of new cases
    final DateTime currentDate =
        DateTime(2020); // TODO: make a global reference

    // Needed for rolling the dice
    final Random random = Random();

    // Handle current cases first
    for (final MapEntry<Disease, Map<DateTime, int>> caseEntry
        in _cases.entries) {
      final Disease disease = caseEntry.key;
      final Map<DateTime, int> cases = caseEntry.value;

      for (final MapEntry<DateTime, int> dayEntry in cases.entries) {
        final DateTime occurrenceDay = dayEntry.key;

        final GameDuration timePassed =
            occurrenceDay.difference(currentDate).toGameDuration();

        // Evaluate contaminations
        if ((disease.contagiousness != null) &&
            (disease.contagiousness!.rate.duration >= timePassed)) {
          final double deltaFactor =
              timePassed.days / disease.contagiousness!.rate.duration.days;

          final double probability =
              disease.contagiousness!.rate.amount * deltaFactor;

          if (random.nextDouble() < probability) {
            final int newContaminations = disease.contagiousness!.amount;

            _cases[disease]![currentDate] =
                (_cases[disease]![currentDate] ?? 0) + newContaminations;
            //TODO: evaluate disabilities
          }
        }

        // Evaluate recoveries and deaths
        if (disease.lastingDuration >= timePassed) {
          /*final int numberOfCases = dayEntry.value;
          
          final double deltaFactor = timePassed.days / disease.effectDuration.days;

          final int lives = (numberOfCases * (disease.mortalityRate * deltaFactor)).floor();

          final int dies = numberOfCases - lives;*/

          // TODO: report recoveries and deaths

          _cases[disease]!.remove(occurrenceDay);
        }
      }
    }

    // Then evaluate new occurrences
    for (final MapEntry<Disease, (DateTime?, double)> diseaseEntry
        in _value.entries) {
      final Disease disease = diseaseEntry.key;
      final DateTime? lastEvaluationDate = diseaseEntry.value.$1;

      if ((lastEvaluationDate == null) ||
          (lastEvaluationDate.difference(currentDate).toGameDuration() <=
              disease.oddsOfOccurence.rate.duration)) {
        final double currentProbability =
            diseaseEntry.value.$2 + disease.oddsOfOccurence.rate.amount;
        if (random.nextDouble() <= currentProbability) {
          _cases[disease] ??= {};
          _cases[disease]![currentDate] = disease.oddsOfOccurence.amount;
          //TODO: evaluate disabilities
        }
      }
    }
  }

  @override
  GameDuration get periodicExecuteDelay => const GameDuration(days: 1);
}

class EnvironmentalSystem extends PeriodicSystemAndInfluenceable<
    Map<EnvironmentalFactor, Rate<int>>> {
  @override
  void execute() {}
}

abstract class EnvironmentalFactor {}

class PopulationAndArchitecturalSystem
    extends PeriodicSystemAndInfluenceable<PopulationParameters>
    with EquatableMixin {
  int _currentPopulation;
  final List<(Polygon, int)> houseModels;
  final List<Polygon> existingHouses;
  final Polygon bound;
  final List<Polygon> collisions;
  final bool university;
  final bool researchCentres;

  PopulationAndArchitecturalSystem({
    required int currentPopulation,
    required PopulationParameters populationParameters,
    required this.houseModels,
    required this.existingHouses,
    required this.bound,
    required this.collisions,
    required this.university,
    required this.researchCentres,
  }) : _currentPopulation = currentPopulation {
    _value = populationParameters;
  }

  /*void increasePopulation(int count) {
    final int newHouseRequired = count ~/ 3;

    if (newHouseRequired > 0) {
      addHouses(newHouseRequired);
    }
  }*/

  /*void addHouses(int count) {
    for (int i = 0; i < count; ++i) {
      // Get new house location
      //final Polygon newHouse = existingHouses;
    }
  }*/

  void addHouse(Polygon houseBounds) {}

  @override
  void execute() {}

  @override
  List<Object?> get props => [
        _currentPopulation,
        houseModels,
        existingHouses,
        university,
        researchCentres,
        bound,
        collisions,
      ];
}

class PopulationParameters with JsonConvertible, EquatableMixin {
  final Rate<int> birthRate;
  final Rate<int> deathRate;
  final ProbabilityRate migrationOutRate;

  const PopulationParameters({
    required this.birthRate,
    required this.deathRate,
    required this.migrationOutRate,
  });

  @override
  List<Object?> get props => [birthRate, deathRate, migrationOutRate];

  @override
  Map<String, dynamic> toMap() {
    return {
      'birthRate': birthRate,
      'deathRate': deathRate,
      'migrationOutRate': migrationOutRate,
    };
  }
}

enum CitizenAgeCategory {
  child(Range<int>(lowerRange: 0, upperRange: 4)), // pays Nothing
  students(Range<int>(lowerRange: 5, upperRange: 21)), // pays Turnover Tax
  workers(
    Range<int>(
      lowerRange: 22,
      upperRange: 65,
    ),
  ), // pays Income Tax, Behavioral Tax, Turnover Tax
  retired(
    Range<int>(
      lowerRange: 66,
      upperRange: 100,
    ),
  ); // pays Behavioral Tax, Turnover Tax

  final Range<int> ageRangeInYears;

  const CitizenAgeCategory(this.ageRangeInYears);
}

class CityLifeSystem extends PeriodicSystemAndInfluenceable<CityLifeFactors> {
  @override
  void execute() {}
}

class CityLifeFactors with JsonConvertible, EquatableMixin {
  @override
  List<Object?> get props => [];

  @override
  Map<String, dynamic> toMap() {
    return {};
  }
}

// Affects the Environment: -wind speed
/*class ArchitecturalSystem with Influencer, EquatableMixin {
  final List<Polygon> houses;
  final List<Polygon> bound;
  final List<Polygon> collisions;
  final bool university;
  final bool researchCentres;

  const ArchitecturalSystem({
    required this.houses,
    required this.bound,
    required this.collisions,
    required this.university,
    required this.researchCentres,
  });

  @override
  Map<Type, Influence> get influences => {};

  @override
  List<Object?> get props => [
        houses,
        university,
        researchCentres,
        bound,
        collisions,
      ];

  void addHouses(int count) {}
}*/

class NaturalDisasterSystem
    extends PeriodicSystemAndInfluenceable<Map<NaturalDisaster, Rate<double>>>
    with Influencer {
  @override
  void execute() {}

  @override
  Map<Type, Influence> get influences => {};
}

class NaturalDisaster {}
