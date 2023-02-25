// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:psl_foundation/constant.dart';
import 'package:get_storage/get_storage.dart';
import 'package:psl_foundation/constant.dart';
import 'package:psl_foundation/views/login_screen.dart';
import 'package:psl_foundation/views/widgets/appbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share_extend/share_extend.dart';
import 'package:psl_foundation/views/widgets/custom_raised_button.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
// final _picker = ImagePicker();
  late final box;

  @override
  void initState() {
    super.initState();
    box = GetStorage();
  }

  logout() {
    box.erase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PFAppBar(title: "Profile", icon: FontAwesomeIcons.user),
      body: Column(
        children: [
          Expanded(flex: 2, child: _TopPortion()),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    "Richie Lorie",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    "Employee ID: ${kEmpID}",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(fontWeight: FontWeight.w300, fontSize: 16),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    "OU: Google",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(fontWeight: FontWeight.w300, fontSize: 16),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    "BU: GCP",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(fontWeight: FontWeight.w300, fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton.extended(
                        onPressed: () {},
                        backgroundColor: kColorPrimary,
                        label: const Text("Webiste"),
                        icon: const Icon(FontAwesomeIcons.globe),
                      ),
                      const SizedBox(width: 10.0),
                      FloatingActionButton.extended(
                        onPressed: () {},
                        backgroundColor: kColorPrimary,
                        label: const Text("Share App"),
                        icon: const Icon(Icons.share),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const _ProfileInfoRow(),
                  const SizedBox(height: 10),
                  // if(condtion) //lives saved is more than 10 award the persistent foundation
                  FloatingActionButton.extended(
                    onPressed: () async {
                      // final res = await _picker.getImage(
                      //     source: "assets/images/Star Performer.jpg");
                      // if (res.path != null) {
                      //   ShareExtend.share(res.path, "image",
                      //       sharePanelTitle: "Star Performer",
                      //       subject:
                      //           "Hello everyone, I am happy to share that I have received Star Performer award for touching multiple lives through my volunteering for Persistent Foundation");
                      // }
                    },
                    backgroundColor: kColorPrimary,
                    label: const Text("Download Star Performer Certificate"),
                    icon: const Icon(FontAwesomeIcons.award),
                  ),
                  const SizedBox(height: 20),
                  FloatingActionButton.extended(
                    onPressed: () {
                      logout();
                      Get.off(() => LoginScreen());
                    },
                    backgroundColor: Colors.red,
                    label: const Text("Logout"),
                    icon: const Icon(FontAwesomeIcons.rightFromBracket),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileInfoRow extends StatelessWidget {
  const _ProfileInfoRow({Key? key}) : super(key: key);

  final List<ProfileInfoItem> _items = const [
    ProfileInfoItem("Activity Participated", 8),
    ProfileInfoItem("Lives Touched", 22),
    ProfileInfoItem("Amount Donated", 1600),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      constraints: const BoxConstraints(maxWidth: 400),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _items
            .map((item) => Expanded(
                    child: Row(
                  children: [
                    if (_items.indexOf(item) != 0) const VerticalDivider(),
                    Expanded(child: _singleItem(context, item)),
                  ],
                )))
            .toList(),
      ),
    );
  }

  Widget _singleItem(BuildContext context, ProfileInfoItem item) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              item.value.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Text(
            item.title,
            style: Theme.of(context).textTheme.caption,
          )
        ],
      );
}

class ProfileInfoItem {
  final String title;
  final int value;
  const ProfileInfoItem(this.title, this.value);
}

class _TopPortion extends StatelessWidget {
  const _TopPortion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        SvgPicture.asset('assets/images/foundation-logo-updated.svg'),
        Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: SvgPicture.asset(
              'assets/images/foundation-logo-updated.svg',
              alignment: Alignment.topCenter,
              fit: BoxFit.scaleDown,
            ),
          ),
          margin: const EdgeInsets.only(bottom: 50),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    kColorPrimaryLessOpactiy,
                    Colors.white,
                  ]),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              )),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: 150,
            height: 150,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/avtar_image.jpg'),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
