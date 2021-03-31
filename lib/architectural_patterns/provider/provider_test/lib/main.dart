import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ProviderTestApp());
}

class ProviderTestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePageSelector());
  }
}

class HomePageProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Мы создаем провайдер и даем ему данные,
    // которые мы можем достать из любой части дерева подвиджетов
    return Provider(
        create: (context) => 'Hello world Provider',
        // lazy - Создается только, если кому-то нужны будут имеющиеся данные
        lazy: true,
        // - Создаем билдер, для того, чтобы он создал свой уникальный контекст
        // Если child у нас в другом классе, то не обязятельно
        builder: (context, widget) {
          return Scaffold(
            body: Container(
              color: Colors.green,
              child: Center(
                // Доставая данные из провайдера обязательно указываем тип данных
                child: Text(
                    // Provider.of<String>(context)
                    context.watch<String>()),
                // Нельзя watch использовать вне метода build

                // context.read<String>()
                // Нельзя использовать read внутри метода build
              ),
            ),
          );
        });
  }
}
// The easiest way to read a value is by using the extension methods on [BuildContext]:

// context.watch<T>(), which makes the widget listen to changes on T
// context.read<T>(), which returns T without listening to it
// context.select<T, R>(R cb(T value)), which allows a widget to listen to only a small part of T.

// ==================================================
class HomePageConsumer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (context) => 'Hello world Consumer',
        lazy: true,
        builder: (context, widget) {
          return Scaffold(
            body: Container(
              color: Colors.green,
              child: Center(
                  // Можно также получить данные с помощью обертки Consumer
                  // Нужно его использовать если нет доступа к контексту потому,
                  // что он создает свой
                  child: _makeText()),
            ),
          );
        });
  }

  Widget _makeText() =>
      Consumer<String>(builder: (context, value, child) => Text(value));
}

// ==================================================
class HomePageSelector extends StatelessWidget {
  static const String _value = 'Hello world Selector';
  
  @override
  Widget build(BuildContext context) {
    return Provider.value(
        value: _value,
        builder: (context, widget) {
          return Scaffold(
            body: Container(
              color: Colors.green,
              child: Center(
                // Selector help to convert out model to needed model
                // Now we convert String to int 
                  child: Selector<String, int>(
                    // selector - place of converting
                selector: (context, value) {
                  return value.length;
                },
                   // in builder you will use almost converted value 
                builder: (context, value, child) {
                  return Text(value.toString());
                },
              )),
            ),
          );
        });
  }
}
