import 'package:currency_converter/config/themes/app_style.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.center,
      child: SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
            strokeWidth: 2.0, color: AppThemes.primaryColor),
      ),
    );
  }
}
