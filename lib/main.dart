import 'package:flutter/material.dart';

void main() {
  runApp(const CodexApp());
}

class CodexApp extends StatelessWidget {
  const CodexApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CodeX',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Center(
        child: Text('A toolkit for developers.'),
      ),
    );
  }
}
