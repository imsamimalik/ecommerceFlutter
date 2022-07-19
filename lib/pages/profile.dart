import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/User.dart';
import '../store/store.dart';
import '../utils/routes.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/profile_widgets/profile_menu.dart';
import '../utils/lib.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: VxAppBar(
        backgroundColor: Colors.transparent,
        title: VxAppBarTitleBar(child: 'Profile'.text.black.makeCentered()),
        actions: [
          IconButton(
            icon: const Icon(FontAwesomeIcons.arrowRightFromBracket),
            onPressed: () async {
              await myDio.dio.post('/logout');
              LogoutUser();
              
              await Navigator.pushNamedAndRemoveUntil(
                  context, MyRoutes.login, (Route<dynamic> route) => false);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('assets/images/imsamimalik.jpg'),
              ).circle().p20(),
              (VxState.store as MyStore).user.name.text.xl2.bold.make(),
              (VxState.store as MyStore).user.email.text.make(),
              (VxState.store as MyStore).user.username.text.make(),
              (VxState.store as MyStore).user.address.text.make(),
              (VxState.store as MyStore).user.walletBalance.text.make(),
              20.heightBox,
              Column(
                children: [
                  ProfileMenu(
                    text: "Account",
                    icon: FontAwesomeIcons.circleUser,
                      route: MyRoutes.home
                  ),
                  ProfileMenu(
                    text: "Orders",
                    icon: FontAwesomeIcons.listCheck,
                      route: MyRoutes.orders
                  ),
                  ProfileMenu(
                    text: "Reviews",
                    icon: FontAwesomeIcons.starHalfStroke,
                      route: MyRoutes.home
                  ),
                  ProfileMenu(
                    text: "Help Cemter",
                    icon: FontAwesomeIcons.comments,
                      route: MyRoutes.home
                  ),
                  ProfileMenu(
                    text: "Admin Panel",
                    icon: FontAwesomeIcons.userLock,
                      route: MyRoutes.home
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNav(
        currentIndex: 3,
      ),
    );
  }
}
