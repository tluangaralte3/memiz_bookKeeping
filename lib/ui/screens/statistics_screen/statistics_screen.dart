import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memiz_bk/domain/resources/app_text_styles.dart';
import 'package:memiz_bk/ui/bloc/entries_control_bloc/entries_control_bloc.dart';
import 'package:memiz_bk/ui/screens/statistics_screen/widgets/income_element_builder.dart';
import 'package:memiz_bk/ui/widgets/main_app_bar.dart';
import 'package:memiz_bk/ui/widgets/month_picker/month_picker.dart';
import 'package:memiz_bk/utils/helper.dart';

import 'widgets/block_chart.dart';
import 'widgets/expense_element_builder.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({Key? key}) : super(key: key);
  static const routeName = 'statistics_screen';

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EntriesControlBloc, EntriesControlState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false, // Remove back icon
            title: const Center(child: Text('Report')),
            bottom: TabBar(
              controller: _tabController,
              tabs: const [
                Tab(text: 'Expense'),
                Tab(text: 'Income'),
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton.extended(
            icon: const Icon(
              Icons.file_download_outlined,
              color: Colors.black,
            ),
            label: const Text("Download Report"),
            onPressed: state.statistics.isNotEmpty
                ? () async {
                    await createOpenPdf(
                        statistics: state.statistics,
                        reportDate: state.reportDate!);
                  }
                : null,
          ),
          body: TabBarView(
            controller: _tabController,
            children: [
              // Expense Tab
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const MonthPicker(selectType: 'exact'),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Text(
                      'Overview',
                      style: AppStyles.overline,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: BlockChart(
                      stats: state.statistics,
                    ),
                  ),
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        'Details',
                        style: AppStyles.overline,
                      ),
                    ),
                  ),
                  const ExpenseReportElementBuilder(),
                ],
              ),
              // Income Tab
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MonthPicker(selectType: 'exact'),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Text(
                      'Overview',
                      style: AppStyles.overline,
                    ),
                  ),
                  SizedBox(height: 8),
                  IncomeReportElementBuilder(),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
