import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          fontFamily: 'OpenSans',
          primaryColor: kColorPrimary,
          primarySwatch: kPrimarySwatchColor,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              selectedItemColor: kColorPrimary,
              selectedIconTheme: const IconThemeData(color: kColorPrimary),
              unselectedIconTheme: IconThemeData(color: Colors.grey.shade400))),
      home: const MyHomePage(title: 'New Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) => {setState(() => _currentIndex = value)},
        currentIndex: _currentIndex,
        items: const <BottomNavigationBarItem>[
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hello World',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}
