import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memiz_bk/domain/resources/app_colors.dart';
import 'package:memiz_bk/domain/resources/app_icons.dart';
import 'package:memiz_bk/ui/bloc/entries_control_bloc/entries_control_bloc.dart';
import 'package:memiz_bk/ui/widgets/choose_icon.dart';
import 'package:memiz_bk/ui/widgets/icon_view.dart';
import 'package:memiz_bk/ui/widgets/navigation/back_app_bar.dart';

class EditCategoryScreen extends StatefulWidget {
  const EditCategoryScreen({Key? key}) : super(key: key);
  static const routeName = 'edit_category';

  @override
  State<EditCategoryScreen> createState() => _EditCategoryScreenState();
}

class _EditCategoryScreenState extends State<EditCategoryScreen> {
  PersistentBottomSheetController? bottomSheetController;

  final categoryController = TextEditingController();

  void _closeBottomSheet() {
    if (bottomSheetController != null) {
      bottomSheetController!.close();
      bottomSheetController = null;
    }
  }

  void _onComplete() {
    setState(() {
      FocusScope.of(context).unfocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (bottomSheetController != null) {
          _closeBottomSheet();
          return false;
        }
        return true;
      },
      child: BlocBuilder<EntriesControlBloc, EntriesControlState>(
        builder: (context, state) {
          return Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: ValueListenableBuilder(
              valueListenable: categoryController,
              builder: (BuildContext context, TextEditingValue value,
                  Widget? child) {
                return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: state.selectedIcon.iconId.isNegative ||
                              value.text.isEmpty
                          ? Colors.grey
                          : Theme.of(context).primaryColor,
                    ),
                    onPressed: state.selectedIcon.iconId.isNegative ||
                            value.text.isEmpty
                        ? null
                        : () {
                            context.read<EntriesControlBloc>().add(
                                EditCategoryEvent(
                                    newTitle: categoryController.text,
                                    icon: state.selectedIcon));
                            Navigator.of(context).pop();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Category edited'),
                              ),
                            );
                          },
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Center(
                        heightFactor: 1,
                        child: Text('Edit category'),
                      ),
                    ));
              },
            ),
            appBar: BackAppBar(
              text: 'Edit',
              back: _closeBottomSheet,
            ),
            body: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 24.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DottedBorder(
                    borderType: BorderType.Circle,
                    color: bottomSheetController == null
                        ? AppColors.title
                        : AppColors.activeBlue,
                    strokeWidth: 2,
                    dashPattern: const [5, 2],
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        if (FocusScope.of(context).hasFocus) {
                          FocusScope.of(context).unfocus();
                          Future.delayed(const Duration(seconds: 2));
                        }
                        bottomSheetController = showBottomSheet(
                            context: context,
                            constraints: BoxConstraints(
                                maxHeight:
                                    MediaQuery.of(context).size.height / 2),
                            enableDrag: false,
                            builder: (_) {
                              return ChooseIcon(
                                iconList: state.icons,
                                controller: bottomSheetController!,
                              );
                            });
                        setState(() {});
                      },
                      icon: !state.selectedIcon.iconId.isNegative
                          ? IconView(
                              icon: state.selectedIcon.localPath,
                              color: state.selectedIcon.color,
                            )
                          : const IconView(
                              icon: AppIcons.addPlus,
                              color: 'E0E0E0',
                            ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Flexible(
                    child: TextField(
                      maxLength: 24,
                      onTap: _closeBottomSheet,
                      onEditingComplete: _onComplete,
                      controller: categoryController
                        ..text = state.categoryToAdd.title,
                      decoration: InputDecoration(
                        labelText: 'Category name',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
