// このファイルはタイマー画面のUIを管理します。
// タイマー機能の表示を行います。

import 'package:flutter/material.dart';

class TimerScreen extends StatelessWidget {
  const TimerScreen({super.key});

  /// タイマー画面のUIを構築するメソッド
  /// 引数: [context] - ウィジェットツリーの現在のビルドコンテキスト
  /// 返り値: Widget - タイマー画面のUIを表すウィジェット
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