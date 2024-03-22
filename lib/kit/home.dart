import 'package:codex/kit/kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  static Kit kit = Kit(
    name: 'Home',
    route: 'home',
    description: 'All kits',
    icon: Icons.home,
    builder: (context) => const Home(),
  );

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends ConsumerState<ConsumerStatefulWidget> {
  void goto(Kit kit) {
    ref.read(kitStoreProvider.notifier).goto(kit);
  }

  Widget kitItem(Kit kit) {
    const radius = Radius.circular(8);
    return GestureDetector(
      onTap: () {
        goto(kit);
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Colors.black12.withOpacity(0.1),
          borderRadius: const BorderRadius.all(radius),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 80,
              height: 80,
              color: Colors.black26.withOpacity(0.2),
              alignment: Alignment.center,
              child: Icon(kit.icon),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 20, 8, 4),
              child: Text(
                "${kit.name} ${kit.category}",
                style: const TextStyle(fontSize: 12),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 16),
                child: Text(
                  kit.description,
                  style: const TextStyle(fontSize: 10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final kitGroups = ref.read(kitStoreProvider.notifier).kitGroups;
    final kits = kitGroups.fold(<Kit>[], (acc, group) {
      acc.addAll(group.kits);
      return acc;
    });

    return Center(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Home",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedSize(
                  140,
                  220,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                ),
                itemCount: kits.length,
                itemBuilder: (context, index) {
                  return kitItem(kits[index]);
                }),
          )
        ],
      ),
    );
  }
}

class SliverGridDelegateWithFixedSize extends SliverGridDelegate {
  final double width;
  final double height;
  final double mainAxisSpacing;
  final double crossAxisSpacing;

  SliverGridDelegateWithFixedSize(
    this.width,
    this.height, {
    this.mainAxisSpacing = 0.0,
    this.crossAxisSpacing = 0.0,
  });

  @override
  SliverGridLayout getLayout(SliverConstraints constraints) {
    final crossAxisCount = (constraints.crossAxisExtent + mainAxisSpacing) ~/ (width + mainAxisSpacing);
    return SliverGridRegularTileLayout(
      crossAxisCount: crossAxisCount,
      mainAxisStride: height + mainAxisSpacing,
      crossAxisStride: width + crossAxisSpacing,
      childMainAxisExtent: height,
      childCrossAxisExtent: width,
      reverseCrossAxis: axisDirectionIsReversed(constraints.crossAxisDirection),
    );
  }

  @override
  bool shouldRelayout(SliverGridDelegateWithFixedSize oldDelegate) {
    return oldDelegate.width != width || oldDelegate.height != height || oldDelegate.mainAxisSpacing != mainAxisSpacing;
  }
}
