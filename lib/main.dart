import 'dart:io';

import 'package:codex/kit/coder/base64_coder.dart';
import 'package:codex/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:window_size/window_size.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowTitle('CodeX');
    setWindowMinSize(const Size(640, 500));
  }

  runApp(const CodexApp());
}

class CodexApp extends StatelessWidget {
  const CodexApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CodeX',
      theme: codexTheme(),
      color: Colors.white,
      home: const Scaffold(
        body: Base64Coder(),
      ),
    );
  }
}
