import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:psl_foundation/constant.dart';
import 'package:psl_foundation/services/EmployeeFunctions.dart';
import 'package:psl_foundation/views/widgets/appbar.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:psl_foundation/views/widgets/custom_raised_button.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../Data/task.dart';

class RegisterForActivity extends StatefulWidget {
  final List<dynamic> tasks;
  var activityData;
  RegisterForActivity({Key? key,required this.tasks, required this.activityData}) : super(key: key);

  @override
  State<RegisterForActivity> createState() => _RegisterForActivityState();
}

class _RegisterForActivityState extends State<RegisterForActivity> {

  final GlobalKey<FormBuilderState> _selectTaskKey = GlobalKey<FormBuilderState>();

  void storeData(int employeeId, var activity, String taskID) async {
    print("Here in Function");
    EmployeeFunctions employeeFunctions = EmployeeFunctions();
    await employeeFunctions.registerActivity(employeeId: employeeId, activity: activity, taskID: taskID);
  }

  @override
  void initState() {
    super.initState();
    // getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PFAppBar(title: "Volunteer For Activity", icon: FontAwesomeIcons.plus,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FormBuilder(
                key: _selectTaskKey,
              child: FormBuilderCheckboxGroup(name: "selected_task",

                  orientation: OptionsOrientation.vertical,
                  options: List<FormBuilderFieldOption>.generate(widget.tasks.length,
                      (index){
                        return FormBuilderFieldOption(value: widget.tasks[index]['Task_id'],
                               child: Text(widget.tasks[index]['Title']),
                              );
                      })),
            ),
            PFRaisedButton(title: "Register", onPressed: (){
              // bool? isValid = _selectTaskKey.currentState?.isValid;
              // if (isValid! ) {

                _selectTaskKey.currentState?.save();
               List<dynamic> arrayTask =  _selectTaskKey.currentState?.value['selected_task'];
               arrayTask.forEach((element) {
                 print("here");
                 storeData(int.parse(kEmpID), widget.activityData, element);
               });
                print(_selectTaskKey.currentState?.value);
                Get.back();
                // storeData(int.parse(kEmpID), , taskID)


                // activityData
              // } else {
              //   Get.snackbar("Please enter all values", "message",
              //       snackPosition: SnackPosition.BOTTOM);
              // }
            })
          ],
        ),
      ),
    );
  }
}
