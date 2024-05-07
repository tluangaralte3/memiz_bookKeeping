import 'package:easy_localization/easy_localization.dart';

import 'app_icons.dart';

class InitialValues {
  static const List<String> incomeCategories = [
    'Salary',
    'Gifts',
    'Wages',
    'Interest',
    'Savings',
    'Allowance',
  ];

  static const List<String> expenseCategories = [
    'Groceries',
    'Cafe',
    'Electronics'
  ];

  static const List<Map<String, String>> allIcons = [
    {'color': 'C8E6C9', 'icon': AppIcons.groceries},
    {'color': 'FFECB3', 'icon': AppIcons.cafe},
    {'color': 'FFCDD2', 'icon': AppIcons.electronics},
    {'color': 'B3E5FC', 'icon': AppIcons.laundry},
    {'color': 'BBDEFB', 'icon': AppIcons.party},
    {'color': 'FFECB3', 'icon': AppIcons.savings},
    {'color': 'DCEDC8', 'icon': AppIcons.liquor},
    {'color': 'D7CCC8', 'icon': AppIcons.fuel},
    {'color': 'B39DDB', 'icon': AppIcons.maintenance},
    {'color': 'C8E6C9', 'icon': AppIcons.education},
    {'color': 'CFD8DC', 'icon': AppIcons.selfDevelopment},
    {'color': 'F8BBD0', 'icon': AppIcons.health},
    {'color': 'B2EBF2', 'icon': AppIcons.transportation},
    {'color': 'C5CAE9', 'icon': AppIcons.restaurant},
    {'color': 'E6EE9C', 'icon': AppIcons.sport},
    {'color': 'FFCCBC', 'icon': AppIcons.money},
    {'color': 'E1BEE7', 'icon': AppIcons.giftCard},
    {'color': 'FFF9C4', 'icon': AppIcons.donate},
    {'color': 'FFE0B2', 'icon': AppIcons.institute},
    {'color': 'C5CAE9', 'icon': AppIcons.savings},
    {'color': 'C8E6C9', 'icon': AppIcons.money},
  ];

  static final List<Map<String, String>> faq = [
    {
      'question': 'How to add a transaction?',
      'answer':
          'To add a transaction, simply click on the "+" button on the home screen and fill in the details.'
    },
    {
      'question': 'How to add a category?',
      'answer':
          'To add a category, go to the manage categories screen and click on the "+" button.'
    },
    {
      'question': 'How to edit a transaction?',
      'answer':
          'To edit a transaction, go to the transactions screen, find the transaction you want to edit, and click on it.'
    },
    {
      'question': 'How to delete a transaction?',
      'answer':
          'To delete a transaction, go to the transactions screen, find the transaction you want to delete, and swipe left.'
    },
    {
      'question': 'How do statistics work?',
      'answer':
          'Statistics are calculated based on your income and expenses over time to provide insights into your spending habits.'
    },
    {
      'question': 'How does the balance work?',
      'answer':
          'The balance is calculated by subtracting your total expenses from your total income.'
    },
    {
      'question': 'How to change the date of a transaction?',
      'answer':
          'To change the date of a transaction, go to the transactions screen, find the transaction you want to edit, and click on the date.'
    },
  ];

  static final List<String> listOfMonths = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
}
