import 'package:flutter/material.dart';
import 'dart:async';
import 'package:alarm_app/settings_screen.dart';
import 'package:alarm_app/help_screen.dart';
import 'package:alarm_app/timer_screen.dart';
import 'package:alarm_app/alarm_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alarm App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryTextTheme: TextTheme(
          titleLarge: TextStyle(color: Colors.white),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _currentTime = '';
  Color _clockColor = Colors.white; // デフォルトの文字色を白に設定

  @override
  void initState() {
    super.initState();
    _updateTime();
    Timer.periodic(const Duration(seconds: 1), (Timer timer) => _updateTime());
  }

  void _updateTime() {
    setState(() {
      final now = DateTime.now();
      _currentTime = '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // 背景色を黒に固定
      body: Stack(
        children: [
          Center(
            child: Text(
              _currentTime,
              style: TextStyle(
                fontSize: 50,
                fontFamily: 'Y-RabbitFont',
                color: _clockColor, // 文字色を変数から設定
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20, // 左下に配置
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AlarmScreen()),
                );
              },
              tooltip: 'アラーム',
              icon: Icon(Icons.alarm, color: _clockColor),
              iconSize: 40, // サイズを調整
            ),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: Column(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SettingsScreen(
                          currentClockColor: _clockColor,
                          onClockColorChanged: (Color newColor) {
                            setState(() {
                              _clockColor = newColor;
                            });
                          },
                        ),
                      ),
                    );
                  },
                  tooltip: '設定',
                  icon: Icon(Icons.settings, color: _clockColor), // アイコンの色を動的に設定
                  iconSize: 30, // サイズを調整
                ),
                const SizedBox(height: 10),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HelpScreen()),
                    );
                  },
                  tooltip: 'ヘルプ',
                  icon: Icon(Icons.help, color: _clockColor), // アイコンの色を動的に設定
                  iconSize: 30, // サイズを調整
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TimerScreen()),
                );
              },
              tooltip: 'タイマー',
              icon: Icon(Icons.timer, color: _clockColor),
              iconSize: 40, // サイズを調整
            ),
          ),
        ],
      ),
    );
  }
}

class AlarmList extends StatefulWidget {
  const AlarmList({super.key});

  @override
  State<AlarmList> createState() => _AlarmListState();
}

class _AlarmListState extends State<AlarmList> {
  final List<String> _alarms = [];

  void _addAlarm() {
    setState(() {
      _alarms.add('Alarm ${DateTime.now()}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alarm List'),
      ),
      body: ListView.builder(
        itemCount: _alarms.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_alarms[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addAlarm,
        tooltip: 'Add Alarm',
        child: const Icon(Icons.add),
      ),
    );
  }
}
