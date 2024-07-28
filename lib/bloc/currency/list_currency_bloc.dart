import 'package:currency_converter/bloc/currency/list_currency_event.dart';
import 'package:currency_converter/bloc/currency/list_currency_state.dart';
import 'package:currency_converter/data/repository/currency_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/api_model.dart';

class SupportedCurrenciesBloc extends Bloc<CurrencyEvent, SupportedCurrencyState> {
  SupportedCurrenciesBloc() : super(SupportedCurrencyState()) {
    on<ListSupportedCurrencyEvent>(_getCurrencies);
  }

  final _repository = CurrenciesRepository();

  void _getCurrencies(
      ListSupportedCurrencyEvent event, Emitter<SupportedCurrencyState> emit) async {
    emit(SupportedCurrencyState(isLoading: true));
    final response = await _repository.listSupportedCurrencies();
    if (response.status == ApiStatus.success) {
      emit(SupportedCurrencyState(
          isLoading: false, isCompleted: true, currencyList: response.data));
    } else {
      emit(SupportedCurrencyState(isLoading: false, error: response.error));
    }
  }
}
