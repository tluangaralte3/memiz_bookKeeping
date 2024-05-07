import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:memiz_bk/domain/resources/app_colors.dart';
import 'package:memiz_bk/domain/resources/app_icons.dart';
import 'package:memiz_bk/domain/resources/app_text_styles.dart';

class BackAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BackAppBar({Key? key, required this.text, this.back}) : super(key: key);
  final String text;
  final VoidCallback? back;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.borderGrey,
      leading: IconButton(
        icon: SvgPicture.asset(AppIcons.arrowBack),
        onPressed: () {
          if (back != null) {
            back!();
          }
          Navigator.of(context).pop();
        },
      ),
      title: Text(
        text,
        style: AppStyles.subtitle1,
      ),
      centerTitle: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(40);
}
