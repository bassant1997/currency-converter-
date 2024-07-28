import 'package:currency_converter/bloc/converter/converter_state.dart';
import 'package:currency_converter/bloc/currency/list_currency_bloc.dart';
import 'package:currency_converter/bloc/currency/list_currency_event.dart';
import 'package:currency_converter/widgets/input_data_widget.dart';
import 'package:currency_converter/widgets/loading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/converter/converter_bloc.dart';
import '../bloc/converter/converter_event.dart';
import '../config/themes/app_style.dart';
import 'confirm_button_widget.dart';

class ConverterCard extends StatelessWidget {
  ConverterCard({super.key});

  static Widget create() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
          SupportedCurrenciesBloc()..add(ListSupportedCurrencyEvent()),
        ),
        BlocProvider(
          create: (context) => ConverterBloc(),
        ),
      ],
      child: ConverterCard(),
    );
  }

  final TextEditingController amount = TextEditingController();
  final TextEditingController currencyFrom = TextEditingController();
  final TextEditingController currencyTo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool showResult = false;
    return Positioned(
      top: 50,
      left: 20,
      right: 20,
      child: Card(
        color: AppThemes.whiteColor,
        shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16.0)))
            .copyWith(side: const BorderSide(color: AppThemes.primaryColor)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InputDataWidget(
                controller: amount,
                label: ' Amount',
                hint: 'enter amount',
                type: TextInputType.number,
              ),
              const SizedBox(
                height: 12,
              ),
              InputDataWidget(
                controller: currencyFrom,
                label: ' currency from',
                hint: ' currency code',
              ),
              const SizedBox(
                height: 12,
              ),
              InputDataWidget(
                controller: currencyTo,
                label: ' currency to',
                hint: 'currency',
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: BlocBuilder<ConverterBloc, ConverterState>(
                  builder: (context, state) {
                    return state.isLoading == null
                        ? const SizedBox()
                        : state.isLoading!
                            ? const LoadingWidget()
                            : state.isComplete
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text('result is:'),
                                      Text(state.rate?.toString() ?? '')
                                    ],
                                  )
                                : const Center(
                                    child: Text('data not found'),
                                  );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ConfirmButton(
                  label: 'Calculate',
                  onPressed: () {
                    BlocProvider.of<ConverterBloc>(context).add(
                        GetConverterRateEvent(
                            from: currencyFrom.text,
                            to: currencyTo.text,
                            amount: double.parse(amount.text)));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
