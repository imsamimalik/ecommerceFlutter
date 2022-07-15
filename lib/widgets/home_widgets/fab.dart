import 'package:ecommerceflutter/models/Item.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:dio/dio.dart';

class FAB extends StatefulWidget {
  const FAB({Key? key}) : super(key: key);

  @override
  State<FAB> createState() => _FABState();
}

class _FABState extends State<FAB> {
  final _formkey = GlobalKey<FormState>();
  late PlatformFile file;
  late String filePath;

  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final descController = TextEditingController();
  final catIdController = TextEditingController();
  final inStockController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    priceController.dispose();
    descController.dispose();
    catIdController.dispose();
    inStockController.dispose();
    super.dispose();
  }

  addProduct() async {
    if (_formkey.currentState!.validate()) {
      var formData = FormData.fromMap({
        'name': nameController.text,
        'price': priceController.text,
        'desc': descController.text,
        'inStock': inStockController.text,
        'catId': catIdController.text,
        'imgUrl': await MultipartFile.fromFile(filePath, filename: file.name),
      });
      AddProduct(formData: formData, context: context);
    }
  }

  @override
  Widget build(BuildContext context) {
    // final cart = (VxState.store as MyStore).cart;

    // return VxBuilder(
    //   builder: (context, store, status) {
    return FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Add Product'),
              content: Form(
                key: _formkey,
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                        hintText: 'Enter product name',
                        labelText: 'Product Name'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Product name cannot be empty.";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: descController,
                    decoration: const InputDecoration(
                        hintText: 'Enter product description',
                        labelText: 'Product description'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Product description cannot be empty.";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: priceController,
                    // keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        hintText: 'Enter product price',
                        labelText: 'Product price'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Product price cannot be empty.";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: inStockController,
                    // keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        hintText: 'Enter product quantity in Stock',
                        labelText: 'Product Quantity'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Product quantity cannot be empty.";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: catIdController,
                    // keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        hintText: 'Enter category id',
                        labelText: 'Category ID'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Category ID cannot be empty.";
                      }
                      return null;
                    },
                  ),
                  20.heightBox,
                  ElevatedButton(
                    onPressed: () async {
                      final result = await FilePicker.platform.pickFiles(
                        type: FileType.custom,
                        allowedExtensions: [
                          'jpg',
                          'png',
                          'jpeg',
                          'gif',
                          'webp'
                        ],
                      );
                      setState(() {
                        file = result!.files.first;
                        filePath = file.path!;
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(context
                          .theme.floatingActionButtonTheme.backgroundColor),
                      shape: MaterialStateProperty.all(const StadiumBorder()),
                    ),
                    child: 'Choose Image'.text.make(),
                  ).wh(150, 40)
                ]),
              ).p20(),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => addProduct(),
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        },
        child: const Icon(Icons.add)
        // child: const Icon(CupertinoIcons.cart, color: Colors.white),
        );

    //.badge(color: Vx.red500, count: cart.items.length, size: 20);
  }
}
