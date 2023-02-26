import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:psl_foundation/views/calender_page.dart';

class PFAppBar extends StatelessWidget with PreferredSizeWidget {
  const PFAppBar({Key? key, required this.title, required this.icon}) : super(key: key);

  final String title;
  final IconData icon;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.5,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: FaIcon(
                  icon,
                size: 16,
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                  color: Colors.white
              ),
            ),
          ],
        ),
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        actions: <Widget>[
      Padding(
          padding: const EdgeInsets.only(right: 20.0),
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
