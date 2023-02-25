import 'package:cloud_firestore/cloud_firestore.dart';

class ParticipatedActivitiesFunctions {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  getActivitiesParticipatedList({required String employeeId}) async {
    DocumentSnapshot empDocumentSnapshot =
        await firestore.collection('employee').doc(employeeId).get();

    var empData = empDocumentSnapshot.data() as Map<String, dynamic>;
    List activitiesIdList = empData["Activity_Id"] as List;
    List activitiesList = [];
    for (String activityId in activitiesIdList) {
      var activitySnapshot =
          await firestore.collection("activities").doc(activityId).get();
      var activity = activitySnapshot.data() as Map<String, dynamic>;
      activitiesList.add(activity);
    }
    return activitiesList;
  }
}
