// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'currency_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CurrencyEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CurrencyEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CurrencyEvent()';
  }
}

/// @nodoc
class $CurrencyEventCopyWith<$Res> {
  $CurrencyEventCopyWith(CurrencyEvent _, $Res Function(CurrencyEvent) __);
}

/// Adds pattern-matching-related methods to [CurrencyEvent].
extension CurrencyEventPatterns on CurrencyEvent {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? loadList,
    TResult Function(_FetchRequested value)? fetchRequested,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Load() when loadList != null:
        return loadList(_that);
      case _FetchRequested() when fetchRequested != null:
        return fetchRequested(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) loadList,
    required TResult Function(_FetchRequested value) fetchRequested,
  }) {
    final _that = this;
    switch (_that) {
      case _Load():
        return loadList(_that);
      case _FetchRequested():
        return fetchRequested(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? loadList,
    TResult? Function(_FetchRequested value)? fetchRequested,
  }) {
    final _that = this;
    switch (_that) {
      case _Load() when loadList != null:
        return loadList(_that);
      case _FetchRequested() when fetchRequested != null:
        return fetchRequested(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CurrencyModel> currencyList)? loadList,
    TResult Function()? fetchRequested,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Load() when loadList != null:
        return loadList(_that.currencyList);
      case _FetchRequested() when fetchRequested != null:
        return fetchRequested();
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CurrencyModel> currencyList) loadList,
    required TResult Function() fetchRequested,
  }) {
    final _that = this;
    switch (_that) {
      case _Load():
        return loadList(_that.currencyList);
      case _FetchRequested():
        return fetchRequested();
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<CurrencyModel> currencyList)? loadList,
    TResult? Function()? fetchRequested,
  }) {
    final _that = this;
    switch (_that) {
      case _Load() when loadList != null:
        return loadList(_that.currencyList);
      case _FetchRequested() when fetchRequested != null:
        return fetchRequested();
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Load implements CurrencyEvent {
  const _Load({required final List<CurrencyModel> currencyList})
      : _currencyList = currencyList;

  final List<CurrencyModel> _currencyList;
  List<CurrencyModel> get currencyList {
    if (_currencyList is EqualUnmodifiableListView) return _currencyList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_currencyList);
  }

  /// Create a copy of CurrencyEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoadCopyWith<_Load> get copyWith =>
      __$LoadCopyWithImpl<_Load>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Load &&
            const DeepCollectionEquality()
                .equals(other._currencyList, _currencyList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_currencyList));

  @override
  String toString() {
    return 'CurrencyEvent.loadList(currencyList: $currencyList)';
  }
}

/// @nodoc
abstract mixin class _$LoadCopyWith<$Res>
    implements $CurrencyEventCopyWith<$Res> {
  factory _$LoadCopyWith(_Load value, $Res Function(_Load) _then) =
      __$LoadCopyWithImpl;
  @useResult
  $Res call({List<CurrencyModel> currencyList});
}

/// @nodoc
class __$LoadCopyWithImpl<$Res> implements _$LoadCopyWith<$Res> {
  __$LoadCopyWithImpl(this._self, this._then);

  final _Load _self;
  final $Res Function(_Load) _then;

  /// Create a copy of CurrencyEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? currencyList = null,
  }) {
    return _then(_Load(
      currencyList: null == currencyList
          ? _self._currencyList
          : currencyList // ignore: cast_nullable_to_non_nullable
              as List<CurrencyModel>,
    ));
  }
}

/// @nodoc

class _FetchRequested implements CurrencyEvent {
  const _FetchRequested();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _FetchRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CurrencyEvent.fetchRequested()';
  }
}

