// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CharacterState {
  AsyncValue<void> get pageState => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get prev => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  List<Character> get characters => throw _privateConstructorUsedError;
  List<Character> get multipleCharacters => throw _privateConstructorUsedError;
  List<Character> get residentsCharactersLocation =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CharacterStateCopyWith<CharacterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterStateCopyWith<$Res> {
  factory $CharacterStateCopyWith(
          CharacterState value, $Res Function(CharacterState) then) =
      _$CharacterStateCopyWithImpl<$Res, CharacterState>;
  @useResult
  $Res call(
      {AsyncValue<void> pageState,
      String? next,
      String? prev,
      int count,
      List<Character> characters,
      List<Character> multipleCharacters,
      List<Character> residentsCharactersLocation});
}

/// @nodoc
class _$CharacterStateCopyWithImpl<$Res, $Val extends CharacterState>
    implements $CharacterStateCopyWith<$Res> {
  _$CharacterStateCopyWithImpl(this._value, this._then);

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
    Object? characters = null,
    Object? multipleCharacters = null,
    Object? residentsCharactersLocation = null,
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
      characters: null == characters
          ? _value.characters
          : characters // ignore: cast_nullable_to_non_nullable
              as List<Character>,
      multipleCharacters: null == multipleCharacters
          ? _value.multipleCharacters
          : multipleCharacters // ignore: cast_nullable_to_non_nullable
              as List<Character>,
      residentsCharactersLocation: null == residentsCharactersLocation
          ? _value.residentsCharactersLocation
          : residentsCharactersLocation // ignore: cast_nullable_to_non_nullable
              as List<Character>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CharacterStateCopyWith<$Res>
    implements $CharacterStateCopyWith<$Res> {
  factory _$$_CharacterStateCopyWith(
          _$_CharacterState value, $Res Function(_$_CharacterState) then) =
      __$$_CharacterStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AsyncValue<void> pageState,
      String? next,
      String? prev,
      int count,
      List<Character> characters,
      List<Character> multipleCharacters,
      List<Character> residentsCharactersLocation});
}

/// @nodoc
class __$$_CharacterStateCopyWithImpl<$Res>
    extends _$CharacterStateCopyWithImpl<$Res, _$_CharacterState>
    implements _$$_CharacterStateCopyWith<$Res> {
  __$$_CharacterStateCopyWithImpl(
      _$_CharacterState _value, $Res Function(_$_CharacterState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageState = null,
    Object? next = freezed,
    Object? prev = freezed,
    Object? count = null,
    Object? characters = null,
    Object? multipleCharacters = null,
    Object? residentsCharactersLocation = null,
  }) {
    return _then(_$_CharacterState(
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
      characters: null == characters
          ? _value._characters
          : characters // ignore: cast_nullable_to_non_nullable
              as List<Character>,
      multipleCharacters: null == multipleCharacters
          ? _value._multipleCharacters
          : multipleCharacters // ignore: cast_nullable_to_non_nullable
              as List<Character>,
      residentsCharactersLocation: null == residentsCharactersLocation
          ? _value._residentsCharactersLocation
          : residentsCharactersLocation // ignore: cast_nullable_to_non_nullable
              as List<Character>,
    ));
  }
}

/// @nodoc

class _$_CharacterState implements _CharacterState {
  const _$_CharacterState(
      {this.pageState = const AsyncData<void>(null),
      this.next = null,
      this.prev = null,
      this.count = 1,
      final List<Character> characters = const [],
      final List<Character> multipleCharacters = const [],
      final List<Character> residentsCharactersLocation = const []})
      : _characters = characters,
        _multipleCharacters = multipleCharacters,
        _residentsCharactersLocation = residentsCharactersLocation;

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
  final List<Character> _characters;
  @override
  @JsonKey()
  List<Character> get characters {
    if (_characters is EqualUnmodifiableListView) return _characters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_characters);
  }

  final List<Character> _multipleCharacters;
  @override
  @JsonKey()
  List<Character> get multipleCharacters {
    if (_multipleCharacters is EqualUnmodifiableListView)
      return _multipleCharacters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_multipleCharacters);
  }

  final List<Character> _residentsCharactersLocation;
  @override
  @JsonKey()
  List<Character> get residentsCharactersLocation {
    if (_residentsCharactersLocation is EqualUnmodifiableListView)
      return _residentsCharactersLocation;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_residentsCharactersLocation);
  }

  @override
  String toString() {
    return 'CharacterState(pageState: $pageState, next: $next, prev: $prev, count: $count, characters: $characters, multipleCharacters: $multipleCharacters, residentsCharactersLocation: $residentsCharactersLocation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CharacterState &&
            (identical(other.pageState, pageState) ||
                other.pageState == pageState) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.prev, prev) || other.prev == prev) &&
            (identical(other.count, count) || other.count == count) &&
            const DeepCollectionEquality()
                .equals(other._characters, _characters) &&
            const DeepCollectionEquality()
                .equals(other._multipleCharacters, _multipleCharacters) &&
            const DeepCollectionEquality().equals(
                other._residentsCharactersLocation,
                _residentsCharactersLocation));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      pageState,
      next,
      prev,
      count,
      const DeepCollectionEquality().hash(_characters),
      const DeepCollectionEquality().hash(_multipleCharacters),
      const DeepCollectionEquality().hash(_residentsCharactersLocation));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CharacterStateCopyWith<_$_CharacterState> get copyWith =>
      __$$_CharacterStateCopyWithImpl<_$_CharacterState>(this, _$identity);
}

abstract class _CharacterState implements CharacterState {
  const factory _CharacterState(
      {final AsyncValue<void> pageState,
      final String? next,
      final String? prev,
      final int count,
      final List<Character> characters,
      final List<Character> multipleCharacters,
      final List<Character> residentsCharactersLocation}) = _$_CharacterState;

  @override
  AsyncValue<void> get pageState;
  @override
  String? get next;
  @override
  String? get prev;
  @override
  int get count;
  @override
  List<Character> get characters;
  @override
  List<Character> get multipleCharacters;
  @override
  List<Character> get residentsCharactersLocation;
  @override
  @JsonKey(ignore: true)
  _$$_CharacterStateCopyWith<_$_CharacterState> get copyWith =>
      throw _privateConstructorUsedError;
}
