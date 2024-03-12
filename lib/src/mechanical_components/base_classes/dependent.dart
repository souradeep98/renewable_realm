part of '../../mechanical_components.dart';

mixin Dependent on GameEntity, JsonConvertible {
  /// Periodic dependencies
  List<ItemRate> get periodicRequirements => dependencies.keys.toList();

  Map<ItemRate, List<Dependable>> get dependencies;

  @override
  Map<String, dynamic> toMap() {
    return dependenciesToMap(dependencies);
  }

  static Map<String, dynamic> dependenciesToMap(Map<ItemRate, List<Dependable>> dependencies) {
    return dependencies.map<String, dynamic>(
      (key, value) => MapEntry<String, dynamic>(
        key.toJson(),
        value.map<String>((e) => e.id).toList(),
      ),
    );
  }
}
