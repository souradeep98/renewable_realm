part of '../../mechanical_components.dart';

mixin Dependable on GameEntity, JsonConvertible, PeriodicExecutor {
  List<Item> get consumables => supplies.keys.toList();

  Map<Item, List<Dependent>> get supplies;

  @override
  Map<String, dynamic> toMap() {
    return suppliesToMap(supplies);
  }

  static Map<String, dynamic> suppliesToMap(
    Map<Item, List<Dependent>> supplies,
  ) {
    return supplies.map<String, dynamic>(
      (key, value) => MapEntry<String, dynamic>(
        key.toJson(),
        value.map<String>((e) => e.id).toList(),
      ),
    );
  }

  @override
  void execute() {
    for (final MapEntry<Item, List<Dependent>> entry in supplies.entries) {
      final Item itemAmount = entry.key;

      for (final Dependent dependent in entry.value) {
        
      }
    }
  }
}
