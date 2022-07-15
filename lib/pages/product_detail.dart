import 'package:ecommerceflutter/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:ecommerceflutter/models/Item.dart';
import 'package:velocity_x/velocity_x.dart';

import '../utils/constants.dart';
import '../widgets/product_widgets/bottom_bar.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Item product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: BottomButtonBar(item: product, price: product.price),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(product.id.toString()),
              child: Image.network('${CONSTANTS.imgURL}${product.imgUrl}'),
            ).h32(context),
            Expanded(
                child: VxArc(
              height: 30,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                width: context.screenWidth,
                color: context.cardColor,
                child: Column(
                  children: [
                    product.name.text.bold.xl4
                        .color(MyTheme.darkBluishColor)
                        .make(),
                    product.desc.text.xl.textStyle(context.captionStyle).make(),
                    10.heightBox,
                    "Sit lorem invidunt aliquyam sanctus magna, aliquyam sit at nonumy ipsum, diam sadipscing aliquyam lorem amet. Vero justo dolor justo kasd amet, lorem lorem amet erat justo elitr vero rebum dolores voluptua. Sit aliquyam kasd gubergren voluptua accusam, eirmod dolores sit at amet eos, sit duo nonumy clita no, lorem."
                        .text
                        .make()
                        .p16()
                  ],
                ).py64(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}