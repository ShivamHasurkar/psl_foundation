import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:psl_foundation/services/EmployeeFunctions.dart';

class ActivityFunctions {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  EmployeeFunctions employeeFunctions = new EmployeeFunctions();

  addActivity({required var activity}) async {
    final collectionReference = firestore.collection('activities');
    var documentReference =
        await collectionReference.doc(activity["Activity_Id"].toString());
    documentReference.set(activity);
  }

  fetchAllActivities() async {
    QuerySnapshot querySnapshot =
        await firestore.collection('activities').get();
    final allActivities = querySnapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
    return allActivities;
  }

  detailedListOfRegisteredEmployees({required String activityId}) async {
    DocumentReference documentReference =
        firestore.collection('activities').doc(activityId);

    var docSnapshot = await documentReference.get();
    var activity = docSnapshot.data() as Map<String, dynamic>;
    List empList = [];
    for (int empId in activity["Registered_Employees"] as List) {
      var emp =
          await employeeFunctions.fetchEmployee(employeeId: empId.toString());
      empList.add(emp);
    }

    return empList;
  }
}
