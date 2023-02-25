import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:psl_foundation/constant.dart';
import 'package:psl_foundation/views/login_screen.dart';
import 'package:psl_foundation/views/widgets/appbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:psl_foundation/views/widgets/custom_raised_button.dart';
import 'package:get/get.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  late final box;

  @override
  void initState() {
    super.initState();
    box = GetStorage();
  }

  logout() {
    box.erase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PFAppBar(title: "Profile", icon: FontAwesomeIcons.user),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Employee ID: ${kEmpID}'
              ),
            ],
          ),

          PFRaisedButton(
            title: "Logout",
            onPressed: () {
              logout();
              Get.off(() => LoginScreen());
            },
            width: 100,
          ),
        ],
      ),
    );
  }
}
