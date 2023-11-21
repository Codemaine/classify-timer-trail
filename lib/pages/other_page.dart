import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer_trial/provider.dart';

class OtherPage extends StatefulWidget {
  const OtherPage({super.key});

  @override
  State<OtherPage> createState() => _OtherPageState();
}

class _OtherPageState extends State<OtherPage> {
  @override
  Widget build(BuildContext context) {
    final timerProvider = Provider.of<TimerProvider>(context);

    return Container(
      child: Center(
        child: Text(
          timerProvider.formatTime(timerProvider.duration),
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
