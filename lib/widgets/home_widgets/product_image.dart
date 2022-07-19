import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../utils/constants.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    return Image.network('${constants.imgURL}$image')
        .box
        .rounded
        .p4
        .color(context.canvasColor)
        .make()
        .p16()
        .w32(context);
  }
}
