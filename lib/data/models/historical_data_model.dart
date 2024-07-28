class HistoricalData {
  final Map<String, Map<String, double>> rates;

  HistoricalData({required this.rates});

  factory HistoricalData.fromJson(Map<String, dynamic> json) {
    Map<String, Map<String, double>> rates = {};
    json.forEach((currencyPair, dateRates) {
      rates[currencyPair] = (dateRates as Map<String, dynamic>).map(
        (date, rate) => MapEntry(date, rate.toDouble()),
      );
    });
    return HistoricalData(rates: rates);
  }
}
