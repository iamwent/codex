import 'package:codex/kit/kit.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  static Kit kit = Kit(
    name: 'Home',
    route: 'home',
    icon: Icons.home,
    builder: (context) => const Home(),
  );

  @override
  State createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Home'),
    );
  }
}
