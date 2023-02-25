import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../constant.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
                          borderSide: BorderSide(width: 2,color: kColorPrimary)
                        ),
                      //   UnderlineInputBorder( //<-- SEE HERE
                      //     borderSide: BorderSide(width: 3,
                      //     color: kColorPrimary),
                      //   ),
                      ),
                      validator: FormBuilderValidators.compose(
                          [
                            FormBuilderValidators.required()
                          ]
                      ),
                    ),
                    SizedBox(height: 40,),
                    FormBuilderTextField(
                      name: "password",
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "Password",
                        enabledBorder:  OutlineInputBorder(
                            borderSide: BorderSide(width: 2,color: kColorPrimary)
                        ),
                    )
                    )
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
