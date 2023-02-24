import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:psl_foundation/views/analytics.dart';
import 'package:psl_foundation/views/home_page.dart';
import 'package:psl_foundation/views/past_activities.dart';
import 'package:psl_foundation/views/profile.dart';

class PFBottomNavigationBar extends StatefulWidget {
  const PFBottomNavigationBar({super.key});

  @override
  State<PFBottomNavigationBar> createState() => _PFBottomNavigationBarState();
}

class _PFBottomNavigationBarState extends State<PFBottomNavigationBar> {
  int _currentIndex = 0;

  List<Widget> _screens = [
    HomePage(),
    PastActivities(),
    Analytics(),
    Profile()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            onTap: (value) => {setState(() => _currentIndex = value)},
            currentIndex: _currentIndex,
            items:  const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.house), label: "Home"),
              BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.thumbtack),
                  label: "Past Activities"),
              BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.chartLine), label: "Analytics"),
              BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.user), label: "Profile"),
            ],
        ),
    );
  }
}
