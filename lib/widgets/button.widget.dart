import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String label;
  final bool selected;
  final Function callback;

  Button({
    @required this.label,
    @required this.callback,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 110,
      decoration: BoxDecoration(
        color: selected ? Color(0xFFFDBF00) : Colors.transparent,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          width: 1,
          color: Color(0xFFFDBF00),
        ),
      ),
      child: FlatButton(
        onPressed: callback,
        child: Text(
          label,
          style: TextStyle(
            fontFamily: "Montserrat",
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
