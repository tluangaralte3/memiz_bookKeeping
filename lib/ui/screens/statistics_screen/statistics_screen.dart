import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memiz_bk/domain/resources/app_text_styles.dart';
import 'package:memiz_bk/ui/bloc/entries_control_bloc/entries_control_bloc.dart';
import 'package:memiz_bk/ui/widgets/main_app_bar.dart';
import 'package:memiz_bk/ui/widgets/month_picker/month_picker.dart';
import 'package:memiz_bk/utils/helper.dart';

import 'widgets/block_chart.dart';
import 'widgets/statistics_element_builder.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({Key? key}) : super(key: key);
  static const routeName = 'statistics_screen';

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EntriesControlBloc, EntriesControlState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: const MainAppBar(
            leading: Text(
              'Statistics',
              style: AppStyles.menuPageTitle,
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton.extended(
            icon: const Icon(
              Icons.file_download_outlined,
              color: Colors.black,
            ),
            label: Text("Download Report"),
            onPressed: state.statistics.isNotEmpty
                ? () async {
                    await createOpenPdf(
                        statistics: state.statistics,
                        reportDate: state.reportDate!);
                  }
                : null,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MonthPicker(
                selectType: 'exact',
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  "Overview",
                  style: AppStyles.overline,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: BlockChart(
                  stats: state.statistics,
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    "Details",
                    style: AppStyles.overline,
                  ),
                ),
              ),
              const StatisticsElementBuilder(),
            ],
          ),
        );
      },
    );
  }
}
