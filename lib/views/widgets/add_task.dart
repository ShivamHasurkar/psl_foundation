import 'package:flutter/material.dart';
import 'package:psl_foundation/views/widgets/custom_raised_button.dart';
class AddTask extends StatelessWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(20.0)), //this right here
      child: Container(
        height: 200,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'What do you want to remember?'),
              ),
              SizedBox(
                width: 320.0,
                child: PFRaisedButton(title: "Submit", onPressed: ()=>{})
              )
            ],
          ),
        ),
      ),
    );
  }
}
