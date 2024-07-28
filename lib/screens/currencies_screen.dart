import 'package:cached_network_image/cached_network_image.dart';
import 'package:currency_converter/bloc/currency/list_currency_state.dart';
import 'package:currency_converter/config/themes/app_style.dart';
import 'package:currency_converter/config/themes/app_text_style.dart';
import 'package:currency_converter/data/models/currency_model.dart';
import 'package:currency_converter/widgets/empty_widget.dart';
import 'package:currency_converter/widgets/loading_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/currency/list_currency_bloc.dart';
import '../bloc/currency/list_currency_event.dart';
import '../widgets/app_bar_widget.dart';

class CurrenciesScreen extends StatelessWidget {
  const CurrenciesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SupportedCurrenciesBloc()..add(ListSupportedCurrencyEvent()),
      child: Scaffold(
        backgroundColor: AppThemes.whiteColor,
        appBar: const AppBarWidget(
          title: 'Supported Currencies',
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 24),
          child: BlocBuilder<SupportedCurrenciesBloc, SupportedCurrencyState>(
            builder: (context, state) {
              return state.isLoading
                  ? const LoadingWidget()
                  : state.isCompleted
                      ? GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 2,
                                  crossAxisSpacing: 2),
                          itemCount: state.currencyList?.length,
                          itemBuilder: (context, index) {
                            Currency? country = state.currencyList?[index];
                            return Card(
                              color: AppThemes.whiteColor,
                              elevation: 0.3,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  country!.icon == null
                                      ? const SizedBox(
                                          width: 80,
                                          height: 50,
                                        )
                                      : CachedNetworkImage(
                                          imageUrl: country.icon!,
                                          fit: BoxFit.fill,
                                          width: 80,
                                          height: 50,
                                          placeholder: (context, url) =>
                                              const LoadingWidget(),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                        ),
                                  Text(
                                    country.countryName ?? '',
                                    maxLines: 1,
                                    style: AppTextStyle.smallPrimary14,
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    country.currencyCode ?? '',
                                    style: AppTextStyle.smallPrimary14,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            );
                          },
                        )
                      : const EmptyWidget();
            },
          ),
        ),
      ),
    );
  }
}
