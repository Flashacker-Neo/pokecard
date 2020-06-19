import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerdemo/provider/counter_value.dart';

class AddRemoveCounter extends StatelessWidget {
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        FlatButton(
          child: Text('Add'),
          color: Colors.blue,
          onPressed: () {
            Provider.of<CounterValue>(context, listen: false).increment();
          },
        ),
        FlatButton(
          child: Text('Remove'),
          color: Colors.red,
          onPressed: () {
            Provider.of<CounterValue>(context, listen: false).decrement();
          },
        )
      ],
    );
  }
}
