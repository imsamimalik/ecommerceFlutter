import 'package:ecommerceflutter/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';


class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: constants.accentColor,
        child: ListView(children: [
          DrawerHeader(
            padding: const EdgeInsets.all(0),
            child: UserAccountsDrawerHeader(
                accountName: 'imsamimalik'.text.make(),
                accountEmail: 'hi@imsamimalik.com'.text.make(),
                currentAccountPicture: const CircleAvatar()),
          ),
          ListTile(
            leading: const Icon(
              CupertinoIcons.home,
              color: Colors.white,
            ),
            title: 'Home'.text.white.make(),
          ),
          ListTile(
            leading: const Icon(
              CupertinoIcons.profile_circled,
              color: Colors.white,
            ),
            title: 'Profile'.text.white.make(),
          ),
          ListTile(
            leading: const Icon(
              CupertinoIcons.mail,
              color: Colors.white,
            ),
            title: 'Email'.text.white.make(),
          ),
        ]),
      ),
    );
  }
}
