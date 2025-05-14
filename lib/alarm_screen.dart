// このファイルはアラーム画面のUIを管理します。
// アラーム機能の表示を行います。

import 'package:flutter/material.dart';

class AlarmScreen extends StatelessWidget {
  const AlarmScreen({super.key});

  /// アラーム画面のUIを構築するメソッド
  /// 引数: [context] - ウィジェットツリーの現在のビルドコンテキスト
  /// 返り値: Widget - アラーム画面のUIを表すウィジェット
  @override
  Widget build(BuildContext context) {
    final Color appColor = Theme.of(context).primaryTextTheme.titleLarge?.color ?? Colors.white;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: appColor),
        title: Text('アラーム', style: TextStyle(color: appColor)),
      ),
      body: const Center(
        child: Text('アラーム画面'),
      ),
    );
  }
}