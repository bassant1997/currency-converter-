import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/history/historical_data_bloc.dart';
import '../bloc/history/historical_data_state.dart';
import '../config/themes/app_text_style.dart';
import 'empty_widget.dart';
import 'loading_widget.dart';

class HistoricalDataResult extends StatelessWidget {
  const HistoricalDataResult({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoricalBloc, HistoricalState>(
      builder: (context, state) {
        return state.isLoading == null
            ? const SizedBox()
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      'The Result',
                      style: AppTextStyle.smallPrimary14,
                    ),
                  ),
                  state.isLoading!
                      ? const LoadingWidget()
                      : state.isCompleted
                          ? ListView.separated(
                              itemCount: state.historicalDate!.rates.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                    height: 4,
                                  ),
                              itemBuilder: (context, index) {
                                String currencyPair = state
                                    .historicalDate!.rates.keys
                                    .elementAt(index);
                                Map<String, double> rates =
                                    state.historicalDate!.rates[currencyPair]!;
                                return ExpansionTile(
                                  title: Text(
                                    currencyPair,
                                    style: AppTextStyle.smallPrimary14,
                                  ),
                                  children: rates.entries
                                      .map((entry) => ListTile(
                                            title: Text('Date: ${entry.key}',
                                                style:
                                                    AppTextStyle.smallBlack12),
                                            subtitle: Text(
                                              'Rate: ${entry.value}',
                                              style: AppTextStyle.smallBlack12,
                                            ),
                                          ))
                                      .toList(),
                                );
                              })
                          : const EmptyWidget()
                ],
              );
      },
    );
  }
}
