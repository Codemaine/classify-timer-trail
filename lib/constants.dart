import 'dart:math';
import 'package:flutter/material.dart';

const kUrlDiscord = 'https://discord.gg/EYSZ5QEEYC';
const kUrlPrivacyPolicy = 'https://www.classify.org.uk/privacy-policy';
const kUrlTermsAndConditions =
    'https://www.classify.org.uk/terms-and-conditions';
const kUrlLegal = 'https://classify.org.uk/legal';
const kUrlCors =
    'https://europe-west3-classify-firebase.cloudfunctions.net/cors';
const kUrlCodemagicApp = 'https://codemagic.io/app/6016fea79e376afc41c2799c';
const kUrlPatreon = 'https://patreon.com/classifyapp';

const kFcmVapidKey =
    'BP4uW-b9TSnKJrJsoLEF5qu2PjyZ03HOinAS1VXV_uM9daAGwr8pg7rvqTItdOSpLGfTOCg3jSB_8v378wu-8mo';
const kSentryDSN = String.fromEnvironment('SENTRY_DSN');

const kDynamicLinkDomain = 'link.classify.org.uk';
const kPasswordResetUrl = 'https://auth.classify.org.uk/resetPassword';

const kAppStoreId = '1463780331';

const thickLogo = 'assets/icons/thick_logo.png';
const addIcon = 'assets/icons/plus.png';
const pencilIcon = 'assets/icons/pencil_icon.svg';

const gradientLogoTransparent = 'assets/intros/gradientLogo.png';
const gradientLogoMain = 'assets/intros/gradient_logo_fill.png';

const int MAX_DURATION = 60 * 60;
const int TIMER_INCREMENT = 30;

const kGoogleSansTextStyle = TextStyle(
  fontFamily: 'GoogleSans',
  fontSize: 14,
  color: Colors.white,
  fontWeight: FontWeight.bold,
);

const kSFTextStyle = TextStyle(
  fontFamily: 'SFProText',
  fontSize: 14,
  color: Colors.white,
  fontWeight: FontWeight.bold,
);

List<Color> homeGradient = [homeBlue, homePink];
Color homeBlue = Color(0xff585DFF);
Color homePink = Color(0xffF157FF);
const Color kLightGrey = Color(0xFFCBCBCB);
const Color kPurpleColor1 = Color(0xFF6D8AFF);
Color kGreenColor1 = Color(0xFF00FFBB);
Color kGreenColor2 = Color(0xFF00AF81);

Color kPurpleColor2 = Color(0xFF3B3E66);
Color kOrangeColor1 = Color(0xFFF7946F);
Color kOrangeColor2 = Color(0xFFF8B32D);
Color kRedColor = Color(0xFFFF0057);
Color kOrangeColor3 = Color(0xFFFF8000);

Color kPurpleColor3 = Color(0xFF232554);
Color kPurpleColor4 = Color(0xFFA0A5FF);
Color kPurpleColor5 = Color(0xFFB195FF); // 2a2d5c
Color kPurpleColor6 = Color(0xFFF29FFF);
Color kPurpleColor7 = Color.fromRGBO(92, 96, 101, 1.0);
Color kPeachColor = Color(0xFFFBAEA2);
Color kPurpleColor8 = Color.fromRGBO(109, 138, 255, 1.0);
Color kPurpleColor9 = Color.fromRGBO(42, 45, 92, 1.0);
Color kPurpleColor10 = Color(0xFF5C60B5);
Color kPurpleColor11 = Color(0xff6378FF);
Color kBlueColor = Color(0xFF486DFF);
Color kBlueColor2 = Color(0xFF305FFF);

Color kGold = Color(0xFFFFBB00);
Color kLightGold = Color(0xFFFFD498);

//Header Colors
const Color kHeaderGreen = Color(0xFF24FF5B);
const Color kHeaderOrange = Color(0xFFFF7B00);
const Color kHeaderPink = Color(0xFFFF0098);

//Fab Colors
Color kGreenFab = Color(0xFF64FFAD);
Color kOrangeFab = Color(0xFFFFC200);
Color kPinkFab = Color(0xFFFF4787);

Color otherLessonColor = Color.fromRGBO(73, 75, 122, 1.0);

// TODO maybe improve these colors due to doughnut charts
const kSubjectsColorList = <Color>[
  Color(0xFFFFCC00),
  Color(0xFF6E00FF),
  Color(0xFFFF4284),
  Color(0xFF00AE96),
  Color(0xFF54FF4E),
  Color(0xFF004CFF),
  Color(0xFFFFA200),
  Color(0xFF53AFFF),
  Color(0xFF22B100),
  Color(0xFFFF70A0),
  Color(0xFF00FF97),
  Color(0xFFFF6600),
  Color(0xFF0088FF),
  Color(0xFFE31D6B),
  Color(0xFFFF4600),
  Color(0xFF1D131B),
  Color(0xFFFF21D3),
  kPurpleColor1,
  Color(0xFF986DFF),
  Color(0xFFFF6D6D),
  Color(0xFF0066FF),
  Color(0xFF00B1AB),
  Color(0xFFFF9100),
  Color(0xFFFF71E7),
  Color(0xFF97FF7E),
  Color(0xFF00CBFF),
  Color(0xFF00FFA0),
  Color(0xFFFF65A4),
  Color(0xFFFFC400),
  Color(0xFF00FF3C),
  Color(0xFF4B3F49),
  Color(0xFF4421FF),
  Color(0xFF4BEDFF),
  Color(0xFF4B51FF),
  Color(0xFF4BFFBC),
  Color(0xFFFF4BB7),
  Color(0xFFFF5700),
  Color(0xFFFF6F00),
  Color(0xFFA600FF),
];

Color getRandomColor() {
  final _random = Random();
  return kSubjectsColorList[_random.nextInt(kSubjectsColorList.length)];
}

List<String>? documentFileTypes = [
  'pdf',
  'doc',
  'docx',
  'odt',
  'rtf',
  'tex',
  'txt',
  'wpd',
  'zip',
  'ods',
  'xls',
  'xlsm',
  'xlsx',
  'c',
  'class',
  'cpp',
  'cs',
  'h',
  'java',
  'php',
  'py',
  'sh',
  'swift',
  'vb',
  'pps',
  'key',
  'odp',
  'ppt',
  'pptx',
  'email',
];

List<String> imageFiles = [
  'jpg',
  'JPG',
  'jpeg',
  'JPEG',
  'png',
  'PNG',
  '.tif',
  '.tiff',
  '.eps',
  '.raw',
];
