import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../store/store.dart';

class OrdersList extends StatefulWidget {
  const OrdersList({Key? key}) : super(key: key);

  @override
  State<OrdersList> createState() => _OrdersListState();
}

class _OrdersListState extends State<OrdersList> {
  @override
  Widget build(BuildContext context) {
    var orders = (VxState.store as MyStore).orders;

    return ExpansionPanelList.radio(
      children: orders.map(
        (order) {
          return ExpansionPanelRadio(
            value: order.id,
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                title: 'Order # ${order.id}'
                    .text
                    .xl
                    .color(context.theme.primaryColor)
                    .make(),
              );
            },
            body: ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      'deliveryStatus:'.text.make(),
                      order.deliveryStatus == false
                          ? ' Pending'.text.color(Colors.red).make()
                          : ' Delivered'
                              .text
                              .color(context.theme.primaryColor)
                              .make(),
                    ],
                  ),
                  'Products: ${order.pid}'.text.make(),
                  'Amount: \$${order.totalAmount}'.text.make(),
                ],
              ),

              trailing: const Icon(Icons.delete),
              // onTap: () {
              //   setState(() {
              //     _data.removeWhere((Item currentItem) => item == currentItem);
              //   });
              // },
            ).p16(),
          );
        },
      ).toList(),
    );
  }
}
