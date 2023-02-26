import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get_storage/get_storage.dart';
import 'package:psl_foundation/services/LoginScreent.dart';
import 'package:psl_foundation/views/bottom_navigation_bar.dart';
import 'package:psl_foundation/views/widgets/custom_raised_button.dart';
import 'package:get/get.dart';
import '../constant.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormBuilderState> _loginKey = GlobalKey<FormBuilderState>();

  String loginStatus = "";
  late final box;

  Future<String> login(String empID, String password) async {
    print(empID + " " + password);
    LoginScreenService loginScreenService = LoginScreenService();
    loginStatus = await loginScreenService.loginUserFunction(employeeId: empID, password: password);
    return loginStatus;
  }

  @override
  void initState() {
    super.initState();
    box = GetStorage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/Persistent_Logo_Vertical_Default.png',
                  width: 100,
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Welcome to Persistent Foundation',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: FormBuilder(
                key: _loginKey,
                child: Column(
                  children: <Widget>[
                    FormBuilderTextField(
                      name: "username",
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                        labelText: "Username",
                        // filled: true,
                        // fillColor: kTextFildBg,
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1)),
                        //   UnderlineInputBorder( //<-- SEE HERE
                        //     borderSide: BorderSide(width: 3,
                        //     color: kColorPrimary),
                        //   ),
                      ),
                      validator: FormBuilderValidators.compose(
                          [FormBuilderValidators.required()]),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    FormBuilderTextField(
                      name: "password",
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "Password",
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1,)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    PFRaisedButton(
                        title: "Login",
                        onPressed: () {
                          bool? isValid = _loginKey.currentState?.isValid;

                          if (isValid!) {
                            _loginKey.currentState?.save();

                            login(_loginKey.currentState?.fields["username"]?.value, _loginKey.currentState?.fields["password"]?.value).then((value) {
                              print(value);
                              if (value == "User" || value == "Admin") {
                                box.write('userType', value);
                                box.write('empId', _loginKey.currentState?.fields["username"]?.value);
                                appMode = value;
                                kEmpID = _loginKey.currentState?.fields["username"]?.value;
                                Get.off(() => PFBottomNavigationBar());
                              } else if (value == "UserNotFound") {
                                Fluttertoast.showToast(
                                    msg: "User not found",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    fontSize: 16.0
                                );
                              } else if (value == "WrongPassword") {
                                Fluttertoast.showToast(
                                    msg: "Wrong password",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    fontSize: 16.0
                                );
                              }
                            });

                          }
                        })
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
