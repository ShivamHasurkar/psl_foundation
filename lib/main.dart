import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'constant.dart';
import 'views/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
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
