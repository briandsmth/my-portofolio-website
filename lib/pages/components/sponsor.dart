import 'package:flutter/material.dart';
import 'package:mywebsite_portofolio/utils/constants.dart';
import 'package:mywebsite_portofolio/utils/screen_helper.dart';
import 'package:responsive_framework/responsive_framework.dart';

final List<String> sponsorLogo = [
  "build/flutter_assets/assets/images/flutter-logo.png",
  "build/flutter_assets/assets/images/dart-logo.png",
  "build/flutter_assets/assets/images/android_logo.png",
  "build/flutter_assets/assets/images/ios-logo.png",
  "build/flutter_assets/assets/images/vscode-logo.png",
];

class Sponsors extends StatelessWidget {
  const Sponsors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: ScreenHelper(
          mobile: _buildUi(getMobileMaxWidth(context)),
          tablet: _buildUi(kTabletMaxWidth),
          desktop: _buildUi(kDesktopMaxWidth)),
    );
  }
}

Widget _buildUi(double width) {
  return Center(
    child: ResponsiveWrapper(
      minWidth: width,
      maxWidth: width,
      defaultScale: false,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Wrap(
            runSpacing: 50.0,
            spacing: 50.0,
            children: sponsorLogo
                .map(
                  (logo) => Container(
                    height: 30.0,
                    constraints: BoxConstraints(
                      // max of 3 per row when on mobile and 5 per row on bigger screens
                      maxWidth: ScreenHelper.isMobile(context)
                          ? constraints.maxWidth / 3.0 - 50.0
                          : constraints.maxWidth / 5.0 - 50.0,
                    ),
                    child: Image.asset(logo, color: Colors.white,),
                  ),
                )
                .toList(),
          );
        },
      ),
    ),
  );
}
