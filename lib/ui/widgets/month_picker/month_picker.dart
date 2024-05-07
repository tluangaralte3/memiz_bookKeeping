import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memiz_bk/domain/repository/database_repository.dart';
import 'package:memiz_bk/domain/resources/app_colors.dart';
import 'package:memiz_bk/domain/resources/app_text_styles.dart';
import 'package:memiz_bk/domain/resources/initial_values.dart';
import 'package:memiz_bk/ui/bloc/date_bloc/date_bloc.dart';
import 'package:memiz_bk/ui/bloc/entries_control_bloc/entries_control_bloc.dart';

import 'overlay_calendar_window.dart';
import 'place_holder.dart';

class MonthPicker extends StatefulWidget {
  const MonthPicker({
    Key? key,
    required this.selectType,
  }) : super(key: key);
  final String selectType;

  @override
  State<MonthPicker> createState() => _MonthPickerState();
}

class _MonthPickerState extends State<MonthPicker> {
  OverlayEntry? _overlayEntry;
  OverlayState? _overlay;
  DateBloc? provider;

  @override
  void dispose() {
    _overlayDispose();
    provider!.close();
    super.dispose();
  }

  @override
  void initState() {
    provider = DateBloc(RepositoryProvider.of<DatabaseRepository>(context));
    super.initState();
  }

  void _overlayDispose() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => provider!..add(InitialDateEvent()),
      child: BlocConsumer<DateBloc, DateState>(
        listenWhen: (previous, current) {
          return (previous.selectedYear != current.selectedYear ||
                  previous.selectedMonth != current.selectedMonth) &&
              current.selectedYear != 0;
        },
        listener: (context, state) {
          context.read<EntriesControlBloc>().add(SetDateToEntriesEvent(
              type: widget.selectType,
              year: state.selectedYear,
              month: state.selectedMonth));
        },
        builder: (context, state) {
          if (state.selectedYear == 0) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: PlaceHolder(),
            );
          }
          final bool back = state.allYears.contains(state.selectedYear - 1) ||
              state.selectedMonth != state.activeMonths.last &&
                  state.selectedYear == state.year;
          final bool forward =
              state.allYears.contains(state.selectedYear + 1) ||
                  state.selectedMonth != state.activeMonths.first &&
                      state.selectedYear == state.year;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: back
                      ? () {
                          context
                              .read<DateBloc>()
                              .add(CallMonthDateEvent('back'));
                        }
                      : null,
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: back ? AppColors.subTitle : Colors.white,
                  ),
                ),
                InkWell(
                  onTap: () {
                    _showOverlay(context);
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppColors.basicGrey),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.calendar_today_outlined,
                          color: AppColors.subTitle,
                          size: 16,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          '${InitialValues.listOfMonths[state.selectedMonth - 1]}, ${state.selectedYear}',
                          style: AppStyles.buttonBlack,
                        )
                      ],
                    ),
                  ),
                ),
                IconButton(
                  onPressed: forward
                      ? () {
                          context
                              .read<DateBloc>()
                              .add(CallMonthDateEvent('forward'));
                        }
                      : null,
                  icon: Icon(Icons.arrow_forward_ios,
                      color: forward ? AppColors.subTitle : Colors.white),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  _showOverlay(BuildContext context) {
    _overlay = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);
    _overlayEntry = OverlayEntry(builder: (_) {
      return BlocProvider.value(
        value: BlocProvider.of<DateBloc>(context),
        child: Stack(children: [
          InkWell(
            onTap: () {
              context.read<DateBloc>().add(ToSelectedDateEvent());
              _overlayDispose();
            },
          ),
          Positioned(
              width: size.width,
              top: offset.dy + size.height,
              left: offset.dx,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: OverlayCalendarWindow(),
              ))
        ]),
      );
    });
    _overlay!.insert(_overlayEntry!);
  }
}
