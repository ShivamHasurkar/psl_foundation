import 'package:flutter/material.dart';
import 'package:psl_foundation/views/registered_participants_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:psl_foundation/views/widgets/appbar.dart';
class PastActivities extends StatelessWidget {
  const PastActivities({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PFAppBar(title: "Past Activities",icon: FontAwesomeIcons.thumbtack),
      body: Container(
        child:FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RegisteredPage()),
              );
            },
        )
      ),

    );
  }
}
