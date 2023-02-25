import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:psl_foundation/views/widgets/appbar.dart';
import 'package:get/get.dart';
import 'package:psl_foundation/views/widgets/custom_raised_button.dart';
import 'package:psl_foundation/views/widgets/home_screen_card.dart';

import '../constant.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PFAppBar(title: "Home", icon: FontAwesomeIcons.house),
      floatingActionButton: appMode != "USER" ? FloatingActionButton(
        onPressed: () {},
        child: const Text(
          "+",
          style: TextStyle(
            fontSize: 30,
            color: Colors.white
          ),
        ),
      ) : Container(),
      body: ListView.builder(
        itemCount: 5,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(8.0),
        itemBuilder: (BuildContext context, index) {
          return PFHomeScreenCard();
        },
      ),
    );
  }
}
