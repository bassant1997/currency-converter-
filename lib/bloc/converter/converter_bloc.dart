import 'package:currency_converter/bloc/converter/converter_event.dart';
import 'package:currency_converter/bloc/converter/converter_state.dart';
import 'package:currency_converter/data/models/api_model.dart';
import 'package:currency_converter/data/repository/currency_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConverterBloc extends Bloc<ConverterEvent, ConverterState> {
  final _repository = CurrenciesRepository();

  ConverterBloc() : super(ConverterState()) {
    on<GetConverterRateEvent>(_getConverterRate);
  }

  void _getConverterRate(GetConverterRateEvent event, Emitter emit) async {
    emit(ConverterState(isLoading: true));
    final response =
        await _repository.fetchConverterResult(event.from, event.to);
    if (response.status == ApiStatus.success) {
      emit(ConverterState(
          isLoading: false,
          isComplete: true,
          rate: convertCurrency(
              rateFrom: response.data![0]!,
              rateTo: response.data![1]!,
              amount: event.amount)));
    } else {
      emit(ConverterState(isLoading: false, error: response.error));
    }
  }

  double convertCurrency({
    required double rateFrom,
    required double rateTo,
    required double amount,
  }) {
    double conversionRate = rateTo / rateFrom;
    return amount * conversionRate;
  }
}
