// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'income_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IncomeCategoryImpl _$$IncomeCategoryImplFromJson(Map<String, dynamic> json) =>
    _$IncomeCategoryImpl(
      categoryId: (json['categoryId'] as num).toInt(),
      title: json['title'] as String,
      type: json['type'] as String,
      orderNum: (json['orderNum'] as num).toInt(),
      icon: CategoryIcon.fromJson(json['icon'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$IncomeCategoryImplToJson(
        _$IncomeCategoryImpl instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'title': instance.title,
      'type': instance.type,
      'orderNum': instance.orderNum,
      'icon': instance.icon.toJson(),
    };
