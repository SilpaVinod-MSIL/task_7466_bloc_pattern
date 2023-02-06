import 'package:flutter/material.dart';

class TextUI extends StatelessWidget {
  String index;
  Color col;
  TextUI(this.index,this.col);

  @override
  Widget build(BuildContext context) {
    return Text(
      index,
      style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: col),
    );
  }
}
