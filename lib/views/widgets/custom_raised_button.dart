import 'package:flutter/material.dart';
import '../../constant.dart';

class PFRaisedButton extends StatelessWidget {
  const PFRaisedButton({Key? key, required this.title, required this.onPressed, this.height = 50, this.width = double.infinity}) : super(key: key);

  final String title;
  final double height;
  final double width;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kColorPrimary,
      elevation: 2,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onPressed,
        child: Container(
          height: height,
          width: width,
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
