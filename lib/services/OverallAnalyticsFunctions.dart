import 'package:cloud_firestore/cloud_firestore.dart';

import 'ActivityFunctions.dart';
import 'EmployeeFunctions.dart';

class OverallAnalyticsFunctions {
  ActivityFunctions activityFunctions = new ActivityFunctions();
  EmployeeFunctions employeeFunctions = new EmployeeFunctions();

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  totalEmployeeCountList() async {
    List volunteeringEmpIDList = [];
    List donationsEmpIDList = [];
    List allActivities = await activityFunctions.fetchAllActivities();
    for (var activity in allActivities) {
      if (activity["Activity_Type"] == "Voluntering Drive") {
        List registeredEmployees = activity["Registered_Employees"] as List;
        for (int empIDs in registeredEmployees) {
          if (!volunteeringEmpIDList.contains(empIDs)) {
            volunteeringEmpIDList.add(empIDs);
          }
        }
      } else {
        List registeredEmployees = activity["Registered_Employees"] as List;
        for (int empIDs in registeredEmployees) {
          if (!donationsEmpIDList.contains(empIDs)) {
            donationsEmpIDList.add(empIDs);
          }
        }
      }
    }

    // print(volunteeringEmpIDList);
    // print(donationsEmpIDList);

    return {
      "Volunteering": volunteeringEmpIDList,
      "Donations": donationsEmpIDList
    };
  }

  totalEmployeeCount() async {
    var object = await totalEmployeeCountList();

    return {
      "Volunteering": (object["Volunteering"] as List).length,
      "Donations": (object["Donations"] as List).length,
    };
  }

  totalEmployeeCountGradeWise() async {
    var totalCount = await totalEmployeeCountList();
    List volunteeringEmployees = totalCount["Volunteering"];
    List donationsEmployees = totalCount["Donations"];
    Map<String, Map<dynamic, dynamic>> gradeWiseCount = {};
    // print(volunteeringEmployees);
    // print(donationsEmployees);

    for (int empId in volunteeringEmployees) {
      var emp =
          await employeeFunctions.fetchEmployee(employeeId: empId.toString());
      String grade = emp["Grade"];
      grade = grade.split(".")[0];
      if (gradeWiseCount.containsKey(grade)) {
        gradeWiseCount[grade]!["Volunteering"]++;
      } else {
        gradeWiseCount[grade] = {"Volunteering": 1, "Donations": 0};
      }
    }

    for (int empId in donationsEmployees) {
      var emp =
          await employeeFunctions.fetchEmployee(employeeId: empId.toString());
      String grade = emp["Grade"];
      grade = grade.split(".")[0];
      if (gradeWiseCount.containsKey(grade)) {
        gradeWiseCount[grade]!["Donations"]++;
      } else {
        gradeWiseCount[grade] = {"Volunteering": 0, "Donations": 1};
      }
    }

    return gradeWiseCount;
  }

  totalEmployeeCountOuWise() async {
    var totalCount = await totalEmployeeCountList();
    List volunteeringEmployees = totalCount["Volunteering"];
    List donationsEmployees = totalCount["Donations"];
    Map<String, Map<dynamic, dynamic>> OuWiseCount = {};
    // print(volunteeringEmployees);
    // print(donationsEmployees);

    for (int empId in volunteeringEmployees) {
      var emp =
          await employeeFunctions.fetchEmployee(employeeId: empId.toString());
      String OU = emp["OU"];

      if (OuWiseCount.containsKey(OU)) {
        OuWiseCount[OU]!["Volunteering"]++;
      } else {
        OuWiseCount[OU] = {"Volunteering": 1, "Donations": 0};
      }
    }

    for (int empId in donationsEmployees) {
      var emp =
          await employeeFunctions.fetchEmployee(employeeId: empId.toString());
      String OU = emp["OU"];
      if (OuWiseCount.containsKey(OU)) {
        OuWiseCount[OU]!["Donations"]++;
      } else {
        OuWiseCount[OU] = {"Volunteering": 0, "Donations": 1};
      }
    }

    return OuWiseCount;
  }

  getTopEmployee() async {
    List allEmployees = await employeeFunctions.fetchAllEmployees();
    int highestLivesTouched = 0;
    String empName = "";
    for (var employee in allEmployees) {
      if (employee["Lives_Touched"] > highestLivesTouched) {
        highestLivesTouched = employee["Lives_Touched"];
        empName = employee["First_Name"] + " " + employee["Last_Name"];
      }
    }

    return {"Name": empName, "count": highestLivesTouched};
  }

  getTop3VolunteeredActivities() async {
    List allActivities = await activityFunctions.fetchAllActivities();
    Map<String, int> ActivityWiseEmployeeCount = {};

    for (var activity in allActivities) {
      if (activity["Activity_Type"] == "Voluntering Drive") {
        ActivityWiseEmployeeCount[activity["Activity_Id"]] =
            (activity["Registered_Employees"] as List).length;
      }
    }

    List<MapEntry<String, int>> list =
        ActivityWiseEmployeeCount.entries.toList();
    list.sort((a, b) => b.value.compareTo(a.value));
    Map<String, int> sortedMap = Map.fromEntries(list);

    print(sortedMap);

    Iterable<MapEntry<String, int>> firstThreeEntries =
        sortedMap.entries.take(3);
    return firstThreeEntries.toList();
  }

  getTop3DonatedActivities() async {
    List allActivities = await activityFunctions.fetchAllActivities();
    Map<String, int> ActivityWiseEmployeeCount = {};

    for (var activity in allActivities) {
      if (activity["Activity_Type"] == "Donation Drive") {
        ActivityWiseEmployeeCount[activity["Activity_Id"]] =
            (activity["Registered_Employees"] as List).length;
      }
    }

    List<MapEntry<String, int>> list =
        ActivityWiseEmployeeCount.entries.toList();
    list.sort((a, b) => b.value.compareTo(a.value));
    Map<String, int> sortedMap = Map.fromEntries(list);

    print(sortedMap);

    Iterable<MapEntry<String, int>> firstThreeEntries =
        sortedMap.entries.take(3);
    return firstThreeEntries.toList();
  }

  getLivesTouchedPerActivity() async {
    List allActivities = await activityFunctions.fetchAllActivities();
    Map<String, int> livesTouchedPerActivity = {};

    for (var activity in allActivities) {
      int totalLivesTouched = activity["Lives_Touched"] *
          (activity["Registered_Employees"] as List).length;
      livesTouchedPerActivity[activity["Title"]] = totalLivesTouched;
    }

    return livesTouchedPerActivity;
  }

  totalLivesTouched() async {
    List allActivities = await activityFunctions.fetchAllActivities();
    int total = 0;
    for (var activity in allActivities) {
      int totalLivesTouched = activity["Lives_Touched"] *
          (activity["Registered_Employees"] as List).length;
      total = total + totalLivesTouched;
    }

    return total;
  }
}
