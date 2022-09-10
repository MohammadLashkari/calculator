import 'package:calculator/colors.dart';
import 'package:flutter/material.dart';
import 'models/calculator.dart';
import 'providers/provider.dart';
import 'widgets/button_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        titleSpacing: 30,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(child: buildResult(context)),
            Expanded(flex: 2, child: buildButtons(context))
          ],
        ),
      ),
    );
  }

  Widget buildResult(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            context.watch<CalculatorState>().equation,
            overflow: TextOverflow.ellipsis,
            style:
                const TextStyle(color: Colors.white, fontSize: 35, height: 1),
          ),
          const SizedBox(height: 24),
          Text(
            context.watch<CalculatorState>().result,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.grey, fontSize: 18),
          )
        ],
      ),
    );
  }

  Widget buildButtons(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: AppColors.background2,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: Column(
        children: <Widget>[
          buildButtonRow('C', '<', '%', '÷'),
          buildButtonRow('7', '8', '9', '⨯'),
          buildButtonRow('4', '5', '6', '−'),
          buildButtonRow('1', '2', '3', '+'),
          buildButtonRow('00', '0', '.', '='),
        ],
      ),
    );
  }

  Widget buildButtonRow(
    String first,
    String second,
    String third,
    String fourth,
  ) {
    final List row = [first, second, third, fourth];
    return Expanded(
      child: Row(
        children: row
            .map(
              (text) => ButtonWidget(
                text: text,
                onClicked: () => onClickedButton(text),
                onClickedLong: () => onLongClickedButton(text),
              ),
            )
            .toList(),
      ),
    );
  }

  void onClickedButton(String buttonText) {
    switch (buttonText) {
      case '=':
        context.read<Calculator>().equals();
        break;
      case '<':
        context.read<Calculator>().delete();
        break;
      case 'C':
        context.read<Calculator>().reset();
        break;
      default:
        context.read<Calculator>().append(buttonText);
        break;
    }
  }

  void onLongClickedButton(String buttonText) {
    switch (buttonText) {
      case '<':
        context.read<Calculator>().reset();
        break;
    }
  }
}
