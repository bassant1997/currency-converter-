import 'package:currency_converter/config/themes/app_text_style.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({required this.title, super.key});

  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: AppTextStyle.normalWhite16,
      ),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}
