import 'package:codex/kit/home.dart';
import 'package:codex/kit/kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CodexMenuBar extends ConsumerStatefulWidget {
  const CodexMenuBar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return CodexMenuBarState();
  }
}

class CodexMenuBarState extends ConsumerState<CodexMenuBar> {
  void filter(String? input) {
    ref.read(kitStoreProvider.notifier).filter(input);
  }

  void goto(Kit kit) {
    ref.read(kitStoreProvider.notifier).goto(kit);
  }

  Widget menuItem(Kit kit) => TextButton.icon(
        onPressed: () {
          goto(kit);
        },
        style: TextButton.styleFrom(
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
          alignment: Alignment.centerLeft,
        ),
        icon: Icon(kit.icon),
        label: Text(kit.name),
      );

  Widget menuGroup(KitGroup group) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            const SizedBox(height: 24),
            Expanded(
              child: Text(
                group.name,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Icon(group.collapsed ? Icons.chevron_right : Icons.chevron_right),
          ],
        ),
        ...group.kits.map(
          (kit) => menuItem(kit),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final kitGroups = ref.read(kitStoreProvider.notifier).kitGroups;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 12, top: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 32,
              child: TextField(
                onChanged: filter,
                cursorHeight: 16,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search_outlined),
                  hintText: 'Search',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(2),
                ),
              ),
            ),
            const SizedBox(height: 12),
            menuItem(Home.kit),
            ...kitGroups.map((group) => menuGroup(group)),
          ],
        ),
      ),
    );
  }
}
