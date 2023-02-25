import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:psl_foundation/services/HomeScreenFunctions.dart';
import 'package:psl_foundation/views/widgets/appbar.dart';
import 'package:get/get.dart';
import 'package:psl_foundation/views/widgets/custom_raised_button.dart';
import 'package:psl_foundation/views/widgets/home_screen_card.dart';

import '../constant.dart';
class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List list = [];

  Future getData() async {
    HomeScreenFunctions homeScreenFunctions = HomeScreenFunctions();
    list = await homeScreenFunctions.fetchLiveActivities();
    print(list.length);
    return list;
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PFAppBar(title: "Home", icon: FontAwesomeIcons.house),
      floatingActionButton: appMode != "USER" ? FloatingActionButton(
        onPressed: () {},
        child: const Text(
          "+",
          style: TextStyle(
            fontSize: 30,
            color: Colors.white
          ),
        ),
      ) : Container(),
      // body: ListView.builder(
      //   itemCount: list.length,
      //   physics: BouncingScrollPhysics(),
      //   padding: EdgeInsets.all(8.0),
      //   itemBuilder: (BuildContext context, index) {
      //     return PFHomeScreenCard(
      //       title: list[index]['Title'],
      //       subHeading: list[index]['Activity_Type'],
      //       date: list[index]['Date'],
      //       desc: list[index]['Description'],
      //       likeCount: list[index]['Like'].length,
      //       location: list[index]['Location'],
      //     );
      //   },
      // ),

      body: FutureBuilder(
        future: getData(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.connectionState == ConnectionState.active || snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return const Text('Error');
              } else if (snapshot.hasData) {
                List activity_data = snapshot.data;
                return ListView.builder(
                  itemCount: activity_data.length,
                  itemBuilder: (context, index) {
                    return PFHomeScreenCard(
                      title: activity_data[index]['Title'],
                      subHeading: activity_data[index]['Activity_Type'],
                      date: activity_data[index]['Date'],
                      desc: activity_data[index]['Description'],
                      likeCount: activity_data[index]['Like'].length,
                      location: activity_data[index]['Location'],
                    );
                  },
                );
              } else {
                return const Text('No data');
              }
            } else {
              return Text('State: ${snapshot.connectionState}');
            }
          },
      ),


      // body: Obx(() {
      //   return ListView.builder(
      //     itemCount: homePageController.list.length,
      //     itemBuilder: (context, index) {
      //       return Container();
      //     },
      //   );
      // }),

      // body: StreamBuilder(
      //   stream: FirebaseFirestore.instance.collection('activities').snapshots(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return const Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     } else if (snapshot.connectionState == ConnectionState.active || snapshot.connectionState == ConnectionState.done) {
      //       if (snapshot.hasError) {
      //         return const Text('Error');
      //       } else if (snapshot.hasData) {
      //         return ListView.builder(
      //           itemCount: snapshot.data!.docs.length,
      //           itemBuilder: (context, index) {
      //             DocumentSnapshot lecData = snapshot.data!.docs[index];
      //             return Container(
      //               child: Text(
      //                 lecData.get('Title')
      //               ),
      //             );
      //           },
      //         );
      //       } else {
      //         return const Text('No data');
      //       }
      //     } else {
      //       return Text('State: ${snapshot.connectionState}');
      //     }
      //   },
      // ),
    );
  }
}
