import 'package:flutter/material.dart';

class TimerScreen extends StatelessWidget {
  const TimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Color appColor = Theme.of(context).primaryTextTheme.titleLarge?.color ?? Colors.white;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: appColor),
        title: Text('タイマー', style: TextStyle(color: appColor)),
      ),
      body: const Center(
        child: Text('タイマー画面'),
      ),
    );
  }
}