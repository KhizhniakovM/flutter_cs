import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_cs/best_practices/navigation/router.dart';
import 'package:flutter_cs/universal_ui/universal.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(AppWidget());
}
// TODO: - Add blocs to this example

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Universal.app(
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

class HomePage extends StatelessWidget {
  ValueNotifier<String> returnedFromSecond = ValueNotifier('');

  @override
  Widget build(BuildContext context) {
    // On that level we store all our logical components
    // as bloc and provider
    return MultiProvider(
      child: HomeView(),
      providers: [
        ValueListenableProvider<String?>.value(value: returnedFromSecond),
        Provider<HomePage>(create: (_) => this)
      ],
    );
  }
}

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Universal.button(
                child: Text('Next page'),
                onPressed: () => _goToSecond(context)),
            Text('Home Page'),
            Text(context.watch<String?>() ?? ''),
          ],
        ),
      ),
    );
  }

  void _goToSecond(BuildContext context) async {
    context.read<HomePage>().returnedFromSecond.value =
        await Navigator.pushNamed<dynamic>(context, '/details',
            arguments: <String, dynamic>{'passedString': 'Hello'});
  }
}

class DetailsPage extends StatelessWidget {
  final String passedString;

  const DetailsPage({Key? key, required this.passedString}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => passedString),
      ],
      child: DetailsView(),
    );
  }
}

class DetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Universal.scaffold(
        child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Universal.button(
              child: Text('Return'), onPressed: () => _pop(context)),
          Text(context.watch<String>())
        ],
      ),
    ));
  }

  void _pop(BuildContext context) => Navigator.pop(context, 'Hello my friend!');
}
