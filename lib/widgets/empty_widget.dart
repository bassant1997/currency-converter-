import 'package:currency_converter/config/themes/app_text_style.dart';
import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/empty.png',width: 50,height: 60,),
        const SizedBox(
          height: 12,
        ),
        const Center(
          child: Text(
            'No data available',
            style: AppTextStyle.smallPrimary14,
          ),
        )
      ],
    );
  }
}
