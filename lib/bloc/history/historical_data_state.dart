import 'package:currency_converter/data/models/historical_data_model.dart';

class HistoricalState {
  final bool? isLoading;
  final bool isCompleted;
  final String? error;
  final HistoricalData? historicalDate;

  HistoricalState(
      {this.isLoading,
      this.isCompleted = false,
      this.error,
      this.historicalDate});
}
