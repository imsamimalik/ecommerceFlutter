import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/Item.dart';
import '../../models/wishlist.dart';
import '../../models/wishlist_item.dart';
import '../../store/store.dart';

class AddToWishlist extends StatelessWidget {
  final Item item;
  const AddToWishlist({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wishlist = (VxState.store as MyStore).wishlist;
    bool isInWishlist = wishlist.ids.contains(WishlistItem(item.id));
    VxState.watch(context, on: [AddWishlist, RemoveWishlist]);

    return ElevatedButton(
      onPressed: () {
        if (!isInWishlist) {
          print('added');
          AddWishlist(item.id);
        }
        else {
          RemoveWishlist(item.id);
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Vx.rose500),
        shape: MaterialStateProperty.all(const StadiumBorder()),
      ),
      child: Container(
        child: isInWishlist
              ? const Icon(
                  FontAwesomeIcons.heartCircleMinus,
                  color: Colors.white,
                )
              : const Icon(
                  FontAwesomeIcons.heart,
                  color: Colors.white,
                )
      ),
    );
  }
}
