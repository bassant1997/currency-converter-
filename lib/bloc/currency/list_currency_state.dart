import '../../data/models/currency_model.dart';

class SupportedCurrencyState {
  final bool isLoading;
  final bool isCompleted;
  final String? error;
  final List<Currency>? currencyList;

  SupportedCurrencyState(
      {this.isLoading = true,
      this.isCompleted = false,
      this.error,
      this.currencyList});
}
