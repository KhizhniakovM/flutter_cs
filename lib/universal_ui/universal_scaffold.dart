import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class UniversalScaffold extends StatelessWidget {
  final Widget child;

  UniversalScaffold(this.child);

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoPageScaffold(
        child: child,
        navigationBar: CupertinoNavigationBar(),
      );
    }
    return Scaffold(
      body: child,
      appBar: AppBar(),
    );
  }
}
