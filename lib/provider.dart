import 'dart:async';
import 'package:flutter/foundation.dart';

class TimerProvider extends ChangeNotifier {
  static const String work = "Work";
  static const String shortBreak = "Short Break";
  static const String longBreak = "Long Break";

  String _mode = work;
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
  bool _tempAutoTransition = true;

  double get tempWorkMaxValue => _tempWorkMaxValue;
  double get tempBreakMaxValue => _tempBreakMaxValue;
  double get tempLongBreakMaxValue => _tempLongBreakMaxValue;
  bool get tempAutoTransition => _tempAutoTransition;

  String get mode => _mode;
  int get totalDuration => _totalDuration;
  Timer? get timer => _timer;
  bool get autoTransition => _autoTransition;

  int get workMax => _workMax;
  int get breakMax => _breakMax;
  int get longBreakMax => _longBreakMax;

  bool get isRunning => _isRunning;
  int get duration => _duration;

  set tempWorkMaxValue(double value) {
    _tempWorkMaxValue = value;
    notifyListeners();
  }

  set tempAutoTransition(bool value) {
    _tempAutoTransition = value;
    notifyListeners();
  }

  set tempLongBreakMaxValue(double value) {
    _tempLongBreakMaxValue = value;
    notifyListeners();
  }

  set tempBreakMaxValue(double value) {
    _tempBreakMaxValue = value;
    notifyListeners();
  }

  set mode(String value) {
    _mode = value;
    notifyListeners();
  }

  set totalDuration(int value) {
    _totalDuration = value;
    notifyListeners();
  }

  set timer(Timer? value) {
    _timer = value;
    notifyListeners();
  }

  set autoTransition(bool value) {
    _autoTransition = value;
    notifyListeners();
  }

  set workMax(int value) {
    _workMax = value;
    notifyListeners();
  }

  set breakMax(int value) {
    _breakMax = value;
    notifyListeners();
  }

  set longBreakMax(int value) {
    _longBreakMax = value;
    notifyListeners();
  }

  set isRunning(bool value) {
    _isRunning = value;
    notifyListeners();
  }

  set duration(int value) {
    _duration = value;
    notifyListeners();
  }

  void startTimer() {
    if (_isRunning) return;

    _isRunning = true;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_duration > 0) {
        _duration--;
        notifyListeners();
      } else {
        _stopTimer();
        if (_autoTransition) {
          if (_mode == work) {
            switchMode(shortBreak, false);
          } else if (_mode == shortBreak) {
            switchMode(longBreak, false);
          } else if (_mode == longBreak) {
            switchMode(work, false);
          }
        } else {
          resetTimer();
        }
      }
    });
    notifyListeners();
  }

  void pauseTimer() {
    if (!_isRunning) return;

    _stopTimer();
    notifyListeners();
  }

  void resetTimer() {
    _stopTimer();
    _duration = _totalDuration;
    notifyListeners();
  }

  void switchMode(String mode, bool isManual) {
    if (_timer != null) {
      _stopTimer();
    }

    if (mode == work) {
      _mode = work;
      _totalDuration = _workMax;
    } else if (mode == shortBreak) {
      _mode = shortBreak;
      _totalDuration = _breakMax;
    } else if (mode == longBreak) {
      _mode = longBreak;
      _totalDuration = _longBreakMax;
    }

    _duration = _totalDuration;

    if (_autoTransition & !isManual) {
      startTimer();
    } else {
      _isRunning = false;
    }
    notifyListeners();
  }

  void _stopTimer() {
    _isRunning = false;
    _timer?.cancel();
    _timer = null;
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }
}
