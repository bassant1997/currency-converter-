import 'package:currency_converter/bloc/history/historical_data_event.dart';
import 'package:currency_converter/config/themes/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/history/historical_data_bloc.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/confirm_button_widget.dart';
import '../widgets/historical_result_widget.dart';
import '../widgets/input_data_widget.dart';

class HistoryScreen extends StatelessWidget {
  HistoryScreen({super.key});

  static Widget create() {
    return BlocProvider(
      create: (context) => HistoricalBloc(),
      child: HistoryScreen(),
    );
  }

  final bool showResult = true;
  final currencyCodeFirst = TextEditingController();
  final currencyCodeSecond = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'Historical Data',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  '* daily historical rates between two dates of your choice.',
                  style: AppTextStyle.smallBlack12,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              InputDataWidget(
                controller: currencyCodeFirst,
                label: 'First Currency',
                hint: 'enter currency code',
              ),
              const SizedBox(
                height: 8,
              ),
              InputDataWidget(
                controller: currencyCodeSecond,
                label: 'Second Currency',
                hint: 'enter currency code',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: ConfirmButton(
                  label: 'Confirm',
                  onPressed: () {
                    if (currencyCodeFirst.text.isNotEmpty &&
                        currencyCodeSecond.text.isNotEmpty) {
                      BlocProvider.of<HistoricalBloc>(context).add(
                          ListHistoricalDataEvent(
                              currencyCodeFirst: currencyCodeFirst.text,
                              currencyCodeSecond: currencyCodeSecond.text));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text(
                        'all fields are required',
                        style: AppTextStyle.smallWhite12,
                      )));
                    }
                  },
                ),
              ),
              const Divider(),
              const HistoricalDataResult()
            ],
          ),
        ),
      ),
    );
  }
}
