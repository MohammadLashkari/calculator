class CalculatorState {
  final bool shouldAppend;
  final String equation;
  final String result;

  const CalculatorState({
    required this.shouldAppend,
    required this.equation,
    required this.result,
  });

  factory CalculatorState.initial() {
    return const CalculatorState(
        shouldAppend: true, equation: '0', result: '0');
  }

  CalculatorState copyWith({
    bool? shouldAppend,
    String? equation,
    String? result,
  }) {
    return CalculatorState(
      shouldAppend: shouldAppend ?? this.shouldAppend,
      equation: equation ?? this.equation,
      result: result ?? this.result,
    );
  }
}
