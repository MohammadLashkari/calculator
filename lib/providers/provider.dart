import 'package:calculator/models/calculator.dart';
import 'package:calculator/utils/utils.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:state_notifier/state_notifier.dart';
import '../models/calculator.dart';

class Calculator extends StateNotifier<CalculatorState> {
  Calculator() : super(CalculatorState.initial());

  void append(String buttonText) {
    final equation = () {
      if (Utils.isOperator(buttonText) &&
          Utils.isOperatorAtEnd(state.equation)) {
        final newEquation =
            state.equation.substring(0, state.equation.length - 1);
        return newEquation + buttonText;
      } else if (state.shouldAppend) {
        return state.equation == '0' ? buttonText : state.equation + buttonText;
      } else {
        return Utils.isOperator(buttonText)
            ? state.equation + buttonText
            : buttonText;
      }
    }();

    state = state.copyWith(equation: equation, shouldAppend: true);
    calculate();
  }

  void equals() {
    calculate();
    resetResult();
  }

  void calculate() {
    final equation = state.equation
        .replaceAll('⨯', '*')
        .replaceAll('÷', '/')
        .replaceAll('−', '-');

    try {
      final exp = Parser().parse(equation);
      final result = '${exp.evaluate(EvaluationType.REAL, ContextModel())}';
      state = state.copyWith(result: result);
    } catch (error) {}
  }

  void delete() {
    final equation = state.equation;
    if (equation.isNotEmpty) {
      final newEquation =
          state.equation.substring(0, state.equation.length - 1);

      if (newEquation.isEmpty) {
        reset();
      } else {
        state = state.copyWith(equation: newEquation);
        calculate();
      }
    }
  }

  void reset() {
    const equation = '0';
    const result = '0';
    state = state.copyWith(equation: equation, result: result);
  }

  void resetResult() {
    final equation = state.result;
    state = state.copyWith(equation: equation, shouldAppend: false);
  }
}
