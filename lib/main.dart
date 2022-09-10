import 'home_page.dart';
import 'models/calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'providers/provider.dart';
import 'colors.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  static const String title = 'Calculator';
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StateNotifierProvider<Calculator, CalculatorState>(
          create: (context) => Calculator(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.background1,
        ),
        home: const HomePage(title: title),
      ),
    );
  }
}
