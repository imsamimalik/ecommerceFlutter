// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerceflutter/widgets/home_widgets/add_to_cart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:ecommerceflutter/widgets/home_widgets/product_image.dart';

import '../../models/Item.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Item product;

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 250,
            ),
            child: Hero(
              tag: Key(product.id.toString()),
              child: ProductImage(image: product.imgUrl),
            )),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            product.name.text.bold.lg
                .color(context.theme.textTheme.headline1!.color)
                .make(),
            product.desc.text.textStyle(context.captionStyle).make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$${product.price}".text.bold.make(),
                AddToCart(item: product)
              ],
            ).pOnly(right: 8)
          ],
        ))
      ],
    )).color(context.cardColor).square(150).rounded.make().py16();
  }
}
