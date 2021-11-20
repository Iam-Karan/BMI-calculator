import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Color(0xFF090C22),
          appBarTheme: AppBarTheme(color: Color(0xFF090C22)),
          scaffoldBackgroundColor: Color(0XFF090C22),
          fontFamily: 'ZenKaku'
      ),
      home: InputPage(),
    );
  }
}
