import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Universal {
  static PageRoute route({required WidgetBuilder builder}) {
    if (Platform.isIOS) {
      return CupertinoPageRoute(builder: builder);
    } else {
      return MaterialPageRoute(builder: builder);
    }
  }

  static Widget scaffold({required Widget child}) {
    if (Platform.isIOS) {
      return CupertinoPageScaffold(child: child);
    } else {
      return Scaffold(body: child);
    }
  }
}
