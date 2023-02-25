import 'package:flutter/material.dart';
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
                    margin: EdgeInsets.only(bottom: 5.0),
                    child: InkWell(
                      onTap: () {},
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
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
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Activity Owner  :" + activity_data[index]['Activity_Owner'],
                                  style: TextStyle(color: Colors.black),
                                ),
                                Text(
                                  "Activity Date  :" + activity_data[index]['Date'],
                                  style: TextStyle(color: Colors.black),
                                ),
                                Text(
                                  "Lives Touched  :" + activity_data[index]['Lives_Touched'].toString(),
                                  style: TextStyle(color: Colors.black),
                                ),

                              ],
                            ),
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
