import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memiz_bk/domain/resources/app_text_styles.dart';
import 'package:memiz_bk/ui/bloc/entries_control_bloc/entries_control_bloc.dart';
import 'package:memiz_bk/ui/widgets/icon_view.dart';

class IncomeReportElementBuilder extends StatelessWidget {
  const IncomeReportElementBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IncomeControlBloc, IncomeControlState>(
      builder: (context, state) {
        return Flexible(
          child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: state.income.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: IconView(
                    icon: state.income[index].icon.localPath,
                    color: state.income[index].icon.color,
                  ),
                  title: Text(
                    state.income[index].categoryTitle,
                  ),
                  subtitle: Text(
                      '${state.income[index].countOfEntries} transactions'),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '${state.income[index].totalAmount}',
                        style: AppStyles.appRed,
                      ),
                      Text('${(state.income[index].monthShare).round()}%')
                    ],
                  ),
                );
              }),
        );
      },
    );
  }
}
