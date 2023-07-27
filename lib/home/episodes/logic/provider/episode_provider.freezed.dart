// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'episode_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EpisodeState {
  AsyncValue<void> get pageState => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get prev => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  List<Episode> get multipleEpisodes => throw _privateConstructorUsedError;
  List<Episode> get episodes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EpisodeStateCopyWith<EpisodeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EpisodeStateCopyWith<$Res> {
  factory $EpisodeStateCopyWith(
          EpisodeState value, $Res Function(EpisodeState) then) =
      _$EpisodeStateCopyWithImpl<$Res, EpisodeState>;
  @useResult
  $Res call(
      {AsyncValue<void> pageState,
      String? next,
      String? prev,
      int count,
      List<Episode> multipleEpisodes,
      List<Episode> episodes});
}

/// @nodoc
class _$EpisodeStateCopyWithImpl<$Res, $Val extends EpisodeState>
    implements $EpisodeStateCopyWith<$Res> {
  _$EpisodeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageState = null,
    Object? next = freezed,
    Object? prev = freezed,
    Object? count = null,
    Object? multipleEpisodes = null,
    Object? episodes = null,
  }) {
    return _then(_value.copyWith(
      pageState: null == pageState
          ? _value.pageState
          : pageState // ignore: cast_nullable_to_non_nullable
              as AsyncValue<void>,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      prev: freezed == prev
          ? _value.prev
          : prev // ignore: cast_nullable_to_non_nullable
              as String?,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      multipleEpisodes: null == multipleEpisodes
          ? _value.multipleEpisodes
          : multipleEpisodes // ignore: cast_nullable_to_non_nullable
              as List<Episode>,
      episodes: null == episodes
          ? _value.episodes
          : episodes // ignore: cast_nullable_to_non_nullable
              as List<Episode>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EpisodeStateCopyWith<$Res>
    implements $EpisodeStateCopyWith<$Res> {
  factory _$$_EpisodeStateCopyWith(
          _$_EpisodeState value, $Res Function(_$_EpisodeState) then) =
      __$$_EpisodeStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AsyncValue<void> pageState,
      String? next,
      String? prev,
      int count,
      List<Episode> multipleEpisodes,
      List<Episode> episodes});
}

/// @nodoc
class __$$_EpisodeStateCopyWithImpl<$Res>
    extends _$EpisodeStateCopyWithImpl<$Res, _$_EpisodeState>
    implements _$$_EpisodeStateCopyWith<$Res> {
  __$$_EpisodeStateCopyWithImpl(
      _$_EpisodeState _value, $Res Function(_$_EpisodeState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageState = null,
    Object? next = freezed,
    Object? prev = freezed,
    Object? count = null,
    Object? multipleEpisodes = null,
    Object? episodes = null,
  }) {
    return _then(_$_EpisodeState(
      pageState: null == pageState
          ? _value.pageState
          : pageState // ignore: cast_nullable_to_non_nullable
              as AsyncValue<void>,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      prev: freezed == prev
          ? _value.prev
          : prev // ignore: cast_nullable_to_non_nullable
              as String?,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      multipleEpisodes: null == multipleEpisodes
          ? _value._multipleEpisodes
          : multipleEpisodes // ignore: cast_nullable_to_non_nullable
              as List<Episode>,
      episodes: null == episodes
          ? _value._episodes
          : episodes // ignore: cast_nullable_to_non_nullable
              as List<Episode>,
    ));
  }
}

/// @nodoc

class _$_EpisodeState implements _EpisodeState {
  const _$_EpisodeState(
      {this.pageState = const AsyncData<void>(null),
      this.next = null,
      this.prev = null,
      this.count = 1,
      final List<Episode> multipleEpisodes = const [],
      final List<Episode> episodes = const []})
      : _multipleEpisodes = multipleEpisodes,
        _episodes = episodes;

  @override
  @JsonKey()
  final AsyncValue<void> pageState;
  @override
  @JsonKey()
  final String? next;
  @override
  @JsonKey()
  final String? prev;
  @override
  @JsonKey()
  final int count;
  final List<Episode> _multipleEpisodes;
  @override
  @JsonKey()
  List<Episode> get multipleEpisodes {
    if (_multipleEpisodes is EqualUnmodifiableListView)
      return _multipleEpisodes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_multipleEpisodes);
  }

  final List<Episode> _episodes;
  @override
  @JsonKey()
  List<Episode> get episodes {
    if (_episodes is EqualUnmodifiableListView) return _episodes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_episodes);
  }

  @override
  String toString() {
    return 'EpisodeState(pageState: $pageState, next: $next, prev: $prev, count: $count, multipleEpisodes: $multipleEpisodes, episodes: $episodes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EpisodeState &&
            (identical(other.pageState, pageState) ||
                other.pageState == pageState) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.prev, prev) || other.prev == prev) &&
            (identical(other.count, count) || other.count == count) &&
            const DeepCollectionEquality()
                .equals(other._multipleEpisodes, _multipleEpisodes) &&
            const DeepCollectionEquality().equals(other._episodes, _episodes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      pageState,
      next,
      prev,
      count,
      const DeepCollectionEquality().hash(_multipleEpisodes),
      const DeepCollectionEquality().hash(_episodes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EpisodeStateCopyWith<_$_EpisodeState> get copyWith =>
      __$$_EpisodeStateCopyWithImpl<_$_EpisodeState>(this, _$identity);
}

abstract class _EpisodeState implements EpisodeState {
  const factory _EpisodeState(
      {final AsyncValue<void> pageState,
      final String? next,
      final String? prev,
      final int count,
      final List<Episode> multipleEpisodes,
      final List<Episode> episodes}) = _$_EpisodeState;

  @override
  AsyncValue<void> get pageState;
  @override
  String? get next;
  @override
  String? get prev;
  @override
  int get count;
  @override
  List<Episode> get multipleEpisodes;
  @override
  List<Episode> get episodes;
  @override
  @JsonKey(ignore: true)
  _$$_EpisodeStateCopyWith<_$_EpisodeState> get copyWith =>
      throw _privateConstructorUsedError;
}
