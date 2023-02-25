import 'package:flutter/material.dart';
import 'package:psl_foundation/views/calender_page.dart';

class PFAppBar extends StatelessWidget with PreferredSizeWidget {
  const PFAppBar({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(title: Text(title), actions: <Widget>[
      Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CalenderPage()),
              );
            },
            child: const Icon(
              Icons.edit_calendar_rounded,
              size: 26.0,
            ),
          )),
    ]);
  }
}
