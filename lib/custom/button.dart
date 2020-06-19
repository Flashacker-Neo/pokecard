import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokecard/styles/colors.dart';

enum CustomButtonState { initial, pressed }

class CustomButton extends StatefulWidget {
  final String title;
  final Function onPressed;

  CustomButton({@required this.title, this.onPressed});

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  CustomButtonState _buttonState = CustomButtonState.initial;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _buttonState = CustomButtonState.pressed;
        });
      },
      onTapUp: (_) {
        setState(() {
          _buttonState = CustomButtonState.initial;
        });
        widget.onPressed();
      },
      onTapCancel: () {
        setState(() {
          _buttonState = CustomButtonState.initial;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: _buttonState == CustomButtonState.initial
              ? primaryColor
              : primaryColor.withOpacity(0.8),
          borderRadius: BorderRadius.all(
            Radius.circular(18.0),
          ),
          //border: Border.all(width: 2.0, color: Colors.black),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              widget.title,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
