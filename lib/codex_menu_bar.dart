import 'package:codex/kit/coder/base64_coder.dart';
import 'package:flutter/material.dart';

class Menu {
  final String name;
  final String route;
  final IconData icon;

  const Menu({
    required this.name,
    required this.route,
    required this.icon,
  });

  Menu.home()
      : name = 'Home',
        route = 'home',
        icon = Icons.home;
}

class MenuGroup {
  final String name;
  final List<Menu> menus;
  final bool collapsed;

  const MenuGroup({
    required this.name,
    required this.menus,
    required this.collapsed,
  });
}

class CodexMenuBar extends StatefulWidget {
  const CodexMenuBar({super.key});

  @override
  State<StatefulWidget> createState() {
    return CodexMenuBarState();
  }
}

class CodexMenuBarState extends State<CodexMenuBar> {
  final groups = [
    const MenuGroup(
      name: 'Encoders / Decoders',
      menus: [
        Menu(name: 'Base64', route: Base64Coder.route, icon: Icons.code_rounded),
        Menu(name: 'Base64', route: Base64Coder.route, icon: Icons.code_rounded),
        Menu(name: 'Base64', route: Base64Coder.route, icon: Icons.code_rounded),
        Menu(name: 'Base64', route: Base64Coder.route, icon: Icons.code_rounded),
      ],
      collapsed: false,
    ),
    const MenuGroup(
      name: 'Encoders / Decoders',
      menus: [
        Menu(name: 'Base64', route: Base64Coder.route, icon: Icons.code_rounded),
        Menu(name: 'Base64', route: Base64Coder.route, icon: Icons.code_rounded),
        Menu(name: 'Base64', route: Base64Coder.route, icon: Icons.code_rounded),
        Menu(name: 'Base64', route: Base64Coder.route, icon: Icons.code_rounded),
      ],
      collapsed: false,
    ),
    const MenuGroup(
      name: 'Encoders / Decoders',
      menus: [
        Menu(name: 'Base64', route: Base64Coder.route, icon: Icons.code_rounded),
        Menu(name: 'Base64', route: Base64Coder.route, icon: Icons.code_rounded),
        Menu(name: 'Base64', route: Base64Coder.route, icon: Icons.code_rounded),
        Menu(name: 'Base64', route: Base64Coder.route, icon: Icons.code_rounded),
      ],
      collapsed: false,
    ),
  ];

  void filter(String? input) {}

  Widget menuItem(Menu menu, VoidCallback onPressed) => TextButton.icon(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
          alignment: Alignment.centerLeft,
        ),
        icon: Icon(menu.icon),
        label: Text(menu.name),
      );

  Widget menuGroup(MenuGroup group) {
    final menus = group.menus.map(
      (menu) => menuItem(menu, () {}),
    );

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
        ...menus,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final menuGroups = groups.map((group) => menuGroup(group));

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
            menuItem(Menu.home(), () {}),
            ...menuGroups,
          ],
        ),
      ),
    );
  }
}
