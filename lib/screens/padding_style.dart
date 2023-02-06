import 'package:flutter/material.dart';

class PaddingClass extends StatelessWidget {
  String index;
  Color col;
  FontWeight weight;
  FontStyle style;
  TextDecoration decoration;
  PaddingClass(this.index,this.col,this.weight,this.style,this.decoration);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Text(
        index,
        style: TextStyle(
            decoration: decoration,
            fontSize: 15,
            color: col,
            fontWeight: weight,
            fontStyle: style),
      ),
    );
  }
}
