// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../mechanical_components.dart';

abstract class House with Buildable {
  final int model;

  const House({
    required this.model,
  });

  static const List<House> models = [
    House1(),
    House2(),
    House3(),
    House4(),
  ];

  String get asset => "Residence$model@3x.png";

  int get acomodationPlaces;

  String get id => "House $model";
}

class House1 extends House {
  const House1() : super(model: 1);

  @override
  int get acomodationPlaces => 4;

  @override
  Set<ItemAmount> get buildRequirements => {
        const ItemAmount(itemID: "Money", amount: 20000),
        const ItemAmount(itemID: "Wood", amount: 1000),
        const ItemAmount(itemID: "Iron", amount: 200),
      };
}

class House2 extends House {
  const House2() : super(model: 2);

  @override
  int get acomodationPlaces => 8;

  @override
  Set<ItemAmount> get buildRequirements => {
        const ItemAmount(itemID: "Money", amount: 35000),
        const ItemAmount(itemID: "Wood", amount: 2000),
        const ItemAmount(itemID: "Iron", amount: 500),
      };
}

class House3 extends House {
  const House3() : super(model: 3);

  @override
  int get acomodationPlaces => 18;

  @override
  Set<ItemAmount> get buildRequirements => {
        const ItemAmount(itemID: "Money", amount: 60000),
        const ItemAmount(itemID: "Wood", amount: 4000),
        const ItemAmount(itemID: "Iron", amount: 1000),
      };
}

class House4 extends House {
  const House4() : super(model: 4);

  @override
  int get acomodationPlaces => 3;

  @override
  Set<ItemAmount> get buildRequirements => {
        const ItemAmount(itemID: "Money", amount: 20000),
        const ItemAmount(itemID: "Wood", amount: 1000),
        const ItemAmount(itemID: "Iron", amount: 200),
      };
}
