import 'package:velocity_x/velocity_x.dart';

import '../store/store.dart';

class Wishlist {
  final List<num> ids;

  Wishlist(this.ids);
}

class AddWishlist extends VxMutation<MyStore> {
  final num id;

  AddWishlist(this.id);
  @override
  perform() {
    store?.wishlist.ids.add(id);
  }
}

class RemoveWishlist extends VxMutation<MyStore> {
  final num id;

  RemoveWishlist(this.id);
  @override
  perform() {
    store?.wishlist.ids.remove(id);
  }
}

