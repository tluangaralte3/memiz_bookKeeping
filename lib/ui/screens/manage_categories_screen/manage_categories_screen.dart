import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memiz_bk/domain/resources/app_colors.dart';
import 'package:memiz_bk/domain/resources/app_text_styles.dart';
import 'package:memiz_bk/ui/bloc/entries_control_bloc/entries_control_bloc.dart';
import 'package:memiz_bk/ui/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:memiz_bk/ui/screens/add_category_screen/add_category_screen.dart';
import 'package:memiz_bk/ui/screens/edit_category_screen/edit_category_screen.dart';
import 'package:memiz_bk/ui/widgets/icon_view.dart';
import 'package:memiz_bk/ui/widgets/navigation/back_app_bar.dart';

class ManageCategoriesScreen extends StatefulWidget {
  const ManageCategoriesScreen({Key? key}) : super(key: key);
  static const routeName = 'edit_categories_page';

  @override
  State<ManageCategoriesScreen> createState() => _ManageCategoriesScreenState();
}

class _ManageCategoriesScreenState extends State<ManageCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppBar(
        text: 'Manage Categories',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.read<NavigationBloc>().add(
              NavigateTab(tabIndex: 4, route: AddCategoryScreen.routeName));
        },
        label: Text(
          'Add Category',
          style: AppStyles.body2,
        ),
      ),
      body: BlocBuilder<EntriesControlBloc, EntriesControlState>(
        builder: (context, state) {
          return ReorderableListView.builder(
              onReorderStart: (_) {
                HapticFeedback.vibrate();
              },
              padding: const EdgeInsets.only(top: 12),
              itemBuilder: (context, index) {
                return ListTile(
                  key: ValueKey(index),
                  leading: SizedBox(
                    height: 40,
                    child: IconView(
                      icon: state.expCategories[index].icon.localPath,
                      color: state.expCategories[index].icon.color,
                    ),
                  ),
                  title: Text(state.expCategories[index].title,
                      style: AppStyles.body2),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton(
                          onPressed: () {
                            context.read<EntriesControlBloc>().add(
                                GetCategoryEvent(state.expCategories[index]));
                            context.read<EntriesControlBloc>().add(
                                GetIconEvent(state.expCategories[index].icon));
                            context.read<NavigationBloc>().add(NavigateTab(
                                  tabIndex: 7,
                                  route: EditCategoryScreen.routeName,
                                ));
                          },
                          child: Text(
                            'Edit',
                            style: AppStyles.button,
                          )),
                      const SizedBox(
                        width: 12,
                      ),
                      const Icon(
                        Icons.drag_indicator_outlined,
                        color: AppColors.subTitle,
                      )
                    ],
                  ),
                );
              },
              itemCount: state.expCategories.length,
              onReorder: (oldIndex, newIndex) {
                context.read<EntriesControlBloc>().add(ReorderCategoriesEvent(
                    oldIndex: oldIndex, newIndex: newIndex));
              });
        },
      ),
    );
  }
}
