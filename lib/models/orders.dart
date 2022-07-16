import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:ecommerceflutter/models/order_item.dart';

class Orders {
  final List<OrderItem> orders;

  Orders(
    this.orders,
  );

  Orders copyWith({
    List<OrderItem>? orders,
  }) {
    return Orders(
      orders ?? this.orders,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'orders': orders.map((x) => x.toMap()).toList(),
    };
  }

  factory Orders.fromMap(Map<String, dynamic> map) {
    return Orders(
      List<OrderItem>.from(
        (map['orders'] as List<int>).map<OrderItem>(
          (x) => OrderItem.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Orders.fromJson(String source) =>
      Orders.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Orders(orders: $orders)';

  @override
  bool operator ==(covariant Orders other) {
    if (identical(this, other)) return true;

    return listEquals(other.orders, orders);
  }

  @override
  int get hashCode => orders.hashCode;
}
