// このファイルはヘルプ画面のUIを管理します。
// ユーザーにアプリの使い方を説明します。

import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  /// ヘルプ画面のUIを構築するメソッド
  /// 引数: [context] - ウィジェットツリーの現在のビルドコンテキスト
  /// 返り値: Widget - ヘルプ画面のUIを表すウィジェット
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ヘルプ'),
      ),
      body: const Center(
        child: Text('ヘルプ画面'),
      ),
    );
  }
}