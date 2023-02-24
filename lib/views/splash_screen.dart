import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../controllers/splash_screen_controller.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  SplashScreenController splashScreenController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: SvgPicture.asset(
            'assets/images/foundation-logo-updated.svg'
          ),
        ),
      ),
    );
  }
}
