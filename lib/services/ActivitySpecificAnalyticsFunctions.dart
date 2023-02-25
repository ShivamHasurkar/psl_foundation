import 'package:cloud_firestore/cloud_firestore.dart';

import 'EmployeeFunctions.dart';

class ActivitySpecificAnalyticsFunctions {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  EmployeeFunctions employeeFunctions = new EmployeeFunctions();

  fetchParticipatedEmployeeList(activityId) async {
    final collectionReference = firestore.collection('activities');
    var activitySnapshot = await collectionReference.doc(activityId).get();
    var activity = activitySnapshot.data() as Map<String, dynamic>;
    return activity["Registered_Employees"] as List;
  }

  employeesParticipatedCount({required String activityId}) async {
    int count = (fetchParticipatedEmployeeList(activityId)).length;
    return count;
  }

  getTopTwoOUCount({required String activityId}) async {
    List employees = await fetchParticipatedEmployeeList(activityId);
    List OU_List = [];
    for (var employeeId in employees) {
      var emp = await employeeFunctions.fetchEmployee(
          employeeId: employeeId.toString());
      OU_List.add(emp["OU"]);
    }

    Map<String, int> OUwiseEmployeeCount = {};

    for (String item in OU_List) {
      if (OUwiseEmployeeCount.containsKey(item)) {
        int count = OUwiseEmployeeCount[item]!;
        count = count + 1;
        OUwiseEmployeeCount[item] = count; // increment count for existing item
      } else {
        OUwiseEmployeeCount[item] = 1; // add new item with count of 1
      }
    }

    List<MapEntry<String, int>> list = OUwiseEmployeeCount.entries.toList();
    // convert the map to a list of key-value pairs

    list.sort((a, b) => b.value.compareTo(a.value));
    // sort the list by value in descending order

    Map<String, int> sortedMap = Map.fromEntries(list);
    // create a new map from the sorted list

    Iterable<MapEntry<String, int>> firstTwoEntries = sortedMap.entries.take(2);

    return firstTwoEntries.toList();
  }

  getFirstTimers({required String activityId}) async {
    List employeeIdList = await fetchParticipatedEmployeeList(activityId);
    List firstTimers = [];

    for (var employeeId in employeeIdList) {
      var emp = await employeeFunctions.fetchEmployee(
          employeeId: employeeId.toString());
      if ((emp["Activity_Id"] as List).length == 1) {
        firstTimers.add(emp);
      }
    }

    print(firstTimers);

    return firstTimers.length;
  }
}
