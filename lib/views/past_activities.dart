import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:psl_foundation/views/activity_specific_analytic_page.dart';
import 'package:psl_foundation/views/widgets/appbar.dart';
import 'package:psl_foundation/views/widgets/custom_raised_button.dart';
import 'package:get/get.dart';

class PastActivities extends StatelessWidget {
  const PastActivities({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PFAppBar(title: "Past Activities", icon: FontAwesomeIcons.thumbtack),
      body: PFRaisedButton( //Added for temporary purpose
        title: "Temp",
        onPressed: () {
          Get.to(() => ActivitySpecificAnalyticPage());
        },
        width: 100,
      ),
    );
  }
}
