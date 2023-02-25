import 'package:flutter/material.dart';
import 'package:psl_foundation/views/widgets/appbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PFAppBar(title: "Profile", icon: FontAwesomeIcons.user),
      body: Container(),
    );
  }
}
