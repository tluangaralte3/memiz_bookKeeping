// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expensereport_element.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ExpenseReportElement _$ExpenseReportElementFromJson(Map<String, dynamic> json) {
  return _ExpenseReportElement.fromJson(json);
}

/// @nodoc
mixin _$ExpenseReportElement {
  String get categoryTitle => throw _privateConstructorUsedError;
  int get countOfEntries => throw _privateConstructorUsedError;
  int get totalAmount => throw _privateConstructorUsedError;
  double get monthShare => throw _privateConstructorUsedError;
  CategoryIcon get icon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExpenseReportElementCopyWith<ExpenseReportElement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseReportElementCopyWith<$Res> {
  factory $ExpenseReportElementCopyWith(ExpenseReportElement value,
          $Res Function(ExpenseReportElement) then) =
      _$ExpenseReportElementCopyWithImpl<$Res, ExpenseReportElement>;
  @useResult
  $Res call(
      {String categoryTitle,
      int countOfEntries,
      int totalAmount,
      double monthShare,
      CategoryIcon icon});

  $CategoryIconCopyWith<$Res> get icon;
}

/// @nodoc
class _$ExpenseReportElementCopyWithImpl<$Res,
        $Val extends ExpenseReportElement>
    implements $ExpenseReportElementCopyWith<$Res> {
  _$ExpenseReportElementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryTitle = null,
    Object? countOfEntries = null,
    Object? totalAmount = null,
    Object? monthShare = null,
    Object? icon = null,
  }) {
    return _then(_value.copyWith(
      categoryTitle: null == categoryTitle
          ? _value.categoryTitle
          : categoryTitle // ignore: cast_nullable_to_non_nullable
              as String,
      countOfEntries: null == countOfEntries
          ? _value.countOfEntries
          : countOfEntries // ignore: cast_nullable_to_non_nullable
              as int,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as int,
      monthShare: null == monthShare
          ? _value.monthShare
          : monthShare // ignore: cast_nullable_to_non_nullable
              as double,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as CategoryIcon,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CategoryIconCopyWith<$Res> get icon {
    return $CategoryIconCopyWith<$Res>(_value.icon, (value) {
      return _then(_value.copyWith(icon: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ExpenseReportElementImplCopyWith<$Res>
    implements $ExpenseReportElementCopyWith<$Res> {
  factory _$$ExpenseReportElementImplCopyWith(_$ExpenseReportElementImpl value,
          $Res Function(_$ExpenseReportElementImpl) then) =
      __$$ExpenseReportElementImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String categoryTitle,
      int countOfEntries,
      int totalAmount,
      double monthShare,
      CategoryIcon icon});

  @override
  $CategoryIconCopyWith<$Res> get icon;
}

/// @nodoc
class __$$ExpenseReportElementImplCopyWithImpl<$Res>
    extends _$ExpenseReportElementCopyWithImpl<$Res, _$ExpenseReportElementImpl>
    implements _$$ExpenseReportElementImplCopyWith<$Res> {
  __$$ExpenseReportElementImplCopyWithImpl(_$ExpenseReportElementImpl _value,
      $Res Function(_$ExpenseReportElementImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryTitle = null,
    Object? countOfEntries = null,
    Object? totalAmount = null,
    Object? monthShare = null,
    Object? icon = null,
  }) {
    return _then(_$ExpenseReportElementImpl(
      categoryTitle: null == categoryTitle
          ? _value.categoryTitle
          : categoryTitle // ignore: cast_nullable_to_non_nullable
              as String,
      countOfEntries: null == countOfEntries
          ? _value.countOfEntries
          : countOfEntries // ignore: cast_nullable_to_non_nullable
              as int,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as int,
      monthShare: null == monthShare
          ? _value.monthShare
          : monthShare // ignore: cast_nullable_to_non_nullable
              as double,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as CategoryIcon,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ExpenseReportElementImpl implements _ExpenseReportElement {
  const _$ExpenseReportElementImpl(
      {required this.categoryTitle,
      required this.countOfEntries,
      required this.totalAmount,
      required this.monthShare,
      required this.icon});

  factory _$ExpenseReportElementImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExpenseReportElementImplFromJson(json);

  @override
  final String categoryTitle;
  @override
  final int countOfEntries;
  @override
  final int totalAmount;
  @override
  final double monthShare;
  @override
  final CategoryIcon icon;

  @override
  String toString() {
    return 'ExpenseReportElement(categoryTitle: $categoryTitle, countOfEntries: $countOfEntries, totalAmount: $totalAmount, monthShare: $monthShare, icon: $icon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpenseReportElementImpl &&
            (identical(other.categoryTitle, categoryTitle) ||
                other.categoryTitle == categoryTitle) &&
            (identical(other.countOfEntries, countOfEntries) ||
                other.countOfEntries == countOfEntries) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.monthShare, monthShare) ||
                other.monthShare == monthShare) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, categoryTitle, countOfEntries,
      totalAmount, monthShare, icon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpenseReportElementImplCopyWith<_$ExpenseReportElementImpl>
      get copyWith =>
          __$$ExpenseReportElementImplCopyWithImpl<_$ExpenseReportElementImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExpenseReportElementImplToJson(
      this,
    );
  }
}

abstract class _ExpenseReportElement implements ExpenseReportElement {
  const factory _ExpenseReportElement(
      {required final String categoryTitle,
      required final int countOfEntries,
      required final int totalAmount,
      required final double monthShare,
      required final CategoryIcon icon}) = _$ExpenseReportElementImpl;

  factory _ExpenseReportElement.fromJson(Map<String, dynamic> json) =
      _$ExpenseReportElementImpl.fromJson;

  @override
  String get categoryTitle;
  @override
  int get countOfEntries;
  @override
  int get totalAmount;
  @override
  double get monthShare;
  @override
  CategoryIcon get icon;
  @override
  @JsonKey(ignore: true)
  _$$ExpenseReportElementImplCopyWith<_$ExpenseReportElementImpl>
      get copyWith => throw _privateConstructorUsedError;
}
