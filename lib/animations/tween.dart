import 'package:flutter/material.dart';

// Tween - линейное изменение значения от начальной величины до конечной
// Линейная интерполяция значения

void main() {
  // IntTween tween = IntTween(begin: 0, end: 10);

  // final duration = Duration(seconds: 1);
  // final step = Duration.millisecondsPerSecond / 60;

  // for (var currentTime = 0.0;
  //     currentTime < duration.inMilliseconds;
  //     currentTime += step) {
  //   //
  //   final value = tween.lerp(currentTime / duration.inMilliseconds);
  //   print('current time is ${currentTime}, tween is ${value}');
  // }

  // ==================================================
  // Также можно использовать tweens при работе с animation controller
  // AnimationController _controller = AnimationController(vsync: this);
  // Tween<double> tweenDouble = Tween<double>(begin: 0, end: 300);
  // ColorTween tweenColor = ColorTween(begin: Colors.red, end: Colors.green);

  // tweenDouble.evaluate(_controller); // Возвращает double
  // tweenColor.evaluate(_controller); // Возвращает Color
  runApp(MaterialApp(home: Scaffold(body: SequenceTextAnimation())));
}

// ==================================================
// Также мы можем создавать кастомные tweens
class CustomTween extends Tween<String> {
  CustomTween({String? begin = '', required String end})
      : super(begin: begin, end: end);

  @override
  String lerp(double t) {
    var currentLength = (end!.length * t).round();
    return end!.substring(0, currentLength);
  }
}

class TextAnimation extends StatefulWidget {
  @override
  _TextAnimationState createState() => _TextAnimationState();
}

class _TextAnimationState extends State<TextAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<String> _animation;

  final tweenText = CustomTween(
      end:
          'Sunt hic nostrum laboriosam facere rerum est. Dolorem ea eveniet. Voluptates vitae cumque eum facere omnis blanditiis incidunt qui. Optio omnis nam. Quia aliquam quidem consequatur et.');

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    _animation = tweenText.animate(_controller);
    _controller.repeat(reverse: true);
    _controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(_animation.value),
      ),
      color: Colors.white,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

// А также мы можем использовать TweenSequence!!
class SequenceTextAnimation extends StatefulWidget {
  @override
  _SequenceTextAnimationState createState() => _SequenceTextAnimationState();
}

class _SequenceTextAnimationState extends State<SequenceTextAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<String> _animation;

  final tweenText1 = CustomTween(
      end:
          'Sunt hic nostrum laboriosam facere rerum est. Dolorem ea eveniet. Voluptates vitae cumque eum facere omnis blanditiis incidunt qui. Optio omnis nam. Quia aliquam quidem consequatur et.');
  final tweenText2 = CustomTween(end: 'Hello world');

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    _animation = TweenSequence([
      TweenSequenceItem(tween: tweenText1, weight: 1),
      TweenSequenceItem(tween: tweenText2, weight: 1),
    ]).animate(_controller);

    _controller.repeat(reverse: true);
    _controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(_animation.value),
      ),
      color: Colors.white,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
