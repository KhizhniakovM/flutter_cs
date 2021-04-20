import 'dart:async';
import 'dart:isolate';
import 'package:flutter/foundation.dart';

void main() {
  thirdMethod();
}

// MARK: - Isolate.spawn()
//
void firstMethod() async {
    // Заранее создаем порт отправитель,
  // через который будем отправлять данные в новый изолят
  late SendPort toChildSendPort;
  // Создаем принимающий порт для текущего изолята
  ReceivePort parentReceivePort = ReceivePort();
  // Подписываемся на получение объектов из другого изолята
  parentReceivePort.listen((message) {
    if (message is SendPort) {
      toChildSendPort = message;
    } else if (message is int) {
      print('Lenght of the string is - $message');
    }
  });
  // Из принимающего порта достаем порт отправитель,
  // в который мы будем складывать данные для передачи из другого изолята в текущий
  SendPort toParentSendPort = parentReceivePort.sendPort;

  // Спауним изолят
  // Сохраняем его, для того, чтобы можно было его убить если что 
  Isolate myIsolate = await Isolate.spawn<SendPort>(isolate, toParentSendPort);

  // Можем отправлять данные, как только инициализируем toChildSendPort
  Future.delayed(
      Duration(seconds: 1), () => toChildSendPort.send("Hello world"));
}

// Создаем "main" для нового изолята
void isolate(SendPort toParentSendPort) {
  // Создаем принимающий порт 
  ReceivePort childReceivePort = ReceivePort();
  // Достаем порт отправитель 
  SendPort toChildSendPort = childReceivePort.sendPort;
  // Отправляем порт отправитель родителю
  toParentSendPort.send(toChildSendPort);

  // Подписываемся на получение message 
  childReceivePort.listen((message) {
    if (message is String) {
      toParentSendPort.send(message.length);
    }
  });
}

// MARK: - Another variant 
void secondMethod() async {
  ReceivePort receivePort = ReceivePort();
  Isolate.spawn(insideIsolate, receivePort.sendPort);

  SendPort childSendPort = await receivePort.first;

  ReceivePort realReceivePort = ReceivePort()
  ..listen((message) { print(message); });

  childSendPort.send(realReceivePort.sendPort);
  childSendPort.send(1000);
}
void insideIsolate(SendPort sendPort) {
  SendPort toParentSendPort = sendPort;
  ReceivePort receivePort = ReceivePort();

  toParentSendPort.send(receivePort.sendPort);
  
  receivePort..listen((message) { 
    if (message is SendPort) {
      toParentSendPort = message;
    } 
    if (message is int) {
      print('print from new isolate - $message');
      toParentSendPort.send('$message');
    }
  });

}
// NOTE: - В конце нужно не забыть отписаться от портов, убить изоляты

// MARK: - Fox isolate communicator
// abstract class IsolateCommunicator<Send extends Object?,
//     Receive extends Object?> extends Stream<Receive> implements Sink<Send> {
//   static Future<IsolateCommunicator<Send, Receive>>
//       spawn<Send extends Object?, Receive extends Object?, Arg extends Object?>(
//     void Function(
//             IsolateCommunicator<Receive, Send> communicator, Arg arguments) entryPoint,
//             Arg arguments,
//   ) =>
//           communicator.spawn<Send, Receive, Arg>(entryPoint, arguments);
// }

// MARK: - compute()
Future<void> thirdMethod() async {
  final String result = await compute(methodToCompute, 'Hello world');
  print(result);
}

String methodToCompute(String string) { return '$string from future';}