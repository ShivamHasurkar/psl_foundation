import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:psl_foundation/constant.dart';
import 'package:psl_foundation/services/HomeScreenFunctions.dart';
import 'package:psl_foundation/views/registered_participants_page.dart';
import 'package:psl_foundation/views/widgets/appbar.dart';
import 'package:psl_foundation/views/register_for_activity.dart';
import 'package:psl_foundation/views/widgets/custom_raised_button.dart';

import '../Data/task.dart';
import '../services/EmployeeFunctions.dart';

class ViewActivityPage extends StatefulWidget {
  var activityData;
  ViewActivityPage({required this.activityData});

  @override
  _ViewActivityPageState createState() => _ViewActivityPageState();
}

class _ViewActivityPageState extends State<ViewActivityPage> {
  bool? isHeartIconTapped = false;
  // bool activityType = widget.activityData[""]; //assign directly from database

  String isDonationActivity() {
    if (appMode == "Admin") {
      return "See Registered Participants";
    } else {
      if (widget.activityData["Activity_Type"] == "Donation Drive") {
        return "Donate";
      } else {
        print(widget.activityData["Task"][0]);
        return "Volunteer";
      }
    }
  }

  void storeData(String employeeId, var activity, int amountDonated) async {
    print("Here in Function");
    EmployeeFunctions employeeFunctions = EmployeeFunctions();
    await employeeFunctions.registerDonation(employeeId: employeeId, activity: activity, amountDonated: amountDonated);
  }

  void onHeartIconTapped() {
    setState(() {
      isHeartIconTapped = !isHeartIconTapped!;
    });
  }

  final GlobalKey<FormBuilderState> _donationAmountKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PFAppBar(
        title: "Activity",
        icon: Icons.local_activity,
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              physics: BouncingScrollPhysics(),
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 28),
                        child: Hero(
                          tag: "Activity Title",
                          child: Material(
                            color: Colors.transparent,
                            child: Text(widget.activityData["Title"],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 34,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 28),
                  child: Text(
                    widget.activityData["Activity_Type"],
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.7),
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                ),
                SizedBox(height: 25),
                SizedBox(
                  height: 279,
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: [
                      SizedBox(width: 28),
                      Container(
                        height: 280,
                        width: 280,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image:
                                AssetImage("assets/images/psl_activty_img.jpg"),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Container(
                        height: 280,
                        width: 280,
                        decoration: BoxDecoration(
                          color: kColorPrimary,
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              "assets/images/psl_activty_img2.jpg",
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 32),
                Padding(
                  padding: EdgeInsets.only(left: 28),
                  child: Row(
                    children: [
                      Container(
                        height: 42,
                        width: 42,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white.withOpacity(0.1),
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () async {
                            onHeartIconTapped();
                            HomeScreenFunctions temp =
                                new HomeScreenFunctions();
                            await temp.addLike(
                                empId: kEmpID,
                                activityId: widget.activityData["Activity_Id"]);
                          },
                          child: Icon(
                            FontAwesomeIcons.handsClapping,
                            color: isHeartIconTapped!
                                ? kColorPrimary
                                : Colors.grey,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 42,
                        width: 42,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black, width: 1),
                          color: Colors.white.withOpacity(0.1),
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {
                            // onHeartIconTapped();
                          },
                          child: Icon(
                            FontAwesomeIcons.whatsapp,
                            color: Colors.green,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 42,
                        width: Get.width * 0.4,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white.withOpacity(0.1),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                  widget.activityData["Lives_Touched"]
                                      .toString(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                            ),
                            SizedBox(
                              width: Get.width * 0.03,
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Text("Lives Touched",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12)),
                            ),
                          ],
                        ),
                      ),
                      // SizedBox(
                      //   width: 20,
                      // ),
                      // Container(
                      //   height: 42,
                      //   width: 105,
                      //   decoration: BoxDecoration(
                      //     border: Border.all(color: Colors.black, width: 1),
                      //     borderRadius: BorderRadius.circular(10),
                      //     color: Colors.white.withOpacity(0.1),
                      //   ),
                      //   child: Row(
                      //     children: const <Widget>[
                      //       Padding(
                      //         padding: EdgeInsets.only(left: 10),
                      //         child: Text("18",
                      //             style: TextStyle(
                      //                 color: Colors.black,
                      //                 fontWeight: FontWeight.bold,
                      //                 fontSize: 20)),
                      //       ),
                      //       Spacer(
                      //         flex: 2,
                      //       ),
                      //       Padding(
                      //         padding: EdgeInsets.only(right: 5),
                      //         child: Text("Registered\nParticipants",
                      //             style: TextStyle(
                      //                 color: Colors.black,
                      //                 fontWeight: FontWeight.w100,
                      //                 fontSize: 10)),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(50.0)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        child: Row(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.locationDot,
                              size: 14,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              widget.activityData["Location"],
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(50.0)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      child: Row(
                        children: [
                          const FaIcon(
                            FontAwesomeIcons.calendar,
                            size: 14,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            widget.activityData["Date"].toString(),
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.only(left: 28, right: 28),
                  child: Text(
                    "Activity Owner: ${widget.activityData["Activity_Owner"]}",
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.7),
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.only(left: 28, right: 28, bottom: 80),
                  child: Text(
                    widget.activityData["Description"],
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.7),
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 87,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 0, 0, 0),
                    gradient: LinearGradient(
                        stops: [
                          0,
                          1
                        ],
                        colors: [
                          Color(0xff121421),
                          Colors.transparent,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter)),
                child: Center(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () async {
                        if (appMode == "Admin") {
                          Get.to(() => RegisteredPage());
                        } else {
                          if (widget.activityData["Activity_Type"] ==
                              "Donation Drive") {
                            final task = await Get.bottomSheet(
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom:
                                    MediaQuery.of(context).viewInsets.bottom,
                                    top: kDefaultSpace,
                                    right: kDefaultSpace,
                                    left: kDefaultSpace
                                ),

                                child: SingleChildScrollView(
                                  child: FormBuilder(
                                    key: _donationAmountKey,
                                    child: Column(children: [
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 5),
                                        child: FormBuilderTextField(
                                          name: "Donation_Amount",
                                          autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                          decoration: const InputDecoration(
                                              labelText: "Add Donation Amount",
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      width: 1.5,
                                                      color: Colors.black26))),
                                          validator:
                                          FormBuilderValidators.compose([
                                            FormBuilderValidators.required()
                                          ]),
                                        ),
                                      ),
                                      SizedBox(height: 20,),
                                      PFRaisedButton(title: "Add Task",
                                          onPressed: (){
                                            _donationAmountKey.currentState?.saveAndValidate();
                                            storeData(kEmpID, widget.activityData, int.parse(_donationAmountKey.currentState?.fields['Donation_Amount']?.value));
                                            Get.back();
                                          }),
                                      SizedBox(height: 10,)
                                    ]),),
                                ),
                              ),
                              backgroundColor: Colors.white,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    topLeft: Radius.circular(10)
                                ),
                              ),

                            );
                          } else {
                            Get.to(() => RegisterForActivity(tasks: widget.activityData['Task'], activityData: widget.activityData,));
                          }
                        }
                      },
                      child: Ink(
                        decoration: BoxDecoration(
                          color: kColorPrimary,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Container(
                          height: 56,
                          width: 319,
                          child: Center(
                              child: Text(
                            isDonationActivity(),
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
