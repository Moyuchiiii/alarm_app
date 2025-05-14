// このファイルは設定画面のUIとロジックを管理します。
// ユーザーが時計の色を変更できる機能を提供します。

import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  final Function(Color) onClockColorChanged;
  final Color currentClockColor;

  const SettingsScreen({
    super.key, 
    required this.onClockColorChanged,
    required this.currentClockColor,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late Color _selectedColor;

  @override
  void initState() {
    super.initState();
    _selectedColor = widget.currentClockColor;
  }

  /// 設定画面のUIを構築するメソッド
  /// 引数: [context] - ウィジェットツリーの現在のビルドコンテキスト
  /// 返り値: Widget - 設定画面のUIを表すウィジェット
  @override
  Widget build(BuildContext context) {
    // ユーザーが選択した色を保存するためのロジック
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('設定', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white), // 戻るボタンの色を設定
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'デジタル時計の文字色',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          ListTile(
            title: const Text('白', style: TextStyle(color: Colors.white)),
            trailing: Radio<Color>(
              value: Colors.white,
              groupValue: _selectedColor,
              onChanged: (Color? value) {
                if (value != null) {
                  setState(() {
                    _selectedColor = value;
                    widget.onClockColorChanged(value);
                  });
                }
              },
            ),
          ),
          ListTile(
            title: const Text('ピンク', style: TextStyle(color: Color(0xFFFFD1DC))),
            trailing: Radio<Color>(
              value: const Color(0xFFFFD1DC),
              groupValue: _selectedColor,
              onChanged: (Color? value) {
                if (value != null) {
                  setState(() {
                    _selectedColor = value;
                    widget.onClockColorChanged(value);
                  });
                }
              },
            ),
          ),
          ListTile(
            title: const Text('青', style: TextStyle(color: Colors.blue)),
            trailing: Radio<Color>(
              value: Colors.blue,
              groupValue: _selectedColor,
              onChanged: (Color? value) {
                if (value != null) {
                  setState(() {
                    _selectedColor = value;
                    widget.onClockColorChanged(value);
                  });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}