/// @nodoc
mixin _$CurrencyState {
  bool get isLoading;
  List<CurrencyEntity> get currencyList;
  String? get errorMessage;

  /// Create a copy of CurrencyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CurrencyStateCopyWith<CurrencyState> get copyWith =>
      _$CurrencyStateCopyWithImpl<CurrencyState>(
          this as CurrencyState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CurrencyState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other.currencyList, currencyList) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading,
      const DeepCollectionEquality().hash(currencyList), errorMessage);

  @override
  String toString() {
    return 'CurrencyState(isLoading: $isLoading, currencyList: $currencyList, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $CurrencyStateCopyWith<$Res> {
  factory $CurrencyStateCopyWith(
          CurrencyState value, $Res Function(CurrencyState) _then) =
      _$CurrencyStateCopyWithImpl;
  @useResult
  $Res call(
      {bool isLoading,
      List<CurrencyEntity> currencyList,
      String? errorMessage});
}

/// @nodoc
class _$CurrencyStateCopyWithImpl<$Res>
    implements $CurrencyStateCopyWith<$Res> {
  _$CurrencyStateCopyWithImpl(this._self, this._then);

  final CurrencyState _self;
  final $Res Function(CurrencyState) _then;

  /// Create a copy of CurrencyState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? currencyList = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_self.copyWith(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      currencyList: null == currencyList
          ? _self.currencyList
          : currencyList // ignore: cast_nullable_to_non_nullable
              as List<CurrencyEntity>,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [CurrencyState].
extension CurrencyStatePatterns on CurrencyState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CurrencyState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CurrencyState() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CurrencyState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurrencyState():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CurrencyState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurrencyState() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(bool isLoading, List<CurrencyEntity> currencyList,
            String? errorMessage)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CurrencyState() when $default != null:
        return $default(
            _that.isLoading, _that.currencyList, _that.errorMessage);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(bool isLoading, List<CurrencyEntity> currencyList,
            String? errorMessage)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurrencyState():
        return $default(
            _that.isLoading, _that.currencyList, _that.errorMessage);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(bool isLoading, List<CurrencyEntity> currencyList,
            String? errorMessage)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurrencyState() when $default != null:
        return $default(
            _that.isLoading, _that.currencyList, _that.errorMessage);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CurrencyState implements CurrencyState {
  const _CurrencyState(
      {this.isLoading = false,
      final List<CurrencyEntity> currencyList = const [],
      this.errorMessage})
      : _currencyList = currencyList;

  @override
  @JsonKey()
  final bool isLoading;
  final List<CurrencyEntity> _currencyList;
  @override
  @JsonKey()
  List<CurrencyEntity> get currencyList {
    if (_currencyList is EqualUnmodifiableListView) return _currencyList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_currencyList);
  }

  @override
  final String? errorMessage;

  /// Create a copy of CurrencyState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CurrencyStateCopyWith<_CurrencyState> get copyWith =>
      __$CurrencyStateCopyWithImpl<_CurrencyState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CurrencyState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._currencyList, _currencyList) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading,
      const DeepCollectionEquality().hash(_currencyList), errorMessage);

  @override
  String toString() {
    return 'CurrencyState(isLoading: $isLoading, currencyList: $currencyList, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class _$CurrencyStateCopyWith<$Res>
    implements $CurrencyStateCopyWith<$Res> {
  factory _$CurrencyStateCopyWith(
          _CurrencyState value, $Res Function(_CurrencyState) _then) =
      __$CurrencyStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<CurrencyEntity> currencyList,
      String? errorMessage});
}

/// @nodoc
class __$CurrencyStateCopyWithImpl<$Res>
    implements _$CurrencyStateCopyWith<$Res> {
  __$CurrencyStateCopyWithImpl(this._self, this._then);

  final _CurrencyState _self;
  final $Res Function(_CurrencyState) _then;

  /// Create a copy of CurrencyState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isLoading = null,
    Object? currencyList = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_CurrencyState(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      currencyList: null == currencyList
          ? _self._currencyList
          : currencyList // ignore: cast_nullable_to_non_nullable
              as List<CurrencyEntity>,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
