import 'package:ecommerceflutter/models/Item.dart';
import 'package:ecommerceflutter/store/store.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  late ProductsModel _cartProducts;

  final List<num> _productIds = [];

  ProductsModel get products => _cartProducts;

  set products(ProductsModel newModal) {
    _cartProducts = newModal;
  }

  List<Item> get items =>
      _productIds.map((id) => _cartProducts.getById(id)).toList();

  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);
}

class AddCart extends VxMutation<MyStore> {
  final Item item;

  AddCart(this.item);
  @override
  perform() {
    store?.cart._productIds.add(item.id);
  }
}

class RemoveCart extends VxMutation<MyStore> {
  final Item item;

  RemoveCart(this.item);
  @override
  perform() {
    store?.cart._productIds.remove(item.id);
  }
}
