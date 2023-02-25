import 'package:cloud_firestore/cloud_firestore.dart';

class LoginScreen {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

//returns either of the three messages -  LoggedIn , WrongPassword, UserNotFound
  loginUserFunction(
      {required String employeeId, required String password}) async {
    DocumentReference documentReference =
        firestore.collection('employee').doc(employeeId);

    String empPassword;
    var docSnapshot = await documentReference.get();

    if (docSnapshot.exists) {
      final data = docSnapshot.data() as Map<String, dynamic>;
      empPassword = data["Password"];
      if (empPassword == password) {
        // print("LoggedIn");
        return "LoggedIn";
      } else {
        // print("WrongPassword");
        return "WrongPassword";
      }
    } else {
      // print("UserNotFound");
      return "UserNotFound";
    }
  }
}
