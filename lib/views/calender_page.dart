import 'package:flutter/material.dart';
import 'package:psl_foundation/views/widgets/appbar.dart';

class CalenderPage extends StatelessWidget {
  const CalenderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PFAppBar(title: "Calender"),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
                leading: const Text(
                  "Date of \n the Activity",
                  style: TextStyle(color: Colors.black, fontSize: 5),
                ),
                title: Text("Title of the Activity $index"),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () {
                  //Push to specific View Activity Page.
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => const CalenderPage()),
                  // );
                });
          }),
    );
  }
}

// Can be upgraded to this if we have time.
// https://pub.dev/packages/syncfusion_flutter_calendar