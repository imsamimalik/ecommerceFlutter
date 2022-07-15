// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class WishlistItem {
  final num productId;

  WishlistItem(
    this.productId,
  );

  WishlistItem copyWith({
    num? productId,
  }) {
    return WishlistItem(
      productId ?? this.productId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productId': productId,
    };
  }

  factory WishlistItem.fromMap(Map<String, dynamic> map) {
    return WishlistItem(
      num.parse(map['productId'].toString()),
    );
  }

  String toJson() => json.encode(toMap());

  factory WishlistItem.fromJson(String source) =>
      WishlistItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'WishlistItem(id: $productId)';

  @override
  bool operator ==(covariant WishlistItem other) {
    if (identical(this, other)) return true;

    return other.productId == productId;
  }

  @override
  int get hashCode => productId.hashCode;
}
