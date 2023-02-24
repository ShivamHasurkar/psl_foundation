import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constant.dart';
import 'views/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          fontFamily: 'OpenSans',
          primaryColor: kColorPrimary,
          primarySwatch: kPrimarySwatchColor,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              selectedItemColor: kColorPrimary,
              selectedIconTheme: const IconThemeData(color: kColorPrimary),
              unselectedIconTheme: IconThemeData(color: Colors.grey.shade400))),
      home: SplashScreen(),
    );
  }
}

