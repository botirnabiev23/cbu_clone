// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'currency_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Currency {
  int? get id;
  String? get code;
  String? get ccy;
  String? get ccyNmRU;
  String? get ccyNmUZ;
  String? get ccyNmUZC;
  String? get ccyNmEN;
  String? get nominal;
  String? get rate;
  String? get diff;
  String? get date;

  /// Create a copy of Currency
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CurrencyCopyWith<Currency> get copyWith =>
      _$CurrencyCopyWithImpl<Currency>(this as Currency, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Currency &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.ccy, ccy) || other.ccy == ccy) &&
            (identical(other.ccyNmRU, ccyNmRU) || other.ccyNmRU == ccyNmRU) &&
            (identical(other.ccyNmUZ, ccyNmUZ) || other.ccyNmUZ == ccyNmUZ) &&
            (identical(other.ccyNmUZC, ccyNmUZC) ||
                other.ccyNmUZC == ccyNmUZC) &&
            (identical(other.ccyNmEN, ccyNmEN) || other.ccyNmEN == ccyNmEN) &&
            (identical(other.nominal, nominal) || other.nominal == nominal) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.diff, diff) || other.diff == diff) &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, code, ccy, ccyNmRU, ccyNmUZ,
      ccyNmUZC, ccyNmEN, nominal, rate, diff, date);

  @override
  String toString() {
    return 'Currency(id: $id, code: $code, ccy: $ccy, ccyNmRU: $ccyNmRU, ccyNmUZ: $ccyNmUZ, ccyNmUZC: $ccyNmUZC, ccyNmEN: $ccyNmEN, nominal: $nominal, rate: $rate, diff: $diff, date: $date)';
  }
}

/// @nodoc
abstract mixin class $CurrencyCopyWith<$Res> {
  factory $CurrencyCopyWith(Currency value, $Res Function(Currency) _then) =
      _$CurrencyCopyWithImpl;
  @useResult
  $Res call(
      {int? id,
      String? code,
      String? ccy,
      String? ccyNmRU,
      String? ccyNmUZ,
      String? ccyNmUZC,
      String? ccyNmEN,
      String? nominal,
      String? rate,
      String? diff,
      String? date});
}

/// @nodoc
class _$CurrencyCopyWithImpl<$Res> implements $CurrencyCopyWith<$Res> {
  _$CurrencyCopyWithImpl(this._self, this._then);

  final Currency _self;
  final $Res Function(Currency) _then;

  /// Create a copy of Currency
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? ccy = freezed,
    Object? ccyNmRU = freezed,
    Object? ccyNmUZ = freezed,
    Object? ccyNmUZC = freezed,
    Object? ccyNmEN = freezed,
    Object? nominal = freezed,
    Object? rate = freezed,
    Object? diff = freezed,
    Object? date = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      ccy: freezed == ccy
          ? _self.ccy
          : ccy // ignore: cast_nullable_to_non_nullable
              as String?,
      ccyNmRU: freezed == ccyNmRU
          ? _self.ccyNmRU
          : ccyNmRU // ignore: cast_nullable_to_non_nullable
              as String?,
      ccyNmUZ: freezed == ccyNmUZ
          ? _self.ccyNmUZ
          : ccyNmUZ // ignore: cast_nullable_to_non_nullable
              as String?,
      ccyNmUZC: freezed == ccyNmUZC
          ? _self.ccyNmUZC
          : ccyNmUZC // ignore: cast_nullable_to_non_nullable
              as String?,
      ccyNmEN: freezed == ccyNmEN
          ? _self.ccyNmEN
          : ccyNmEN // ignore: cast_nullable_to_non_nullable
              as String?,
      nominal: freezed == nominal
          ? _self.nominal
          : nominal // ignore: cast_nullable_to_non_nullable
              as String?,
      rate: freezed == rate
          ? _self.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as String?,
      diff: freezed == diff
          ? _self.diff
          : diff // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [Currency].
extension CurrencyPatterns on Currency {
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
    TResult Function(_Currency value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Currency() when $default != null:
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
    TResult Function(_Currency value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Currency():
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
    TResult? Function(_Currency value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Currency() when $default != null:
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
    TResult Function(
            int? id,
            String? code,
            String? ccy,
            String? ccyNmRU,
            String? ccyNmUZ,
            String? ccyNmUZC,
            String? ccyNmEN,
            String? nominal,
            String? rate,
            String? diff,
            String? date)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Currency() when $default != null:
        return $default(
            _that.id,
            _that.code,
            _that.ccy,
            _that.ccyNmRU,
            _that.ccyNmUZ,
            _that.ccyNmUZC,
            _that.ccyNmEN,
            _that.nominal,
            _that.rate,
            _that.diff,
            _that.date);
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
    TResult Function(
            int? id,
            String? code,
            String? ccy,
            String? ccyNmRU,
            String? ccyNmUZ,
            String? ccyNmUZC,
            String? ccyNmEN,
            String? nominal,
            String? rate,
            String? diff,
            String? date)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Currency():
        return $default(
            _that.id,
            _that.code,
            _that.ccy,
            _that.ccyNmRU,
            _that.ccyNmUZ,
            _that.ccyNmUZC,
            _that.ccyNmEN,
            _that.nominal,
            _that.rate,
            _that.diff,
            _that.date);
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
    TResult? Function(
            int? id,
            String? code,
            String? ccy,
            String? ccyNmRU,
            String? ccyNmUZ,
            String? ccyNmUZC,
            String? ccyNmEN,
            String? nominal,
            String? rate,
            String? diff,
            String? date)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Currency() when $default != null:
        return $default(
            _that.id,
            _that.code,
            _that.ccy,
            _that.ccyNmRU,
            _that.ccyNmUZ,
            _that.ccyNmUZC,
            _that.ccyNmEN,
            _that.nominal,
            _that.rate,
            _that.diff,
            _that.date);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Currency implements Currency {
  const _Currency(
      {this.id,
      this.code,
      this.ccy,
      this.ccyNmRU,
      this.ccyNmUZ,
      this.ccyNmUZC,
      this.ccyNmEN,
      this.nominal,
      this.rate,
      this.diff,
      this.date});

  @override
  final int? id;
  @override
  final String? code;
  @override
  final String? ccy;
  @override
  final String? ccyNmRU;
  @override
  final String? ccyNmUZ;
  @override
  final String? ccyNmUZC;
  @override
  final String? ccyNmEN;
  @override
  final String? nominal;
  @override
  final String? rate;
  @override
  final String? diff;
  @override
  final String? date;

  /// Create a copy of Currency
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CurrencyCopyWith<_Currency> get copyWith =>
      __$CurrencyCopyWithImpl<_Currency>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Currency &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.ccy, ccy) || other.ccy == ccy) &&
            (identical(other.ccyNmRU, ccyNmRU) || other.ccyNmRU == ccyNmRU) &&
            (identical(other.ccyNmUZ, ccyNmUZ) || other.ccyNmUZ == ccyNmUZ) &&
            (identical(other.ccyNmUZC, ccyNmUZC) ||
                other.ccyNmUZC == ccyNmUZC) &&
            (identical(other.ccyNmEN, ccyNmEN) || other.ccyNmEN == ccyNmEN) &&
            (identical(other.nominal, nominal) || other.nominal == nominal) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.diff, diff) || other.diff == diff) &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, code, ccy, ccyNmRU, ccyNmUZ,
      ccyNmUZC, ccyNmEN, nominal, rate, diff, date);

