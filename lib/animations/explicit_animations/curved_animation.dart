import 'package:flutter/material.dart';

// Animation controller нужен для того,
// чтобы контролировать процесс выполнения анимации от 0 до 1

// В общем случае он нужен для того, чтобы контролировать ход других анимаций
// Обычно этот ход линейный

// В других случаях мы используем CurvedAnimation

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(child: BouncingBall()),
    );
  }
}

class BouncingBall extends StatefulWidget {
  @override
  _BouncingBallState createState() => _BouncingBallState();
}

class _BouncingBallState extends State<BouncingBall>
    with SingleTickerProviderStateMixin {
      
  static const _heightOfJump = 200;

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.reverse) {
        print('reverse');
      }
    });
    _controller.repeat(reverse: true);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeOutCirc)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          // MARK: - We need use animation to change Color
          color: Colors.green,
        ),
        width: 75,
        height: 75,
        // We need to add controller.value to our changing value
        margin: EdgeInsets.only(bottom: _animation.value * _heightOfJump));
  }
}
