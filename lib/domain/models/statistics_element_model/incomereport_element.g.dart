// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'incomereport_element.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IncomeStatisticsElementImpl _$$IncomeStatisticsElementImplFromJson(
        Map<String, dynamic> json) =>
    _$IncomeStatisticsElementImpl(
      categoryTitle: json['categoryTitle'] as String,
      countOfEntries: (json['countOfEntries'] as num).toInt(),
      totalAmount: (json['totalAmount'] as num).toInt(),
      monthShare: (json['monthShare'] as num).toDouble(),
      icon: CategoryIcon.fromJson(json['icon'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$IncomeStatisticsElementImplToJson(
        _$IncomeStatisticsElementImpl instance) =>
    <String, dynamic>{
      'categoryTitle': instance.categoryTitle,
      'countOfEntries': instance.countOfEntries,
      'totalAmount': instance.totalAmount,
      'monthShare': instance.monthShare,
      'icon': instance.icon.toJson(),
    };
