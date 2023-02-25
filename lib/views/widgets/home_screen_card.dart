import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:psl_foundation/constant.dart';
import 'package:psl_foundation/views/view_activity_page.dart';
import 'package:psl_foundation/views/widgets/custom_raised_button.dart';

class PFHomeScreenCard extends StatelessWidget {
  const PFHomeScreenCard(
      {Key? key,
      required this.title,
      required this.date,
      required this.desc,
      required this.likeCount,
      required this.location,
      required this.subHeading,
      required this.imgUrl,
      required this.activityData})
      : super(key: key);

  final activityData;
  final String title;
  final String subHeading;
  final String desc;
  final String location;
  final String date;
  final int likeCount;
  final List imgUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0)),
        shadowColor: Colors.grey.shade50,
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    child: Text(
                      title.substring(0, 1),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        subHeading,
                        style:
                            TextStyle(fontSize: 10, color: Color(0xFF79757F)),
                      )
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              // child: Container(
              //   height: 150,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10.0),
              //     color: Colors.grey.shade100
              //   ),
              // ),
              child: CachedNetworkImage(
                imageUrl: imgUrl[0],
                height: 150,
                errorWidget: (context, url, error) => const Icon(Icons.error),
                progressIndicatorBuilder: (context, url, progress) => Center(
                  child: CircularProgressIndicator(
                    value: progress.progress,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      desc,
                      maxLines: 1,
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 12,
                          color: Color(0xFF79757F)),
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(50.0)),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    child: Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.locationDot,
                          size: 14,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          location,
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(50.0)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  child: Row(
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.calendar,
                        size: 14,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        date,
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 1, child: Divider()),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: FaIcon(
                    FontAwesomeIcons.handsClapping,
                    color: Colors.grey.shade400,
                  ),
                ),
                const SizedBox(
                    height: 30,
                    child: VerticalDivider(
                      thickness: 1,
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    likeCount.toString() + "k",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: PFRaisedButton(
                    width: 100,
                    height: 35,
                    title: "VIEW MORE",
                    onPressed: () {
                      Get.to(() => ViewActivityPage(
                            activityData: activityData,
                          ));
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
