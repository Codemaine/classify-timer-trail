import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer_trial/constants.dart';
import 'package:timer_trial/provider.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Pomodoro Timer'),
          backgroundColor: Colors.white,
        ),
        body: ZonePage(),
      ),
      navigatorKey: navigatorKey,
    );
  }
}

class ZonePage extends StatefulWidget {
  @override
  _ZonePageState createState() => _ZonePageState();
}

class _ZonePageState extends State<ZonePage> {
  void _showEditModal() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Color.fromRGBO(35, 37, 84, 1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      builder: (BuildContext context) {
        final timerProvider = Provider.of<TimerProvider>(context, listen: true);
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color.fromRGBO(35, 37, 84, 1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 140,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  alignment: Alignment.center,
                ),
                Container(
                  padding: EdgeInsets.only(top: 27),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Auto-transition timer',
                        style: kGoogleSansTextStyle.copyWith(fontSize: 18),
                      ),
                      Switch(
                        value: timerProvider.tempAutoTransition,
                        onChanged: (value) {
                          setState(() {
                            timerProvider.tempAutoTransition = value;
                          });
                        },
                        activeColor: Colors.white,
                        activeTrackColor: Color.fromRGBO(73, 75, 122, 1),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 18),
                SizedBox(height: 18),
                Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Pomodoro',
                            style: kGoogleSansTextStyle.copyWith(fontSize: 18),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                              flex: 6,
                              child: Container(
                                height: 5,
                                child: Slider(
                                  min: 0.5,
                                  max: 60.0,
                                  divisions: 60,
                                  thumbColor: Color.fromRGBO(109, 138, 255, 1),
                                  activeColor: Color.fromRGBO(109, 138, 255, 1),
                                  inactiveColor: Color.fromRGBO(49, 49, 91, 1),
                                  value: timerProvider.tempWorkMaxValue / 60,
                                  onChanged: (value) {
                                    setState(() {
                                      timerProvider.tempWorkMaxValue =
                                          value * 60;
                                    });
                                  },
                                ),
                              )),
                          Text(
                            timerProvider.formatTime(
                                timerProvider.tempWorkMaxValue.toInt()),
                            style: kGoogleSansTextStyle.copyWith(
                              fontSize: 32,
                              color: Color.fromRGBO(109, 138, 255, 1),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Short Break',
                            style: kGoogleSansTextStyle.copyWith(fontSize: 18),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                              flex: 6,
                              child: Container(
                                height: 5,
                                child: Slider(
                                  min: 0.5,
                                  max: 60.0,
                                  thumbColor: Color.fromRGBO(109, 138, 255, 1),
                                  activeColor: Color.fromRGBO(109, 138, 255, 1),
                                  inactiveColor: Color.fromRGBO(49, 49, 91, 1),
                                  value: timerProvider.tempBreakMaxValue / 60,
                                  onChanged: (value) {
                                    setState(() {
                                      timerProvider.tempBreakMaxValue =
                                          value * 60;
                                    });
                                  },
                                ),
                              )),
                          Text(
                            timerProvider.formatTime(
                                timerProvider.tempBreakMaxValue.toInt()),
                            style: kGoogleSansTextStyle.copyWith(
                              fontSize: 32,
                              color: Color.fromRGBO(109, 138, 255, 1),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Long Break',
                            style: kGoogleSansTextStyle.copyWith(fontSize: 18),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                              flex: 6,
                              child: Container(
                                height: 5,
                                child: Slider(
                                  min: 0.5,
                                  max: 60.0,
                                  thumbColor: Color.fromRGBO(109, 138, 255, 1),
                                  activeColor: Color.fromRGBO(109, 138, 255, 1),
                                  inactiveColor: Color.fromRGBO(49, 49, 91, 1),
                                  value:
                                      timerProvider.tempLongBreakMaxValue / 60,
                                  onChanged: (value) {
                                    setState(() {
                                      timerProvider.tempLongBreakMaxValue =
                                          value * 60;
                                    });
                                  },
                                ),
                              )),
                          Text(
                            timerProvider.formatTime(
                                timerProvider.tempLongBreakMaxValue.toInt()),
                            style: kGoogleSansTextStyle.copyWith(
                              fontSize: 32,
                              color: Color.fromRGBO(109, 138, 255, 1),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 18),
                Container(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            setState(() {
                              // Revert back changes on cancel
                              timerProvider.tempWorkMaxValue =
                                  timerProvider.workMax.toDouble();
                              timerProvider.tempBreakMaxValue =
                                  timerProvider.breakMax.toDouble();
                              timerProvider.tempLongBreakMaxValue =
                                  timerProvider.longBreakMax.toDouble();
                              timerProvider.tempAutoTransition =
                                  timerProvider.autoTransition;
                            });
                          },
                          child: Text(
                            'Cancel',
                            style: kGoogleSansTextStyle.copyWith(
                              fontSize: 14,
                              color: Color.fromRGBO(109, 138, 255, 1),
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            side: BorderSide(
                              color: Color.fromRGBO(109, 138, 255, 1),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            setState(() {
                              // Save changes on confirmation
                              timerProvider.workMax =
                                  timerProvider.tempWorkMaxValue.toInt();
                              timerProvider.breakMax =
                                  timerProvider.tempBreakMaxValue.toInt();
                              timerProvider.longBreakMax =
                                  timerProvider.tempLongBreakMaxValue.toInt();
                              timerProvider.autoTransition =
                                  timerProvider.tempAutoTransition;

                              // Adjust the mode and durations accordingly
                              if (timerProvider.mode == "Work") {
                                timerProvider.mode = "Work";
                                timerProvider.totalDuration =
                                    timerProvider.workMax;
                                timerProvider.duration = timerProvider.workMax;
                              } else if (timerProvider.mode == "Short Break") {
                                timerProvider.mode = "Short Break";
                                timerProvider.totalDuration =
                                    timerProvider.breakMax;
                                timerProvider.duration = timerProvider.breakMax;
                              } else if (timerProvider.mode == "Long Break") {
                                timerProvider.mode = "Long Break";
                                timerProvider.totalDuration =
                                    timerProvider.longBreakMax;
                                timerProvider.duration =
                                    timerProvider.longBreakMax;
                              }
                            });
                          },
                          child: Text(
                            'Save',
                            style: kGoogleSansTextStyle.copyWith(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            side: BorderSide(
                              color: Color.fromRGBO(109, 138, 255, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        );
      },
    ).whenComplete(() {
      final timerProvider = Provider.of<TimerProvider>(context, listen: false);
      timerProvider.tempWorkMaxValue = timerProvider.workMax.toDouble();
      timerProvider.tempBreakMaxValue = timerProvider.breakMax.toDouble();
      timerProvider.tempLongBreakMaxValue =
          timerProvider.longBreakMax.toDouble();
      timerProvider.tempAutoTransition = timerProvider.autoTransition;
    });
  }

  @override
  Widget build(BuildContext context) {
    final timerProvider = Provider.of<TimerProvider>(context, listen: true);
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height - 80,
              child: Stack(
                children: [
                  Positioned(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.elliptical(100, 20),
                        bottomRight: Radius.elliptical(100, 20),
                      ),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 4,
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          widthFactor: 24.0,
                          heightFactor: 24.0,
                          child: Image.asset(
                            'assets/icons/icons8_tomato_96px_3.png',
                            width: 40,
                            height: 40,
                          ),
                        ),
                        color: Color.fromRGBO(255, 0, 152, 1),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 150,
                    left: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(23),
                        color: Color.fromRGBO(44, 47, 93, 1),
                      ),
                      padding: EdgeInsets.all(23),
                      margin: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(bottom: 27),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () => timerProvider.switchMode("Work"),
                                  child: Text(
                                    "POMODORO".toUpperCase(),
                                    style: kSFTextStyle.copyWith(
                                      fontSize: 12,
                                      color: timerProvider.mode == 'Work'
                                          ? Colors.white
                                          : Color.fromRGBO(73, 75, 122, 1),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 11,
                                ),
                                GestureDetector(
                                  onTap: () =>
                                      timerProvider.switchMode("Short Break"),
                                  child: Text(
                                    "SHORT BREAK".toUpperCase(),
                                    style: kSFTextStyle.copyWith(
                                      fontSize: 12,
                                      color: timerProvider.mode == "Short Break"
                                          ? Colors.white
                                          : Color.fromRGBO(73, 75, 122, 1),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 11,
                                ),
                                GestureDetector(
                                  onTap: () =>
                                      timerProvider.switchMode("Long Break"),
                                  child: Text(
                                    "LONG BREAK".toUpperCase(),
                                    style: kSFTextStyle.copyWith(
                                      fontSize: 12,
                                      color: timerProvider.mode == "Long Break"
                                          ? Colors.white
                                          : Color.fromRGBO(73, 75, 122, 1),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 200.0,
                            child: Stack(
                              children: <Widget>[
                                Center(
                                  child: Container(
                                    width: 200,
                                    height: 200,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 6,
                                      color: Color.fromRGBO(241, 87, 255, 1),
                                      value: timerProvider.duration /
                                          timerProvider.totalDuration,
                                      strokeCap: StrokeCap.round,
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    timerProvider
                                        .formatTime(timerProvider.duration),
                                    style: kGoogleSansTextStyle.copyWith(
                                      fontSize: 40,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 27),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                CircleAvatar(
                                  child: IconButton(
                                    icon: Image.asset(
                                      "assets/icons/icons8_reset_96px_2.png",
                                      width: 20,
                                    ),
                                    onPressed: timerProvider.resetTimer,
                                  ),
                                  backgroundColor:
                                      Color.fromRGBO(73, 75, 122, 1),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                CircleAvatar(
                                  child: IconButton(
                                    onPressed: timerProvider.isRunning
                                        ? timerProvider.pauseTimer
                                        : timerProvider.startTimer,
                                    icon: timerProvider.isRunning
                                        ? Image.asset(
                                            'assets/icons/icons8_pause_96px_2.png',
                                          )
                                        : Image.asset(
                                            'assets/icons/icons8_play_96px_2.png',
                                          ),
                                  ),
                                  backgroundColor:
                                      Color.fromRGBO(255, 0, 255, 1),
                                  maxRadius: 30,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                CircleAvatar(
                                  child: IconButton(
                                      icon: Image.asset(
                                        "assets/icons/icons8_edit_96px_4.png",
                                        width: 20,
                                      ),
                                      onPressed: _showEditModal),
                                  backgroundColor:
                                      Color.fromRGBO(73, 75, 122, 1),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height - 160,
                    right: 20,
                    child: CircleAvatar(
                      child: IconButton(
                        onPressed: timerProvider.isRunning
                            ? timerProvider.pauseTimer
                            : timerProvider.startTimer,
                        icon: timerProvider.isRunning
                            ? Image.asset(
                                'assets/icons/icons8_pause_96px_2.png')
                            : Image.asset(
                                'assets/icons/icons8_play_96px_2.png'),
                      ),
                      backgroundColor: Color.fromRGBO(255, 0, 255, 1),
                      maxRadius: 30,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}

// Add your constants.dart file content here
