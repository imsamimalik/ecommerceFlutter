import 'dart:convert';

import 'package:ecommerceflutter/store/store.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../utils/constants.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class ProductsModel {
  static var products = [];

  // ignore: null_closures
  Item getById(num id) => products.firstWhere((prod) => prod.id == id);

  Item getByPosition(int index) => products[index];
}

class Item {
  final num id;
  final String name;
  final String desc;
  final num price;
  final num inStock;
  final String imgUrl;
  final num catId;

  Item({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.inStock,
    required this.imgUrl,
    required this.catId,
  });

  Item copyWith({
    num? id,
    String? name,
    String? desc,
    num? price,
    num? inStock,
    String? imgUrl,
    num? catId,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      price: price ?? this.price,
      inStock: inStock ?? this.inStock,
      imgUrl: imgUrl ?? this.imgUrl,
      catId: catId ?? this.catId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'inStock': inStock,
      'imgUrl': imgUrl,
      'catId': catId,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: num.parse(map['id'].toString()),
      name: map['name'] as String,
      desc: map['desc'] as String,
      price: num.parse(map['price'].toString()),
      inStock: num.parse(map['inStock'].toString()),
      imgUrl: (map['imgUrl'] as String),
      catId: num.parse(map['catId'].toString()),
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) =>
      Item.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Item(id: $id, name: $name, desc: $desc, price: $price, inStock: $inStock, imgUrl: $imgUrl, catId: $catId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Item &&
        other.id == id &&
        other.name == name &&
        other.desc == desc &&
        other.price == price &&
        other.inStock == inStock &&
        other.imgUrl == imgUrl &&
        other.catId == catId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        desc.hashCode ^
        price.hashCode ^
        inStock.hashCode ^
        imgUrl.hashCode ^
        catId.hashCode;
  }
}

class AddProduct extends VxMutation<MyStore> {
  final formData;
  final context;

  AddProduct({required this.formData, required this.context});
  @override
  perform() async {
    try {
      var response = await CONSTANTS.DIO.post(
        '/products',
        data: formData,
      );
      if (response.statusCode == 201) {
        Navigator.pop(context, 'Product added successfully');
        FetchProducts();
      }
    } catch (e) {
      print(e);
    }
  }
}

class FetchProducts extends VxMutation<MyStore> {
  @override
  perform() async {
    final response =
        await CONSTANTS.DIO.get('${CONSTANTS.API_BASE_URL}/products');

    ProductsModel.products = List.from(response.data)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
  }
}
