import 'dart:convert';

import 'package:flutter/foundation.dart';

class OrderItem {
  final num id;
  final List<num> pid;

  OrderItem(
    this.id,
    this.pid,
  );

  OrderItem copyWith({
    num? id,
    List<num>? pid,
  }) {
    return OrderItem(
      id ?? this.id,
      pid ?? this.pid,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'pid': pid,
    };
  }

  factory OrderItem.fromMap(Map<String, dynamic> map) {
    return OrderItem(
      map['id'] as num,
      List<num>.from(
        (map['pid'] as List<num>),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderItem.fromJson(String source) =>
      OrderItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'OrderItem(id: $id, pid: $pid)';

  @override
  bool operator ==(covariant OrderItem other) {
    if (identical(this, other)) return true;

    return other.id == id && listEquals(other.pid, pid);
  }

  @override
  int get hashCode => id.hashCode ^ pid.hashCode;
}
