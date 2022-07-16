import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileMenu extends StatefulWidget {
  final text;
  final IconData icon;
  const ProfileMenu({super.key, required this.text, required this.icon});

  @override
  State<ProfileMenu> createState() => _ProfileMenuState();
}

class _ProfileMenuState extends State<ProfileMenu> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(backgroundColor: Vx.teal50),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(widget.icon),
          '${widget.text}'.text.black.makeCentered(),
          const Icon(FontAwesomeIcons.arrowRight),
        ],
      ).p16(),
    ).py16().px32();
  }
}
