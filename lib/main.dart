import 'package:flutter/material.dart';
import 'dart:async';
import 'package:alarm_app/settings_screen.dart';
import 'package:alarm_app/help_screen.dart';
import 'package:alarm_app/timer_screen.dart';

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
      body: Stack(
        children: [
          Center(
            child: Text(
              _currentTime,
              style: const TextStyle(
                fontSize: 50, // サイズを大きく設定
                fontFamily: 'Y-RabbitFont', // カスタムフォントを適用
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20, // 左下に配置
            child: IconButton(
              onPressed: () {},
              tooltip: 'アラーム',
              icon: const Icon(Icons.alarm),
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
                      MaterialPageRoute(builder: (context) => const SettingsScreen()),
                    );
                  },
                  tooltip: '設定',
                  icon: const Icon(Icons.settings),
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
                  icon: const Icon(Icons.help),
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
              icon: const Icon(Icons.timer),
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
