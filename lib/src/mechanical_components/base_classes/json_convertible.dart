part of '../../mechanical_components.dart';

abstract mixin class JsonConvertible {
  Map<String, dynamic> toMap();

  String toJson() => json.encode(toMap());

  @override
  String toString() => '$runtimeType(${toJson()})';
}
