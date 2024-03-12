// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../../mechanical_components.dart';

abstract class Item extends Equatable with JsonConvertible {
  final String itemID;

  const Item({
    required this.itemID,
  });

  @mustCallSuper
  @override
  List<Object?> get props => [itemID];

  @override
  @mustCallSuper
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'itemID': itemID,
    };
  }
}

class ItemAmount extends Item {
  final int amount;

  const ItemAmount({
    required super.itemID,
    required this.amount,
  });

  ItemAmount copyWith({
    String? itemID,
    int? amount,
  }) {
    return ItemAmount(
      itemID: itemID ?? this.itemID,
      amount: amount ?? this.amount,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      ...super.toMap(),
      'amount': amount,
    };
  }

  factory ItemAmount.fromMap(Map<String, dynamic> map) {
    return ItemAmount(
      itemID: map['itemID'] as String,
      amount: map['amount'] as int,
    );
  }

  factory ItemAmount.fromJson(String source) =>
      ItemAmount.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object?> get props => [...super.props, amount];
}

class ItemRate<T extends num> extends Item {
  final Rate<T> rate;

  const ItemRate({
    required super.itemID,
    required this.rate,
  });

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      ...super.toMap(),
      'rate': rate.toMap(),
    };
  }

  factory ItemRate.fromMap(Map<String, dynamic> map) {
    return ItemRate(
      itemID: map['itemID'] as String,
      rate: Rate.fromMap(map['rate'] as Map<String, dynamic>),
    );
  }

  factory ItemRate.fromJson(String source) =>
      ItemRate.fromMap(json.decode(source) as Map<String, dynamic>);

  ItemRate<T> copyWith({
    String? itemID,
    Rate<T>? rate,
  }) {
    return ItemRate(
      itemID: itemID ?? this.itemID,
      rate: rate ?? this.rate,
    );
  }

  @override
  List<Object?> get props => [...super.props, rate];
}
