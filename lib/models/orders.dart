import 'dart:convert';

import 'package:velocity_x/velocity_x.dart';

import '../main.dart' show navigatorKey;
import '../store/store.dart';
import '../utils/lib.dart';
import '../utils/routes.dart';
class Orders {
  late num id;
  late num uid;
  late bool deliveryStatus;
  late num totalAmount;
  late List<num> pid;

  Orders({
    required this.id,
    required this.uid,
    required this.deliveryStatus,
    required this.totalAmount,

    required this.pid,
  });

  Orders.fromAPI(Map<String, dynamic> json) {
    id = num.parse(json["id"].toString());
    uid = num.parse(json["uid"].toString());
    totalAmount = num.parse(json["totalAmount"].toString());
    deliveryStatus = jsonDecode(json["deliveryStatus"]) == 1 ? true : false;
    pid = <num>[];
    (json["pid"]).forEach((v) {
      pid.add(v);
    });
  }
}

class AddOrder extends VxMutation<MyStore> {
  final List<num> pid;

  AddOrder(this.pid);

  @override
  perform() async {
    try {
      final response = await myDio.dio.post('/orders', data: {
        "pid": pid,
      });
      if (response.statusCode == 201) {
        store!.clearCart();
        navigatorKey.currentState!.pushNamed(MyRoutes.success, arguments: {
          'orderNo': response.data['order']['id'],
        });
      }
    } catch (e) {
      print(e);
    }
      
    
   
  }
}
