import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer_trial/constants.dart';
import 'package:timer_trial/pages/other_page.dart';
import 'package:timer_trial/pages/zone.dart';
import 'package:timer_trial/provider.dart';

void main(List<String> args) {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TimerProvider(),
      child: MaterialApp(
        home: ClassifyTrial(),
      ),
    ),
  );
}

class ClassifyTrial extends StatefulWidget {
  const ClassifyTrial({super.key});

  @override
  State<ClassifyTrial> createState() => _ClassifyTrialState();
}

class _ClassifyTrialState extends State<ClassifyTrial> {
  Widget _currentPage = ZonePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          buttonBackgroundColor: kPurpleColor2,
          backgroundColor: kPurpleColor3,
          color: kPurpleColor2,
          onTap: (value) => {
            if (value == 0)
              {
                setState(() {
                  _currentPage = ZonePage();
                })
              }
            else
              {
                setState(() {
                  _currentPage = OtherPage();
                })
              }
          },
          items: [
            CurvedNavigationBarItem(
              child: Image.asset(
                'assets/icons/icons8_tomato_96px_3.png',
                height: 40,
                width: 40,
              ),
              label: "Zone",
              labelStyle: kGoogleSansTextStyle.copyWith(
                  fontSize: 14, color: Colors.white),
            ),
            CurvedNavigationBarItem(
                child: Icon(
                  Icons.home_rounded,
                  size: 40,
                  color: Colors.white,
                ),
                label: "Other Page",
                labelStyle: kGoogleSansTextStyle.copyWith(
                    fontSize: 14, color: Colors.white)),
          ],
        ),
        backgroundColor: kPurpleColor3,
        body: _currentPage);
  }
}
