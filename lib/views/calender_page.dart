import 'package:flutter/material.dart';
import 'package:psl_foundation/constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:psl_foundation/views/widgets/appbar.dart';

class CalenderPage extends StatelessWidget {
  const CalenderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:AppBar(
    title: Row(
    children: [
    Padding(
    padding: const EdgeInsets.only(right: 8),
    child: FaIcon(
    FontAwesomeIcons.calendar,
    size: 16,
    ),
    ),
    Text(
    "Calender",
    style: const TextStyle(
    color: Colors.white
    ),
    ),
    ],
    ),
    iconTheme: IconThemeData(
    color: Colors.white
    ),
    ),

      body:Container(
        margin: EdgeInsets.all(kDefaultSpace),
        child: ListView.builder(
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                // margin: EdgeInsets.only(bottom: 5.0),
                // height: 80,

                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),

                  child:Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      tileColor: Colors.white,
                      leading:AspectRatio(
                          aspectRatio: 1,
                          child:Card(
                            color: Color(0xFFEDE98D),
                           child:Column(
                             children: [
                               Text(
                                 '24',
                                 style: TextStyle(
                                     fontWeight: FontWeight.bold,
                                   fontSize: 20,
                                 ),
                               ),
                               Text(
                                   'Jan'
                               )
                             ],
                           ),
                          ),
                      ),
                      title:Text('Title of the Activity',
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),
                    ),
                      trailing: const Icon(Icons.arrow_forward),
                                onTap: () {
                                  //Push to specific View Activity Page.
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) => const CalenderPage()),
                                  // );
                                }

                    ),
                  ),

                ),
              );
            }),
      ),

    );
  }
}

// Can be upgraded to this if we have time.
// https://pub.dev/packages/syncfusion_flutter_calendar