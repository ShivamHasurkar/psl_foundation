import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:psl_foundation/views/activity_specific_analytic_page.dart';
import 'package:psl_foundation/views/registered_participants_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:psl_foundation/views/widgets/appbar.dart';

import '../constant.dart';
import '../services/HomeScreenFunctions.dart';

class PastActivities extends StatefulWidget {
  PastActivities({Key? key}) : super(key: key);

  @override
  State<PastActivities> createState() => _PastActivitiesState();
}

class _PastActivitiesState extends State<PastActivities> {
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
      appBar: const PFAppBar(
          title: "Past Activities", icon: FontAwesomeIcons.thumbtack),
      body: FutureBuilder(
        future: getData(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.connectionState == ConnectionState.active ||
              snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Text('Error');
            } else if (snapshot.hasData) {
              List activity_data = snapshot.data;
              return ListView.builder(
                itemCount: activity_data.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: kVerticalSpace, vertical: 5),
                    child: InkWell(
                      onTap: () {
                        Get.to(ActivitySpecificAnalyticPage());
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          tileColor: Colors.white,
                          leading: const CircleAvatar(
                            backgroundColor: kColorPrimary,
                            child: FaIcon(
                              FontAwesomeIcons.check,
                              color: Colors.white,
                            ),
                          ),
                          title: Text(
                            activity_data[index]['Title'],
                            style: TextStyle(fontWeight: FontWeight.bold,
                                fontSize: 14,

                                ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Activity Owner  :" + activity_data[index]['Activity_Owner'],
                                style: TextStyle(fontSize: 12,
                                    color: Color(0xFF79757F)),
                              ),
                              Text(
                                "Activity Date  :" + activity_data[index]['Date'],
                                style: TextStyle(fontSize: 12,
                                    color: Color(0xFF79757F)),
                              ),
                              Text(
                                "Lives Touched  :" + activity_data[index]['Lives_Touched'].toString(),
                                style: TextStyle(fontSize: 12,
                                    color: Color(0xFF79757F)),
                              ),

                            ],
                          ),
                        ),

                        //ListTile
                      ),
                    ),
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
    );
  }
}
