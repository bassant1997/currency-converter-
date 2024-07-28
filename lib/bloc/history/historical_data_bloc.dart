import 'package:intl/intl.dart';
import 'package:currency_converter/data/repository/currency_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/api_model.dart';
import 'historical_data_event.dart';
import 'historical_data_state.dart';

class HistoricalBloc extends Bloc<HistoricalEvent, HistoricalState> {
  HistoricalBloc() : super(HistoricalState()) {
    on<ListHistoricalDataEvent>(_getHistoricalData);
  }

  final _repository = CurrenciesRepository();
  final endDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

  void _getHistoricalData(
      ListHistoricalDataEvent event, Emitter<HistoricalState> emit) async {
    emit(HistoricalState(isLoading: true));
    final response = await _repository.listHistoricalCurrency(
        calculateStartTime(),
        endDate,
        event.currencyCodeFirst,
        event.currencyCodeSecond);
    if (response.status == ApiStatus.success) {
      emit(HistoricalState(
          isLoading: false, isCompleted: true, historicalDate: response.data));
    } else {
      emit(HistoricalState(isLoading: false, error: response.error));
    }
  }

  String calculateStartTime() {
    DateTime startDate = DateTime.now().subtract(const Duration(days: 7));

    return DateFormat('yyyy-MM-dd').format(startDate);
  }
}
