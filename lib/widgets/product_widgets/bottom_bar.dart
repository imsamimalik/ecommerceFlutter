// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerceflutter/widgets/product_widgets/add_to_wishlist.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:ecommerceflutter/widgets/home_widgets/add_to_cart.dart';

import '../../models/Item.dart';

class BottomButtonBar extends StatefulWidget {
final Item item;
  const BottomButtonBar({
    Key? key,
    required this.item,
    required this.price,
  }) : super(key: key);
  final num price;

  @override
  State<BottomButtonBar> createState() => _BottomButtonBarState();
}

class _BottomButtonBarState extends State<BottomButtonBar> {
  

  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.spaceBetween,
      buttonPadding: EdgeInsets.zero,
      children: [
        "\$${widget.price}".text.bold.red800.xl4.make(),
        AddToWishlist(item: widget.item).wh(80, 40),
        AddToCart(item: widget.item,).wh(80, 40),
      ],
    ).p32();
  }
}
