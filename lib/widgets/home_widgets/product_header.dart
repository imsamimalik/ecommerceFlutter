import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';


class ProductsHeader extends StatelessWidget {
  const ProductsHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        'ecommerce'.text.xl5.bold.color(context.theme.textTheme.headline1!.color).make(),
        'Trending Products'.text.make()
      ],
    );
  }
}
