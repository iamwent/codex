// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Kit {
  String get name => throw _privateConstructorUsedError;
  String get route => throw _privateConstructorUsedError;
  IconData get icon => throw _privateConstructorUsedError;
  WidgetBuilder get builder => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $KitCopyWith<Kit> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KitCopyWith<$Res> {
  factory $KitCopyWith(Kit value, $Res Function(Kit) then) =
      _$KitCopyWithImpl<$Res, Kit>;
  @useResult
  $Res call({String name, String route, IconData icon, WidgetBuilder builder});
}

/// @nodoc
class _$KitCopyWithImpl<$Res, $Val extends Kit> implements $KitCopyWith<$Res> {
  _$KitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? route = null,
    Object? icon = null,
    Object? builder = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      route: null == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData,
      builder: null == builder
          ? _value.builder
          : builder // ignore: cast_nullable_to_non_nullable
              as WidgetBuilder,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KitImplCopyWith<$Res> implements $KitCopyWith<$Res> {
  factory _$$KitImplCopyWith(_$KitImpl value, $Res Function(_$KitImpl) then) =
      __$$KitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String route, IconData icon, WidgetBuilder builder});
}

/// @nodoc
class __$$KitImplCopyWithImpl<$Res> extends _$KitCopyWithImpl<$Res, _$KitImpl>
    implements _$$KitImplCopyWith<$Res> {
  __$$KitImplCopyWithImpl(_$KitImpl _value, $Res Function(_$KitImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? route = null,
    Object? icon = null,
    Object? builder = null,
  }) {
    return _then(_$KitImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      route: null == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData,
      builder: null == builder
          ? _value.builder
          : builder // ignore: cast_nullable_to_non_nullable
              as WidgetBuilder,
    ));
  }
}

/// @nodoc

class _$KitImpl implements _Kit {
  const _$KitImpl(
      {required this.name,
      required this.route,
      required this.icon,
      required this.builder});

  @override
  final String name;
  @override
  final String route;
  @override
  final IconData icon;
  @override
  final WidgetBuilder builder;

  @override
  String toString() {
    return 'Kit(name: $name, route: $route, icon: $icon, builder: $builder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KitImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.route, route) || other.route == route) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.builder, builder) || other.builder == builder));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, route, icon, builder);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KitImplCopyWith<_$KitImpl> get copyWith =>
      __$$KitImplCopyWithImpl<_$KitImpl>(this, _$identity);
}

abstract class _Kit implements Kit {
  const factory _Kit(
      {required final String name,
      required final String route,
      required final IconData icon,
      required final WidgetBuilder builder}) = _$KitImpl;

  @override
  String get name;
  @override
  String get route;
  @override
  IconData get icon;
  @override
  WidgetBuilder get builder;
  @override
  @JsonKey(ignore: true)
  _$$KitImplCopyWith<_$KitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$KitGroup {
  String get name => throw _privateConstructorUsedError;
  List<Kit> get kits => throw _privateConstructorUsedError;
  bool get collapsed => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $KitGroupCopyWith<KitGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KitGroupCopyWith<$Res> {
  factory $KitGroupCopyWith(KitGroup value, $Res Function(KitGroup) then) =
      _$KitGroupCopyWithImpl<$Res, KitGroup>;
  @useResult
  $Res call({String name, List<Kit> kits, bool collapsed});
}

/// @nodoc
class _$KitGroupCopyWithImpl<$Res, $Val extends KitGroup>
    implements $KitGroupCopyWith<$Res> {
  _$KitGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? kits = null,
    Object? collapsed = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      kits: null == kits
          ? _value.kits
          : kits // ignore: cast_nullable_to_non_nullable
              as List<Kit>,
      collapsed: null == collapsed
          ? _value.collapsed
          : collapsed // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KitGroupImplCopyWith<$Res>
    implements $KitGroupCopyWith<$Res> {
  factory _$$KitGroupImplCopyWith(
          _$KitGroupImpl value, $Res Function(_$KitGroupImpl) then) =
      __$$KitGroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, List<Kit> kits, bool collapsed});
}

/// @nodoc
class __$$KitGroupImplCopyWithImpl<$Res>
    extends _$KitGroupCopyWithImpl<$Res, _$KitGroupImpl>
    implements _$$KitGroupImplCopyWith<$Res> {
  __$$KitGroupImplCopyWithImpl(
      _$KitGroupImpl _value, $Res Function(_$KitGroupImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? kits = null,
    Object? collapsed = null,
  }) {
    return _then(_$KitGroupImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      kits: null == kits
          ? _value._kits
          : kits // ignore: cast_nullable_to_non_nullable
              as List<Kit>,
      collapsed: null == collapsed
          ? _value.collapsed
          : collapsed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$KitGroupImpl implements _KitGroup {
  const _$KitGroupImpl(
      {required this.name,
      required final List<Kit> kits,
      required this.collapsed})
      : _kits = kits;

  @override
  final String name;
  final List<Kit> _kits;
  @override
  List<Kit> get kits {
    if (_kits is EqualUnmodifiableListView) return _kits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_kits);
  }

  @override
  final bool collapsed;

  @override
  String toString() {
    return 'KitGroup(name: $name, kits: $kits, collapsed: $collapsed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KitGroupImpl &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._kits, _kits) &&
            (identical(other.collapsed, collapsed) ||
                other.collapsed == collapsed));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, name, const DeepCollectionEquality().hash(_kits), collapsed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KitGroupImplCopyWith<_$KitGroupImpl> get copyWith =>
      __$$KitGroupImplCopyWithImpl<_$KitGroupImpl>(this, _$identity);
}

abstract class _KitGroup implements KitGroup {
  const factory _KitGroup(
      {required final String name,
      required final List<Kit> kits,
      required final bool collapsed}) = _$KitGroupImpl;

  @override
  String get name;
  @override
  List<Kit> get kits;
  @override
  bool get collapsed;
  @override
  @JsonKey(ignore: true)
  _$$KitGroupImplCopyWith<_$KitGroupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
