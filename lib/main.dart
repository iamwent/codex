import 'dart:io';

import 'package:codex/app.dart';
import 'package:flutter/material.dart';
import 'package:window_size/window_size.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowTitle('CodeX');
    setWindowMinSize(const Size(640, 500));
  }

  runApp(const ProviderScope(child:CodexApp()));
}
