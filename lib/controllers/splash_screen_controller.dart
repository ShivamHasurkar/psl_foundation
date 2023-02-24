import 'dart:async';

import 'package:get/get.dart';
import 'package:psl_foundation/views/bottom_navigation_bar.dart';


class SplashScreenController extends GetxController {

  @override
  void onInit() {
    super.onInit();

    Timer(const Duration(milliseconds: 3000), () {
      Get.off(() => const PFBottomNavigationBar());
    });
  }

}