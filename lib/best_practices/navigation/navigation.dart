import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_cs/universal_ui/universal.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoApp(home: Home());
    }
    return MaterialApp(home: Home());
  }
}

// ==================================================
class Home extends StatefulWidget {
  String? returnedFromSecond;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with DetailsDelegate {
  @override
  Widget build(BuildContext context) {
    return UniversalScaffold(Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UniversalButton(Text('Next page'), _goToSecond),
          Text('Home Page'),
          Text('${widget.returnedFromSecond ?? ""}'),
        ],
      ),
    ));
  }

  // MARK: - Simple navigator method
  void _goToSecond() async {
    if (Platform.isIOS) {
      await Navigator.push(context,
          CupertinoPageRoute(builder: (context) => Details('Hello iOS', this)));
    } else {
      await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Details('Hello Android', this)));
    }
  }

  @override
  void updateView(String string) {
    widget.returnedFromSecond = string;
    setState(() {});
  }

  // MARK: - Delegate
}

class Details extends StatefulWidget {
  final String passedString;
  final DetailsDelegate? delegate;

  Details(this.passedString, [this.delegate]);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return UniversalScaffold(Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UniversalButton(Text('Return'), _pop),
          Text(widget.passedString)
        ],
      ),
    ));
  }

  // MARK: - Simple navigator method
  void _pop() {
    widget.delegate?.updateView('Hello from second screen');
    Navigator.pop(context);
  }
}

mixin DetailsDelegate {
  void updateView(String string);
}
