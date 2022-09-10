class Utils {
  static bool isOperator(String buttonText) {
    return buttonText.contains(RegExp(r'[⨯|÷|%|+|−|=|±]'));
  }

  static bool isOperatorAtEnd(String equation) {
    if (equation.isNotEmpty) {
      return Utils.isOperator(equation.substring(equation.length - 1));
    } else {
      return false;
    }
  }
}
