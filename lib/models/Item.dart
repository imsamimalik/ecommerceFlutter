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
  final String productName;
  final String desc;
  final num price;
  final num inStock;
  final String imgUrl;
  final num catId;
  final String catName;

  Item({
    required this.id,
      required this.productName,
    required this.desc,
    required this.price,
    required this.inStock,
    required this.imgUrl,
    required this.catId,
      required this.catName
  });

  Item copyWith({
    num? id,
      String? productName,
    String? desc,
    num? price,
    num? inStock,
    String? imgUrl,
    num? catId,
      String? catName
  }) {
    return Item(
      id: id ?? this.id,
        productName: productName ?? this.productName,
      desc: desc ?? this.desc,
      price: price ?? this.price,
      inStock: inStock ?? this.inStock,
      imgUrl: imgUrl ?? this.imgUrl,
      catId: catId ?? this.catId,
        catName: catName ?? this.catName
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'productName': productName,
      'desc': desc,
      'price': price,
      'inStock': inStock,
      'imgUrl': imgUrl,
      'catId': catId,
      'catName': catName
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: num.parse(map['id'].toString()),
      productName: map['productName'] as String,
      desc: map['desc'] as String,
      price: num.parse(map['price'].toString()),
      inStock: num.parse(map['inStock'].toString()),
      imgUrl: (map['imgUrl'] as String),
      catId: num.parse(map['catId'].toString()),
      catName: map['catName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) =>
      Item.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Item(id: $id, productName: $productName, desc: $desc, price: $price, inStock: $inStock, imgUrl: $imgUrl, catId: $catId, catName:$catName)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Item &&
        other.id == id &&
        other.productName == productName &&
        other.desc == desc &&
        other.price == price &&
        other.inStock == inStock &&
        other.imgUrl == imgUrl &&
        other.catId == catId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        productName.hashCode ^
        desc.hashCode ^
        price.hashCode ^
        inStock.hashCode ^
        imgUrl.hashCode ^
        catId.hashCode ^
        catName.hashCode;
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
