import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:memiz_bk/domain/models/category_icon_model/category_icon.dart';

part 'expensereport_element.freezed.dart';

part 'expensereport_element.g.dart';

@freezed
class ExpenseReportElement with _$ExpenseReportElement {
  @JsonSerializable(explicitToJson: true)
  const factory ExpenseReportElement({
    required String categoryTitle,
    required int countOfEntries,
    required int totalAmount,
    required double monthShare,
    required CategoryIcon icon,
  }) = _ExpenseReportElement;

  factory ExpenseReportElement.fromJson(Map<String, dynamic> json) =>
      _$ExpenseReportElementFromJson(json);
}
