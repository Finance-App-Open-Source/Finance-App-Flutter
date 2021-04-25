import 'package:flutter/material.dart';

class AppInput extends StatelessWidget {
  final Icon? appendIcon;
  final Icon? suffixIcon;
  final String hinText;

  AppInput({Key? key, required this.hinText, this.appendIcon, this.suffixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15.0, top: 5.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: this.hinText,
          hintStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey[400],
          ),
          suffixIcon: Padding(
            padding: EdgeInsetsDirectional.only(end: 12.0),
            child: this.suffixIcon,
          ),
        ),
      ),
    );
  }
}
