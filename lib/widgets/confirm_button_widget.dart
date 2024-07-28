import 'package:flutter/material.dart';

import '../config/themes/app_style.dart';
import '../config/themes/app_text_style.dart';

class ConfirmButton extends StatefulWidget {
  const ConfirmButton(
      {super.key, required this.label, required this.onPressed});

  final VoidCallback onPressed;
  final String label;

  @override
  State<ConfirmButton> createState() => _ConfirmButtonState();
}

class _ConfirmButtonState extends State<ConfirmButton> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: widget.onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: AppThemes.primaryColor,
        side: const BorderSide(width: 0, color: Colors.transparent),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
      ),
      child: Text(
        widget.label,
        style: AppTextStyle.normalWhite16,
      ),
    );
  }
}
