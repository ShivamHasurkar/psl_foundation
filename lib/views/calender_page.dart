import 'package:flutter/material.dart';
import 'package:psl_foundation/constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:psl_foundation/services/ActivityFunctions.dart';
import 'package:psl_foundation/services/HomeScreenFunctions.dart';
import 'package:psl_foundation/views/widgets/appbar.dart';
import 'view_activity_page.dart';

class CalenderPage extends StatefulWidget {
  const CalenderPage({Key? key}) : super(key: key);

  @override
  State<CalenderPage> createState() => _CalenderPageState();
}

class _CalenderPageState extends State<CalenderPage> {
  List activityList = [];

  @override
  void initState() {
    // TODO: implement initState
    setLiveActivityList();
  }

  setLiveActivityList() async {
    HomeScreenFunctions act = new HomeScreenFunctions();
    activityList = await act.fetchLiveActivities();
    print(activityList);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        margin: EdgeInsets.all(kDefaultSpace),
        child: ListView.builder(
            itemCount: activityList.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                // margin: EdgeInsets.only(bottom: 5.0),
                // height: 80,

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
                        leading: AspectRatio(
                          aspectRatio: 1,
                          child: Card(
                            color: Color(0xFFEDE98D),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  activityList[index]["Date"]
                                          .toString()
                                          .substring(8, 10) +
                                      "/" +
                                      activityList[index]["Date"]
                                          .toString()
                                          .substring(5, 7),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        title: Text(
                          activityList[index]["Title"],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: const Icon(Icons.arrow_forward),
                        onTap: () {
                          //Push to specific View Activity Page.
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ViewActivityPage(
                                      activityData: activityList[index],
                                    )),
                          );
                        }),
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