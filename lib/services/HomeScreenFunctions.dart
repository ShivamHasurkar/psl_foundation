import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreenFunctions {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  fetchLiveActivities() async {
    List liveActivities = [];

    QuerySnapshot querySnapshot =
        await firestore.collection('activities').get();
    final allActivities = querySnapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();

    for (Map<String, dynamic> activity in allActivities) {
      DateTime now = DateTime.now();
      DateTime date = DateTime.parse(activity["Date"]);
      // print(now);
      // print(date);
      // print(now.isBefore(date));
      if (now.isBefore(date)) {
        liveActivities.add(activity);
      }
    }

    print(liveActivities);
    return liveActivities;
  }

  addLike({required String empId, required String activityId}) async {
    DocumentReference activityDocRef =
        firestore.collection("activities").doc(activityId);
    var activityDocSnapshot = await activityDocRef.get();
    var activityData = activityDocSnapshot.data() as Map<String, dynamic>;
    List likes = activityData["Like"];
    likes.add(int.parse(empId));
    await activityDocRef.update({"Like": likes});
  }
}