  @override
  String toString() {
    return 'Currency(id: $id, code: $code, ccy: $ccy, ccyNmRU: $ccyNmRU, ccyNmUZ: $ccyNmUZ, ccyNmUZC: $ccyNmUZC, ccyNmEN: $ccyNmEN, nominal: $nominal, rate: $rate, diff: $diff, date: $date)';
  }
}

/// @nodoc
abstract mixin class _$CurrencyCopyWith<$Res>
    implements $CurrencyCopyWith<$Res> {
  factory _$CurrencyCopyWith(_Currency value, $Res Function(_Currency) _then) =
      __$CurrencyCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? id,
      String? code,
      String? ccy,
      String? ccyNmRU,
      String? ccyNmUZ,
      String? ccyNmUZC,
      String? ccyNmEN,
      String? nominal,
      String? rate,
      String? diff,
      String? date});
}

/// @nodoc
class __$CurrencyCopyWithImpl<$Res> implements _$CurrencyCopyWith<$Res> {
  __$CurrencyCopyWithImpl(this._self, this._then);

  final _Currency _self;
  final $Res Function(_Currency) _then;

  /// Create a copy of Currency
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? ccy = freezed,
    Object? ccyNmRU = freezed,
    Object? ccyNmUZ = freezed,
    Object? ccyNmUZC = freezed,
    Object? ccyNmEN = freezed,
    Object? nominal = freezed,
    Object? rate = freezed,
    Object? diff = freezed,
    Object? date = freezed,
  }) {
    return _then(_Currency(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      ccy: freezed == ccy
          ? _self.ccy
          : ccy // ignore: cast_nullable_to_non_nullable
              as String?,
      ccyNmRU: freezed == ccyNmRU
          ? _self.ccyNmRU
          : ccyNmRU // ignore: cast_nullable_to_non_nullable
              as String?,
      ccyNmUZ: freezed == ccyNmUZ
          ? _self.ccyNmUZ
          : ccyNmUZ // ignore: cast_nullable_to_non_nullable
              as String?,
      ccyNmUZC: freezed == ccyNmUZC
          ? _self.ccyNmUZC
          : ccyNmUZC // ignore: cast_nullable_to_non_nullable
              as String?,
      ccyNmEN: freezed == ccyNmEN
          ? _self.ccyNmEN
          : ccyNmEN // ignore: cast_nullable_to_non_nullable
              as String?,
      nominal: freezed == nominal
          ? _self.nominal
          : nominal // ignore: cast_nullable_to_non_nullable
              as String?,
      rate: freezed == rate
          ? _self.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as String?,
      diff: freezed == diff
          ? _self.diff
          : diff // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
