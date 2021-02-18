import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_cs/universal_ui/universal.dart';


void main() {
  runApp(UniversalApp(
    home: Home(),
  ));
}

// ==================================================
class Home extends StatefulWidget {
  String? _returnedFromSecond;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return UniversalScaffold(Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UniversalButton(Text('Next page'), _goToSecond),
          Text('Home Page'),
          Text('${widget._returnedFromSecond ?? ""}'),
        ],
      ),
    ));
  }

  // MARK: - Simple navigator method
  void _goToSecond() {
    if (Platform.isIOS) {
      Navigator.push(
          context,
          CupertinoPageRoute(
              builder: (context) => Details(
                    passedString: 'Hello iOS',
                    callBack: _callBackMethod,
                  )));
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Details(
                  passedString: 'Hello Android', callBack: _callBackMethod)));
    }
  }

  void _callBackMethod(String text) {
    setState(() {
      widget._returnedFromSecond = text;
    });
  }
  // MARK: - Delegate
}

class Details extends StatefulWidget {
  final String passedString;
  final Function callBack;

  const Details({Key? key, required this.passedString, required this.callBack})
      : super(key: key);

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
    widget.callBack('Hello from second');
    Navigator.pop(context);
  }
}