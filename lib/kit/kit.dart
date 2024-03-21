import 'package:codex/kit/coder/base64_coder.dart';
import 'package:codex/kit/coder/url_coder.dart';
import 'package:codex/kit/home.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'kit.freezed.dart';
part 'kit.g.dart';

@freezed
class Kit with _$Kit {
  const factory Kit({
    required String name,
    required String route,
    required IconData icon,
    required WidgetBuilder builder,
  }) = _Kit;
}

@freezed
class KitGroup with _$KitGroup {
  const factory KitGroup({
    required String name,
    required List<Kit> kits,
    required bool collapsed,
  }) = _KitGroup;
}

@riverpod
class KitStore extends _$KitStore {
  final _kitGroups = [
    KitGroup(
      name: 'Encoders / Decoders',
      kits: [
        Base64Coder.kit,
        UrlCoder.kit,
      ],
      collapsed: false,
    ),
  ];

  @override
  Kit build() {
    return Home.kit;
  }

  void goto(Kit kit) {
    state = kit;
  }

  void filter(String? key) {}

  List<KitGroup> get kitGroups => _kitGroups;
}
