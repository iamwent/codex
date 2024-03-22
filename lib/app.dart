import 'package:codex/codex_menu_bar.dart';
import 'package:codex/kit/kit.dart';
import 'package:codex/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CodexApp extends ConsumerWidget {
  const CodexApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final kitStore = ref.watch(kitStoreProvider);
    return MaterialApp(
      title: 'CodeX',
      theme: codexTheme(),
      color: Colors.white,
      home: Scaffold(
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: 160,
              child: CodexMenuBar(),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: kitStore.builder.call(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
