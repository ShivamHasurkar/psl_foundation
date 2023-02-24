import 'package:flutter/material.dart';
import 'package:psl_foundation/views/widgets/appbar.dart';
class Analytics extends StatelessWidget {
  const Analytics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PFAppBar(title: "Analytics"),
      body: Container(),
    );
  }
}
