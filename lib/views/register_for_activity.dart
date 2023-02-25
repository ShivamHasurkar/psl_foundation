import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:psl_foundation/views/widgets/appbar.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../Data/task.dart';

class RegisterForActivity extends StatefulWidget {
  final List<Task> tasks;
  const RegisterForActivity({Key? key,required this.tasks}) : super(key: key);

  @override
  State<RegisterForActivity> createState() => _RegisterForActivityState();
}

class _RegisterForActivityState extends State<RegisterForActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PFAppBar(title: "Volunteer For Activity", icon: FontAwesomeIcons.plus,),
      body: SingleChildScrollView(
        child: FormBuilder(
          child: Column(
            children: [
              FormBuilderRadioGroup(name: "selected_task", options: List<FormBuilderFieldOption>.generate(
                  widget.tasks.length, (index) {
                return FormBuilderFieldOption(value: widget.tasks[index].taskId,
                 child: Text(widget.tasks[index].title!),
                );
              }))
            ],
          ),
        ),
      ),
    );
  }
}
