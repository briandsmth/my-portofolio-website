import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mywebsite_portofolio/models/cv_item.dart';
import 'package:mywebsite_portofolio/utils/constants.dart';
import 'package:mywebsite_portofolio/utils/screen_helper.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'dart:html' as html;

final List<CvItems> cvItem = [
  CvItems(
    title: "COLLABS",
    imagePath: "assets/images/design.png",
    subtitle: "",
  ),
  CvItems(
    title: "DEVELOP",
    imagePath: "assets/images/develop.png",
    subtitle: "",
  ),
  CvItems(
    title: "WRITE",
    imagePath: "assets/images/write.png",
    subtitle: "",
  ),
  CvItems(
    title: "TESTING",
    imagePath: "assets/images/promote.png",
    subtitle: "",
  ),
];

class CvPage extends StatelessWidget {
  const CvPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ScreenHelper(
          mobile: _buildUi(context, getMobileMaxWidth(context)),
          tablet: _buildUi(context, kTabletMaxWidth),
          desktop: _buildUi(context, kDesktopMaxWidth)),
    );
  }

  Widget _buildUi(BuildContext context, double width) {
    return ResponsiveWrapper(
        maxWidth: width,
        minWidth: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "BETTER COLLABS,\nBETTER EXPERIENCES",
                  style: GoogleFonts.oswald(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    height: 1.8,
                    fontSize: 18.0,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    html.window.open(
                        'https://drive.google.com/file/d/1Y191gjoDlAx-Ct_X96mlKb454xUw-MOT/view?usp=sharing',
                        'CV Febrian Mebiyantara');
                  },
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Text(
                      "DOWNLOAD CV",
                      style: GoogleFonts.oswald(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w900,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            LayoutBuilder(
              builder: (_context, constraints) {
                return ResponsiveGridView.builder(
                  padding: const EdgeInsets.all(0.0),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  alignment: Alignment.topCenter,
                  gridDelegate: ResponsiveGridDelegate(
                    mainAxisSpacing: 20.0,
                    crossAxisSpacing: 20.0,
                    maxCrossAxisExtent: ScreenHelper.isTablet(context) ||
                            ScreenHelper.isMobile(context)
                        ? constraints.maxWidth / 2.0
                        : 250.0,
                    // Hack to adjust child height
                    childAspectRatio: ScreenHelper.isDesktop(context)
                        ? 1
                        : MediaQuery.of(context).size.aspectRatio * 1.5,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              cvItem[index].imagePath,
                              width: 40.0,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 15.0,
                            ),
                            Text(
                              cvItem[index].title,
                              style: GoogleFonts.oswald(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        // const SizedBox(
                        //   height: 15.0,
                        // ),
                        Text(
                          cvItem[index].subtitle,
                          style: const TextStyle(
                            color: kCaptionColor,
                            height: 1.5,
                            fontSize: 14.0,
                          ),
                        )
                      ],
                    );
                  },
                  itemCount: cvItem.length,
                );
              },
            )
          ],
        ));
  }
}
