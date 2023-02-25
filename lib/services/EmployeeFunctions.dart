import 'package:cloud_firestore/cloud_firestore.dart';

class EmployeeFunctions {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  fetchEmployee({required String employeeId}) async {
    DocumentReference documentReference =
        firestore.collection('employee').doc(employeeId);

    var docSnapshot = await documentReference.get();
    var employee = docSnapshot.data() as Map<String, dynamic>;
    return employee;
  }

  fetchAllEmployees() async {
    QuerySnapshot querySnapshot = await firestore.collection('employee').get();
    final allEmployees = querySnapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
    return allEmployees;
  }

  registerActivity(
      {required int employeeId,
      required var activity,
      required String taskID}) async {
    var emp = await fetchEmployee(employeeId: employeeId.toString());
    int currentPoints = emp["Lives_Touched"];
    emp["Lives_Touched"] = currentPoints + activity["Lives_Touched"];
    (emp["Activity_Id"] as List).add(activity["Activity_Id"]);

    await firestore.collection("employee").doc(employeeId.toString()).set(emp);

    (activity["Registered_Employees"] as List).add(employeeId);
    for (var task in (activity["Task"] as List)) {
      if (task["Task_id"] == taskID) {
        if (task["Employee_List"] != null) {
          (task["Employee_List"] as List).add(employeeId);
        } else {
          task["Employee_List"] = [employeeId];
        }
      }
    }

    await firestore
        .collection("activities")
        .doc(activity["Activity_Id"])
        .set(activity);
  }

  registerDonation(
      {required String employeeId,
      required var activity,
      required int amountDonated}) async {
    var emp = await fetchEmployee(employeeId: employeeId);
    int currentPoints = emp["Lives_Touched"];
    emp["Lives_Touched"] = currentPoints + activity["Lives_Touched"];
    (emp["Activity_Id"] as List).add(activity["Activity_Id"]);
    int amountDonatedTillNow = emp["Total_Amount_Donated"];
    emp["Total_Amount_Donated"] = amountDonatedTillNow + amountDonated;

    await firestore.collection("employee").doc(employeeId.toString()).set(emp);

    (activity["Registered_Employees"] as List).add(int.parse(employeeId));
    (activity["Donation_Amount"] as List)
        .add({"Emp_Id": int.parse(employeeId), "Amount": amountDonated});

    await firestore
        .collection("activities")
        .doc(activity["Activity_Id"])
        .set(activity);
  }
}
