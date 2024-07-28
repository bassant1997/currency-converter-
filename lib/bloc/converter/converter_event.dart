abstract class ConverterEvent {}

class GetConverterRateEvent extends ConverterEvent {
  final String from;
  final String to;
  final double amount;

  GetConverterRateEvent(
      {required this.from, required this.to, required this.amount});
}
