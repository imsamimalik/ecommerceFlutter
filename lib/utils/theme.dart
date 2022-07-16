import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData get lightTheme => ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.white,
        canvasColor: creamColor,
        useMaterial3: true,
        navigationBarTheme: const NavigationBarThemeData(
          height: 70,
          backgroundColor: Color(0xFFEAEAEA),
          surfaceTintColor: Color(0xFFEAEAEA),
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        ),
            
        textTheme:  TextTheme(headline1: TextStyle(color: darkBluishColor)),
        floatingActionButtonTheme:
            const FloatingActionButtonThemeData(backgroundColor: Vx.teal500),
        appBarTheme: const AppBarTheme(
            elevation: 0,
            color: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            titleTextStyle: TextStyle(color: Colors.black, fontSize: 20)),
      );

  static ThemeData get darkTheme => ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        brightness: Brightness.dark,
        cardColor: Colors.black,
        canvasColor: darkCreamColor,
        useMaterial3: true,
        navigationBarTheme: const NavigationBarThemeData(
          height: 70,
          backgroundColor: Color(0xFF111827),
          surfaceTintColor: Color(0xFF111827),
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: Vx.teal500),
        textTheme:  const TextTheme(headline1: TextStyle(color: Colors.white)),
        appBarTheme: const AppBarTheme(
            elevation: 0,
            color: Colors.white,
            iconTheme: IconThemeData(color: Colors.white),
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 20)),
      );

  static Color creamColor = const Color(0xFFEAEAEA);
  static Color darkCreamColor = Vx.gray900;
  static Color darkBluishColor = const Color(0xff403b58);
  static Color lightBluishColor = Vx.indigo500;
  static Color accentColor = Colors.teal;
}
