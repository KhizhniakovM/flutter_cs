import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class UniversalButton extends StatelessWidget {

  final Widget text;
  final void Function() onPressed;

  UniversalButton(this.text, this.onPressed);

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoButton(child: text, onPressed: onPressed);
    }
    return TextButton(onPressed: onPressed, child: text);
  }
}