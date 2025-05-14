// このファイルはデータベース操作を管理します。
// 設定データの保存と取得を行います。

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'settings.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE settings(
            id TEXT PRIMARY KEY,
            value TEXT
          )
        ''');
      },
    );
  }

  Future<void> saveClockColor(Color color) async {
    final db = await database;
    await db.insert(
      'settings',
      {'id': 'clock_color', 'value': color.value.toString()},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<Color> getClockColor() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'settings',
      where: 'id = ?',
      whereArgs: ['clock_color'],
    );

    if (maps.isEmpty) {
      return Colors.white; // デフォルト値
    }

    return Color(int.parse(maps.first['value']));
  }
}