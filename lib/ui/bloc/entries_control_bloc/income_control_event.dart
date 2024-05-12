part of 'entries_control_bloc.dart';

@immutable
abstract class IncomeControlEvent {}

class InitialIncomeDatabaseEvent extends IncomeControlEvent {}

class CallAllIncomeDataEvent extends IncomeControlEvent {}

class CallEntryIncomeCategoriesEvent extends IncomeControlEvent {}

class GetIncomeCategoryEvent extends IncomeControlEvent {
  final IncomeCategory category;

  GetIncomeCategoryEvent(this.category);
}

class GetIncomeIconEvent extends IncomeControlEvent {
  final IncomeCategoryIcon icon;

  GetIncomeIconEvent(this.icon);
}

class CreateIncomeCategoryEvent extends IncomeControlEvent {
  final String categoryName;
  final IncomeCategoryIcon selectedIcon;

  CreateIncomeCategoryEvent(
      {required this.selectedIcon, required this.categoryName});
}

class CreateIncomeEntryEvent extends IncomeControlEvent {
  final String amount;
  final String description;
  CreateIncomeEntryEvent({required this.amount, required this.description});
}

class SelectIncomeEntriesByDateEvent extends IncomeControlEvent {
  final DateTime monthYear;

  SelectIncomeEntriesByDateEvent(this.monthYear);
}

class SetIncomeDateToEntriesEvent extends IncomeControlEvent {
  final String type;
  final int year;
  final int month;

  SetIncomeDateToEntriesEvent(
      {required this.type, required this.year, required this.month});
}

class SearchIncomeEntries extends IncomeControlEvent {
  final List<int> categoryIds;
  final String searchValue;

  SearchIncomeEntries(this.categoryIds, this.searchValue);
}

class DeleteIncomeEntryEvent extends IncomeControlEvent {
  final int entryId;
  DeleteIncomeEntryEvent(this.entryId);
}

class ReorderIncomeCategoriesEvent extends IncomeControlEvent {
  final int oldIndex;
  final int newIndex;

  ReorderIncomeCategoriesEvent(
      {required this.oldIndex, required this.newIndex});
}

class EditIncomeCategoryEvent extends IncomeControlEvent {
  final String newTitle;
  final IncomeCategoryIcon icon;

  EditIncomeCategoryEvent({required this.newTitle, required this.icon});
}
