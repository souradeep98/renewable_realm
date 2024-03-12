// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../mechanical_components.dart';

class City
    with
        Buildable,
        JsonConvertible,
        Upgradable,
        GameEntity,
        Dependent,
        EquatableMixin {
  static const Range<int> limitOfPersonPerHouse = Range<int>(
    lowerRange: 1,
    upperRange: 3,
  );

  /*static final List<Polygon> predefinedHouses = [
    Polygon([]),
  ];*/

  // Constants
  @override
  Set<ItemAmount> get buildRequirements => {};
  
  @override
  final Map<Upgrade<Upgradable>, UpgradeStatus> upgrades = {};

  // Variables
  @override
  final Map<ItemRate, List<Dependable>> dependencies = {};

  @override
  final String id;

  final String name;

  final int population;
  final Rate<int> birthRate;
  final Rate<int> deathRate;

  final int qualityOfLife;
  final int airQuality;
  final Ratio pollutionLevel;
  final Ratio educationLevel;
  final Ratio cleanliness;
  final Range livingCost;
  final Range incomeLevelOfCitizens;
  final Range averageLifeExpectancy;

  // Rules
  final int maxNoOfKidsACoupleMayHave;
  final bool lockdown;

  // Taxes
  final double incomeTaxPercentage;
  final int propertyTax;
  final int vehicleTax;
  final double goodTaxPercentage;

  // Buildable
  final bool hasMarket;

  final School? school;
  final University? university;

  final Set<ResearchCentre> researchCentres;

  // Diseases
  final DiseaseSystem diseases;

  // 

  City(this.population, this.birthRate, this.deathRate, this.qualityOfLife, this.airQuality, this.pollutionLevel, this.educationLevel, this.cleanliness, this.livingCost, this.incomeLevelOfCitizens, this.averageLifeExpectancy, this.maxNoOfKidsACoupleMayHave, this.lockdown, this.incomeTaxPercentage, this.propertyTax, this.vehicleTax, this.goodTaxPercentage, this.hasMarket, this.school, this.university, this.researchCentres, this.diseases, {
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [];

  @override
  Map<String, dynamic> toMap() {
    // TODO: implement toMap
    return super.toMap();
  }
}
