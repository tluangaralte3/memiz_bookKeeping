import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:memiz_bk/domain/models/category_icon_model/category_icon.dart';

part 'income_category.freezed.dart';
part 'income_category.g.dart';

@freezed
class IncomeCategory with _$IncomeCategory {
  @JsonSerializable(explicitToJson: true)
  const factory IncomeCategory({
    required int categoryId,
    required String title,
    required String type,
    required int orderNum,
    required CategoryIcon icon,
  }) = _IncomeCategory;
  factory IncomeCategory.fromJson(Map<String, dynamic> json) =>
      _$IncomeCategoryFromJson(json);
}
