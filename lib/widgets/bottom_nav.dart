// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../utils/routes.dart';

class BottomNav extends StatefulWidget {
  final int currentIndex;
  const BottomNav({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (_selectedIndex) {
        case 0:
          Navigator.pushNamed(context, MyRoutes.home);
          break;
        case 1:
          Navigator.pushNamed(context, MyRoutes.cart);
          break;
        case 2:
          Navigator.pushNamed(context, MyRoutes.wishlist);
          break;
        case 3:
          Navigator.pushNamed(context, MyRoutes.profile);
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(Icons.shopping_cart_rounded),
          label: 'Cart',
        ),
        NavigationDestination(
          icon: Icon(Icons.favorite_rounded),
          label: 'Wishlist',
        ),
        NavigationDestination(
          icon: Icon(Icons.person_rounded),
          label: 'Profile',
        ),
      ],
      selectedIndex: widget.currentIndex,
      animationDuration: const Duration(milliseconds: 200),
      onDestinationSelected: _onItemTapped,
    );
  }
}
