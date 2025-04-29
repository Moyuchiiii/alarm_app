import 'package:flutter/material.dart';
import 'dart:async';

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
      _currentTime = DateTime.now().toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alarm App'),
      ),
      body: Center(
        child: Text(
          _currentTime,
          style: const TextStyle(fontSize: 20),
        ),
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
