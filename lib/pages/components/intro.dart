import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mywebsite_portofolio/models/carousel_item.dart';
import 'package:mywebsite_portofolio/utils/constants.dart';
import 'package:mywebsite_portofolio/utils/screen_helper.dart';
import 'package:responsive_framework/responsive_framework.dart';

class Carousel extends StatelessWidget {
  final CarouselController carouselController = CarouselController();
  Carousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double carouselContainerHeight = MediaQuery.of(context).size.height *
        (ScreenHelper.isMobile(context) ? .7 : .85);
    return SizedBox(
      height: carouselContainerHeight,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            child: CarouselSlider(
              carouselController: carouselController,
              items: List.generate(
                carouselItems.length,
                (index) => Builder(
                  builder: (BuildContext context) {
                    return Container(
                      constraints: BoxConstraints(
                        minHeight: carouselContainerHeight,
                      ),
                      child: ScreenHelper(
                        // Responsive views
                        desktop: _buildDesktop(
                          context,
                          carouselItems[index].text,
                          carouselItems[index].image,
                        ),
                        tablet: _buildTablet(
                          context,
                          carouselItems[index].text,
                          carouselItems[index].image,
                        ),
                        mobile: _buildMobile(
                          context,
                          carouselItems[index].text,
                          carouselItems[index].image,
                        ),
                      ),
                    );
                  },
                ),
              ).toList(),
              options: CarouselOptions(
                // autoPlay: true,
                viewportFraction: 1,
                scrollPhysics: const NeverScrollableScrollPhysics(),
                height: carouselContainerHeight,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMobile(BuildContext context, Widget text, Widget image) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: getMobileMaxWidth(context),
      ),
      width: double.infinity,
      child: text,
    );
  }

  Widget _buildDesktop(BuildContext context, Widget text, Widget image) {
    return Center(
      child: ResponsiveWrapper(
          maxWidth: kDesktopMaxWidth,
          minWidth: kDesktopMaxWidth,
          defaultScale: false,
          child: Row(
            children: [
              Expanded(
                child: text,
              ),
              Expanded(
                child: image,
              ),
            ],
          )),
    );
  }

  Widget _buildTablet(BuildContext context, Widget text, Widget image) {
    return Center(
      child: ResponsiveWrapper(
        maxWidth: kTabletMaxWidth,
        minWidth: kTabletMaxWidth,
        defaultScale: false,
        child: Row(
          children: [
            Expanded(
              child: text,
            ),
            Expanded(
              child: image,
            )
          ],
        ),
      ),
    );
  }
}

List<CarouselItemModel> carouselItems = List.generate(
  5,
  (index) => CarouselItemModel(
    text: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'FLUTTER DEVELOPER',
          style: GoogleFonts.oswald(
            color: kPrimaryColor,
            fontWeight: FontWeight.w900,
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 18.0,
        ),
        Text(
          "FEBRIAN\nMEBIYANTARA",
          style: GoogleFonts.oswald(
            color: Colors.white,
            fontSize: 40.0,
            fontWeight: FontWeight.w900,
            height: 1.3,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        const Text(
          "Mobile Flutter developer, based in Lombok",
          style: TextStyle(
            color: kCaptionColor,
            fontSize: 15.0,
            height: 1.0,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Wrap(
          children: [
            const Text(
              "Need a full custom mobile app?",
              style: TextStyle(
                color: kCaptionColor,
                fontSize: 15.0,
                height: 1.5,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Text(
                  " Got a project? Let's talk.",
                  style: TextStyle(
                    height: 1.5,
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 25.0,
        ),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Container(
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(8.0),
            ),
            height: 48.0,
            padding: const EdgeInsets.symmetric(
              horizontal: 28.0,
            ),
            child: TextButton(
              onPressed: () {},
              child: const Text(
                "GET STARTED",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        )
      ],
    ),
    image: Image.asset(
      "flutter_assets/assets/images/gw.png",
      fit: BoxFit.contain,
    ),
  ),
);
