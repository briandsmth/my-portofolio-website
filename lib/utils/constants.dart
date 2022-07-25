import 'package:flutter/material.dart';

// const Color kPrimaryColor = Color.fromRGBO(21, 181, 114, 1);
const Color kPrimaryColor = Color.fromRGBO(245, 5, 18, 1);
const Color kBackgroundColor = Color.fromRGBO(14, 12, 56, 1);
// const Color kBackgroundColor = Color.fromRGBO(241, 240, 237, 1);
const Color kDangerColor = Color.fromRGBO(21, 181, 114, 1);
const Color kCaptionColor = Color.fromRGBO(166, 177, 187, 1);

// Lets replace all static sizes
const double kDesktopMaxWidth = 1000.0;
const double kTabletMaxWidth = 760.0;
double getMobileMaxWidth(BuildContext context) =>
    MediaQuery.of(context).size.width * .8;
