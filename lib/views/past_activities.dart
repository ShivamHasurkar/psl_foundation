import 'package:flutter/material.dart';
import 'package:psl_foundation/views/registered_participants_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:psl_foundation/views/widgets/appbar.dart';

import '../constant.dart';
class PastActivities extends StatelessWidget {
  const PastActivities({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PFAppBar(title: "Past Activities",icon: FontAwesomeIcons.thumbtack),
      body: Container(
        margin: EdgeInsets.all(kDefaultSpace),
        child: ListView.builder(
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.only(bottom: 5.0),
                child: InkWell(
                  onTap:(){

                  },
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
                        leading: CircleAvatar(
                          backgroundColor: kColorPrimary,
                          child:
                          FaIcon(
                            FontAwesomeIcons.check,
                            color: Colors.white,
                          ),
                        ),
                        title:Text('Activity Name',
                          style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),
                        ),

                        subtitle: Row(
                          children: [
                            Text('Activity Owner  :  XYZ\nActivity Type  :  Donation Drivre\nDate  :  23-Jan-2023\nLivesTouched  :  200',
                              style: TextStyle(
                                  color: Colors.black
                              ),
                            ),


                          ],
                        ),
                      ),
                    ),

                    //ListTile
                  ),
                ),
              );
            }),
      ),

    );
  }
}
