import 'package:ecommerceflutter/models/User.dart';
import 'package:ecommerceflutter/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/bottom_nav.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: 'Profile'.text.makeCentered(),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              LogoutUser();
              await Navigator.pushNamedAndRemoveUntil(
                  context, MyRoutes.login, (Route<dynamic> route) => false);
            },
            child: 'Logout'.text.make(),
          ),
          ElevatedButton(
            onPressed: () async {
              await Navigator.pushNamed(context, MyRoutes.wishlist);
            },
            child: 'Wishlist'.text.make(),
          )
        ],
      ),
      bottomNavigationBar: const BottomNav(
        currentIndex: 2,
      ),
    );
  }
}
