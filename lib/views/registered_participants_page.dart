import 'package:flutter/material.dart';
import 'package:psl_foundation/constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:psl_foundation/services/ActivitySpecificAnalyticsFunctions.dart';
import 'package:psl_foundation/services/EmployeeFunctions.dart';
import 'package:psl_foundation/views/widgets/appbar.dart';

class RegisteredPage extends StatefulWidget {
  var activityId;
  RegisteredPage(this.activityId);

  @override
  State<RegisteredPage> createState() => _RegisteredPageState();
}

class _RegisteredPageState extends State<RegisteredPage> {
  List empIdList = [];
  List empList = [];
  @override
  void initState() {
    // TODO: implement initState
    setList();
  }

  setList() async {
    EmployeeFunctions empFunc = new EmployeeFunctions();
    empIdList = await asaf.fetchParticipatedEmployeeList(widget.activityId);
    for (int empId in empIdList) {
      var temp = await empFunc.fetchEmployee(employeeId: empId.toString());
      //print(temp);
      empList.add(temp);
    }
    print(empList.length);
    setState(() {});
  }

  ActivitySpecificAnalyticsFunctions asaf =
      new ActivitySpecificAnalyticsFunctions();

  // List<>
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PFAppBar(
          title: "Registered Participants", icon: FontAwesomeIcons.calendar),
      body: Align(
        alignment: Alignment.topLeft,
        child: Container(
          margin: EdgeInsets.all(kDefaultSpace),
          child: ListView.builder(
              itemCount: empList.length,
              //itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 5.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      tileColor: Colors.white,
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/avtar_image.jpg'),
                      ),
                      title: Text(
                        empList[index]["First_Name"] +
                            " " +
                            empList[index]["Last_Name"],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'BU: ' + empList[index]["BU"],
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            'Grade\t: ' + empList[index]["Grade"],
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),

                    //ListTile
                  ),
                );
              }),
        ),
      ),
    );
  }
}
