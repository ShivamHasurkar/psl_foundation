import 'package:flutter/material.dart';
import 'package:psl_foundation/views/widgets/appbar.dart';
class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PFAppBar(title: "Profile"),
      body: Container(),
    );
  }
}
