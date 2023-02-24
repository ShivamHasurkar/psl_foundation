import 'package:flutter/material.dart';
class PFAppBar extends StatelessWidget with PreferredSizeWidget {
  const PFAppBar({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title
      ),
    );
  }
}
