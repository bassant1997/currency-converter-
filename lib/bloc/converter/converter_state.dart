class ConverterState {
  final bool? isLoading;
  final bool isComplete;
  final String? error;
  final double? rate;

  ConverterState(
      {this.isLoading,
      this.error,
      this.isComplete = false,
      this.rate});
}
