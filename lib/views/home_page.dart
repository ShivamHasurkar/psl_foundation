import 'package:flutter/material.dart';
import 'package:psl_foundation/views/widgets/appbar.dart';
import 'package:get/get.dart';
import 'package:psl_foundation/views/widgets/custom_raised_button.dart';

import '../constant.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PFAppBar(title: "Home"),
      body: Container(),
    );
  }
}
