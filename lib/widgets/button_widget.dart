import 'package:calculator/colors.dart';
import 'package:flutter/material.dart';
import '../utils/utils.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;
  final VoidCallback onClickedLong;

  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
    required this.onClickedLong,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color textColor = getTextColor(text);
    final Color buttonColor = getButtonColor(text);
    final double fontSize = Utils.isOperator(text) ? 34 : 27;
    final TextStyle style = TextStyle(
      color: textColor,
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
    );
    return Expanded(
      child: Container(
        height: double.infinity,
        margin: const EdgeInsets.all(6),
        child: ElevatedButton(
          onPressed: onClicked,
          onLongPress: onClickedLong,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            shape: const CircleBorder(),
            primary: buttonColor,
          ),
          child: text == '<'
              ? const Icon(
                  Icons.backspace_outlined,
                  color: Color(0xffffc000),
                )
              : Text(text, style: style),
        ),
      ),
    );
  }

  Color getTextColor(String buttonText) {
    switch (buttonText) {
      case '+':
      case '−':
      case '⨯':
      case '÷':
      case '%':
        return AppColors.operatorsText;
      case 'C':
      case '<':
        return AppColors.clearText;
      default:
        return AppColors.numbersText;
    }
  }

  Color getButtonColor(String buttonText) {
    switch (buttonText) {
      case '=':
        return AppColors.equalButton;
      case '+':
      case '−':
      case '⨯':
      case '÷':
      case '%':
      case 'C':
      case '<':
        return AppColors.operatorButtons;
      default:
        return AppColors.otherButtons;
    }
  }
}
