import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/Item.dart';
import '../store/store.dart';
import '../utils/constants.dart';
import '../utils/lib.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/home_widgets/fab.dart';
import '../widgets/home_widgets/product_header.dart';
import '../widgets/home_widgets/product_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var token = (VxState.store as MyStore).token;
  final user = (VxState.store as MyStore).user;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    test();
    loadData();
  }

  loadData() async {
    final response =
        await myDio.dio.get('${constants.API_BASE_URL}/products');
    isLoading = false;
    ProductsModel.products = List.from(response.data)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  test() {
    if (kDebugMode) {
      print('home => ${user.username} => $token');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: const FAB(),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProductsHeader(),
              if (ProductsModel.products.isNotEmpty)
                const ProductsList().py16().expand()
              else
                isLoading
                    ? const CircularProgressIndicator().centered().expand()
                    : 'No products to show'.text.makeCentered().expand(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNav(
        currentIndex: 0,
      ),
    );
  }
}
