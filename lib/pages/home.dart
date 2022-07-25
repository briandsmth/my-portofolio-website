import 'package:flutter/material.dart';
import 'package:mywebsite_portofolio/pages/components/carousel.dart';
import 'package:mywebsite_portofolio/pages/components/cv_page.dart';
import 'package:mywebsite_portofolio/pages/components/footer.dart';
import 'package:mywebsite_portofolio/pages/components/header_navbar.dart';
import 'package:mywebsite_portofolio/pages/components/porto1.dart';
import 'package:mywebsite_portofolio/pages/components/skill_page.dart';
import 'package:mywebsite_portofolio/pages/components/sponsor.dart';
import 'package:mywebsite_portofolio/utils/constants.dart';
import 'package:mywebsite_portofolio/utils/globals.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Globals.scaffoldKey,
      endDrawer: Drawer(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 24,
          ),
          child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return headerItems[index].isButton
                    ? MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Container(
                          decoration: BoxDecoration(
                            color: kDangerColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 28),
                          child: TextButton(
                            onPressed: headerItems[index].onTap,
                            child: Text(
                              headerItems[index].title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    : ListTile(
                        title: Text(
                          headerItems[index].title,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemCount: headerItems.length),
        )),
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Navbar(),
          Carousel(),
          // SizedBox(
          //   height: 20.0,
          // ),
          const CvPage(),
          const Portofo1(),
          const SizedBox(
              height: 70.0,
            ),
          const SkillPage(),
          const Sponsors(),
          const Footer(),
        ],
      )),
    );
  }
}
