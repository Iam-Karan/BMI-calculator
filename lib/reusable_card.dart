import 'package:flutter/material.dart';

class ResusableCard extends StatelessWidget {

  ResusableCard({required this.theColor, required this.cardChild});

  final Color theColor;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: theColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}