import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokecard/styles/colors.dart';

enum CustomButtonState { initial, pressed }

class CustomIconButton extends StatefulWidget {
  final IconData icon;
  final Function onPressed;

  CustomIconButton({@required this.icon, this.onPressed});

  @override
  _CustomIconButtonState createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
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
        height: 50,
        decoration: BoxDecoration(
          color: _buttonState == CustomButtonState.initial
              ? primaryColor
              : primaryColor.withOpacity(0.8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
              child: Icon(
            widget.icon,
            color: Colors.white,
          )),
        ),
      ),
    );
  }
}
