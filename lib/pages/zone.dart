import 'package:flutter/material.dart';
import 'dart:async';
import 'package:timer_trial/constants.dart';

class TimerMode {
  static const work = "Work";
  static const shortBreak = "Short Break";
  static const longBreak = "Long Break";
}

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
    );
  }
}

class ZonePage extends StatefulWidget {
  @override
  _ZonePageState createState() => _ZonePageState();
}

class _ZonePageState extends State<ZonePage> {
  String _mode = TimerMode.work;
  int _duration = 1500;
  bool _isRunning = false;
  int _totalDuration = 1500;
  Timer? _timer;
  bool _autoTransition = true;

  int _workMax = 1500;
  int _breakMax = 300;
  int _longBreakMax = 600;

  double _tempWorkMaxValue = 1500.0;
  double _tempBreakMaxValue = 300.0;
  double _tempLongBreakMaxValue = 600.0;

  double _tempWorkMax = 1500.0;
  double _tempBreakMax = 300.0;
  double _tempLongBreakMax = 600.0;
  bool _tempAutoTransition = true;

  void _showEditModal() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Color.fromRGBO(35, 37, 84, 1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return DraggableScrollableSheet(
              initialChildSize: 0.86,
              minChildSize: 0.3,
              maxChildSize: 1.0,
              expand: false,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
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
                            Switch(
                              value: _tempAutoTransition,
                              onChanged: (value) {
                                setState(() {
                                  _tempAutoTransition = value;
                                });
                              },
                              activeColor: Colors.white,
                              activeTrackColor: Color.fromRGBO(73, 75, 122, 1),
                            ),
                            Text(
                              'Auto-transition timer',
                              style:
                                  kGoogleSansTextStyle.copyWith(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
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
                                  style: kGoogleSansTextStyle.copyWith(
                                      fontSize: 18),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 300,
                                  height: 5,
                                  child: Slider(
                                    min: 0.5,
                                    max: 60.0,
                                    divisions: 60,
                                    thumbColor:
                                        Color.fromRGBO(109, 138, 255, 1),
                                    activeColor:
                                        Color.fromRGBO(109, 138, 255, 1),
                                    inactiveColor:
                                        Color.fromRGBO(49, 49, 91, 1),
                                    value: _tempWorkMaxValue / 60,
                                    onChanged: (value) {
                                      setState(() {
                                        _tempWorkMaxValue = value * 60;
                                      });
                                    },
                                  ),
                                ),
                                Text(
                                  formatTime(_tempWorkMaxValue.toInt()),
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
                                  style: kGoogleSansTextStyle.copyWith(
                                      fontSize: 18),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 300,
                                  height: 5,
                                  child: Slider(
                                    min: 0.5,
                                    max: 60.0,
                                    thumbColor:
                                        Color.fromRGBO(109, 138, 255, 1),
                                    activeColor:
                                        Color.fromRGBO(109, 138, 255, 1),
                                    inactiveColor:
                                        Color.fromRGBO(49, 49, 91, 1),
                                    value: _tempBreakMaxValue / 60,
                                    onChanged: (value) {
                                      setState(() {
                                        _tempBreakMaxValue = value * 60;
                                      });
                                    },
                                  ),
                                ),
                                Text(
                                  formatTime(_tempBreakMaxValue.toInt()),
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
                                  style: kGoogleSansTextStyle.copyWith(
                                      fontSize: 18),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 300,
                                  height: 5,
                                  child: Slider(
                                    min: 0.5,
                                    max: 60.0,
                                    thumbColor:
                                        Color.fromRGBO(109, 138, 255, 1),
                                    activeColor:
                                        Color.fromRGBO(109, 138, 255, 1),
                                    inactiveColor:
                                        Color.fromRGBO(49, 49, 91, 1),
                                    value: _tempLongBreakMaxValue / 60,
                                    onChanged: (value) {
                                      setState(() {
                                        _tempLongBreakMaxValue = value * 60;
                                      });
                                    },
                                  ),
                                ),
                                Text(
                                  formatTime(_tempLongBreakMaxValue.toInt()),
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
                        width: 500,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              OutlinedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  setState(() {
                                    _tempWorkMaxValue = _tempWorkMax;
                                    _tempBreakMaxValue = _tempBreakMax;
                                    _tempLongBreakMaxValue = _tempLongBreakMax;
                                    _tempAutoTransition = _autoTransition;
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
                                    _workMax = _tempWorkMaxValue.toInt();
                                    _breakMax = _tempBreakMaxValue.toInt();
                                    _longBreakMax =
                                        _tempLongBreakMaxValue.toInt();
                                    _autoTransition = _tempAutoTransition;

                                    if (_mode == TimerMode.work) {
                                      _mode = TimerMode.work;
                                      _totalDuration = _workMax;
                                      _duration = _workMax;
                                    } else if (_mode == TimerMode.shortBreak) {
                                      _mode = TimerMode.shortBreak;
                                      _totalDuration = _breakMax;
                                      _duration = _breakMax;
                                    } else if (_mode == TimerMode.longBreak) {
                                      _mode = TimerMode.longBreak;
                                      _totalDuration = _longBreakMax;
                                      _duration = _longBreakMax;
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
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    ).whenComplete(() => {
          setState(() {
            _tempWorkMaxValue = _workMax.toDouble();
            _tempBreakMaxValue = _breakMax.toDouble();
            _tempLongBreakMaxValue = _longBreakMax.toDouble();
            _tempAutoTransition = _autoTransition;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
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
                                  onTap: () => _switchMode(TimerMode.work),
                                  child: Text(
                                    "POMODORO".toUpperCase(),
                                    style: kSFTextStyle.copyWith(
                                      fontSize: 12,
                                      color: _mode == TimerMode.work
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
                                      _switchMode(TimerMode.shortBreak),
                                  child: Text(
                                    "SHORT BREAK".toUpperCase(),
                                    style: kSFTextStyle.copyWith(
                                      fontSize: 12,
                                      color: _mode == TimerMode.shortBreak
                                          ? Colors.white
                                          : Color.fromRGBO(73, 75, 122, 1),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 11,
                                ),
                                GestureDetector(
                                  onTap: () => _switchMode(TimerMode.longBreak),
                                  child: Text(
                                    "LONG BREAK".toUpperCase(),
                                    style: kSFTextStyle.copyWith(
                                      fontSize: 12,
                                      color: _mode == TimerMode.longBreak
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
                                      value: _duration / _totalDuration,
                                      strokeCap: StrokeCap.round,
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    formatTime(_duration),
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
                                    onPressed: _resetTimer,
                                  ),
                                  backgroundColor:
                                      Color.fromRGBO(73, 75, 122, 1),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                CircleAvatar(
                                  child: IconButton(
                                    onPressed:
                                        _isRunning ? _pauseTimer : _startTimer,
                                    icon: _isRunning
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
                                    onPressed: _showEditModal,
                                  ),
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
                        onPressed: _isRunning ? _pauseTimer : _startTimer,
                        icon: _isRunning
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

  void _startTimer() {
    setState(() {
      _isRunning = true;
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        if (_duration > 0) {
          setState(() {
            _duration--;
          });
        } else {
          _timer?.cancel();
          _isRunning = false;

          // Handle mode transitions
          if (_autoTransition) {
            if (_mode == TimerMode.work) {
              _switchMode(TimerMode.shortBreak);
            } else if (_mode == TimerMode.shortBreak) {
              _switchMode(TimerMode.longBreak);
            } else if (_mode == TimerMode.longBreak) {
              _switchMode(TimerMode.work);
            }
          }
        }
      });
    });
  }

  void _pauseTimer() {
    setState(() {
      _timer?.cancel();
      _isRunning = false;
    });
  }

  void _resetTimer() {
    setState(() {
      _timer?.cancel();
      _isRunning = false;
      _duration = _totalDuration;
    });
  }

  void _closeModal(BuildContext context) {
    print('close');
    Navigator.pop(context);
  }

  void _switchMode(String mode) {
    setState(() {
      if (_timer != null) {
        _timer?.cancel(); // Cancel the existing timer if running
      }

      if (mode == TimerMode.work) {
        _mode = TimerMode.work;
        _totalDuration = _workMax;
        _duration = _totalDuration;
      } else if (mode == TimerMode.shortBreak) {
        _mode = TimerMode.shortBreak;
        _totalDuration = _breakMax;
        _duration = _totalDuration;
      } else if (mode == TimerMode.longBreak) {
        _mode = TimerMode.longBreak;
        _totalDuration = _longBreakMax;
        _duration = _totalDuration;
      }

      _isRunning = false;
    });
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }
}

// Add your constants.dart file content here
