import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:memiz_bk/domain/models/category_icon_model/category_icon.dart';

part 'incomereport_element.freezed.dart';

part 'incomereport_element.g.dart';

@freezed
class IncomeStatisticsElement with _$IncomeStatisticsElement {
  @JsonSerializable(explicitToJson: true)
  const factory IncomeStatisticsElement({
    required String categoryTitle,
    required int countOfEntries,
    required int totalAmount,
    required double monthShare,
    required CategoryIcon icon,
  }) = _IncomeStatisticsElement;

  factory IncomeStatisticsElement.fromJson(Map<String, dynamic> json) =>
      _$IncomeStatisticsElementFromJson(json);
}
