import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_cs/universal_ui/universal.dart';
import 'package:flutter_cs/universal_ui/universal_scaffold.dart';

void main() {
  runApp(Universal.app(home: Home()));
}

// ==================================================
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? _returnedFromSecond;

  @override
  Widget build(BuildContext context) {
    return UniversalScaffold(Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Universal.button(child: Text('Next page'), onPressed: _goToSecond),
          Text('Home Page'),
          Text('${_returnedFromSecond ?? ""}'),
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
      _returnedFromSecond = text;
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
          Universal.button(child: Text('Return'), onPressed: _pop),
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
