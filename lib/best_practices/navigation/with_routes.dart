import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_cs/best_practices/navigation/router.dart';
import 'package:flutter_cs/universal_ui/universal.dart';

void main() {
  runApp(UniversalApp(
    home: Home(),
    initialRoute: '/',
    onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
  ));
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
          UniversalButton(Text('Next page'), _goToSecond),
          Text('Home Page'),
          Text('${_returnedFromSecond ?? ""}'),
        ],
      ),
    ));
  }
  void _goToSecond() {
    Navigator.pushNamed(context, '/details',
        arguments: {'passedString': 'Hello', 'passedMethod': _callBackMethod});
  }
  // TODO: - Errors on android version
  void _callBackMethod(String text) {
    setState(() {
      _returnedFromSecond = text;
    });
  }
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
