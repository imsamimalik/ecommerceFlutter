// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:velocity_x/velocity_x.dart';

import '../store/store.dart';
import '../utils/constants.dart';
import 'wishlist_item.dart';

class WishlistModel {
  final List<WishlistItem> ids;

  WishlistModel(
    this.ids,
  );

  add(value) {
    ids.add(WishlistItem(value));
  }

  remove(value) {
    ids.remove(WishlistItem(value));
  }

  WishlistModel copyWith({
    List<WishlistItem>? ids,
  }) {
    return WishlistModel(
      ids ?? this.ids,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ids': ids.map((x) => x.toMap()).toList(),
    };
  }

  factory WishlistModel.fromMap(Map<String, dynamic> map) {
    return WishlistModel(
      List<WishlistItem>.from(
        (map['ids'] as List<int>).map<WishlistItem>(
          (x) => WishlistItem.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory WishlistModel.fromJson(String source) =>
      WishlistModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Wishlist(ids: $ids)';

  @override
  bool operator ==(covariant WishlistModel other) {
    if (identical(this, other)) return true;

    return listEquals(other.ids, ids);
  }

  @override
  int get hashCode => ids.hashCode;
}


class AddWishlist extends VxMutation<MyStore> {
  final num id;
  
  AddWishlist(this.id);
  @override
  perform() async {
    store?.wishlist.add(id);
    final response =
        await CONSTANTS.DIO.post('/wishlist/add', data: {'productId': id});

    if (response.statusCode == 201) {
      if (kDebugMode) {
        print('added to db');
      }
    }



  }
}

class RemoveWishlist extends VxMutation<MyStore> {
  final num id;

  RemoveWishlist(this.id);
  @override
  perform() async {
    store?.wishlist.remove(id);

    final response = await CONSTANTS.DIO.delete('/wishlist/$id');

    if (response.statusCode == 200) {
      if (kDebugMode) {
        print('removed from db');
      }
    }
  }
}

