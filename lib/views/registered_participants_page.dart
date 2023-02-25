import 'package:flutter/material.dart';
import 'package:psl_foundation/constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:psl_foundation/views/widgets/appbar.dart';

class RegisteredPage extends StatelessWidget {
  const RegisteredPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: const PFAppBar(title: "Registered Participants",icon: FontAwesomeIcons.calendar),
      body: Container(
        margin: EdgeInsets.all(kDefaultSpace),
        child: ListView.builder(
            
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.only(bottom: 5.0),
                child: Card(
                  shape: RoundedRectangleBorder(),
                  child:ListTile(
                    tileColor: Colors.white,
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/avtar_image.jpg'),
                    ),
                    title:Text('Arti Tiwari',
                        style: TextStyle(
                          fontWeight: FontWeight.bold
  ),
                    ),
                    subtitle: Row(
                      children: [
                        Text('BU: Google',
                          style: TextStyle(
                              color: Colors.black
                          ),
                        ),
                        SizedBox(width:30),
                        Text('Grade\t: 3.2',
                          style: TextStyle(
                              color: Colors.black
                          ),
                        ),
                      ],
                    ),
                    ),

                  //ListTile
                ),
              );
            }),
      ),
    );
  }
}
