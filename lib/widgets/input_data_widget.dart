import 'package:flutter/material.dart';

import '../config/themes/app_style.dart';
import '../config/themes/app_text_style.dart';

class InputDataWidget extends StatelessWidget {
  InputDataWidget(
      {super.key, required this.controller, required this.label, this.hint,this.type});

  TextEditingController controller = TextEditingController();
  String label;
  String? hint;
  TextInputType? type;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            label,
            style: AppTextStyle.smallPrimary12,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Expanded(
            flex: 3,
            child: TextField(
                maxLines: 1,
                controller: controller,
                onChanged: (value) {},
                style: AppTextStyle.smallBlack12,
                cursorColor: AppThemes.primaryColor,
                keyboardType: type,
                decoration: InputDecoration(
                    hintText: hint,
                    border: InputBorder.none,
                    hintStyle: AppTextStyle.hintStyle,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            const BorderSide(color: AppThemes.primaryColor)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            const BorderSide(color: AppThemes.primaryColor))))),
      ],
    );
  }
}
