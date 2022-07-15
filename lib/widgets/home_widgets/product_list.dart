import 'package:ecommerceflutter/pages/product_detail.dart';
import 'package:ecommerceflutter/widgets/home_widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/Item.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddProduct, FetchProducts]);
    return ListView.builder(
        shrinkWrap: true,
        itemCount: ProductsModel.products.length,
        itemBuilder: ((context, index) {
          final Item product = ProductsModel.products[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductDetail(product: product)));
            },
            child: ProductItem(
              product: product,
            ),
          );
        }));
  }
}
