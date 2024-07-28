abstract class HistoricalEvent {}

class ListHistoricalDataEvent extends HistoricalEvent {
  String currencyCodeFirst;
  String currencyCodeSecond;

  ListHistoricalDataEvent(
      {
      required this.currencyCodeFirst,
      required this.currencyCodeSecond});
}
