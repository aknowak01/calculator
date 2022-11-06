import 'package:calculator/widget/calculate.dart';
import 'package:calculator/widget/calculatorlandscape.dart';
import 'package:calculator/widget/calculatorportrait.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData.dark(),
      home: const Calculator(title: 'Calculator'),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key, required this.title});
  final String title;

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  late String _str;
  @override
  void initState() {
    super.initState();
    _str = Compute.str;
  }
  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context);
    if(mediaquery.orientation == Orientation.landscape){
      return CalculateLandscape(ttile: widget.title, str: this._str, key: widget.key);
    }
    return CalculatePortrait(ttile: widget.title, str: this._str, key: widget.key);
  }
}
