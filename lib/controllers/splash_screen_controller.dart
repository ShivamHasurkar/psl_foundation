import 'dart:async';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:psl_foundation/constant.dart';
import 'package:psl_foundation/views/bottom_navigation_bar.dart';
import 'package:psl_foundation/views/home_page.dart';
import 'package:psl_foundation/views/login_screen.dart';


class SplashScreenController extends GetxController {

  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();

    if (box.read('userType') != null) {
      appMode = box.read('userType');
      kEmpID = box.read('empId');
    }

    Timer(const Duration(milliseconds: 3000), () {

      if (appMode != "") {
        Get.off(() => PFBottomNavigationBar());
      } else {
        Get.off(() => LoginScreen());
      }

    });
  }

}