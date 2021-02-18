import 'dart:ui';
import 'package:art_inspire/pages/home/home_ui/home_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:art_inspire/pages/home/home_ui/painters/one_dot_icon.dart';

class ThemeButton extends StatefulWidget {
  final String text;

  ThemeButton({Key? key, required this.text}) : super(key: key);

  @override
  _ThemeButtonState createState() => _ThemeButtonState();
}

class _ThemeButtonState extends State<ThemeButton> {
  bool isChoosed = false;

  @override
  Widget build(BuildContext context) {
    context.watch<HomeTheme>().choosedTheme == widget.text
        ? isChoosed = true
        : isChoosed = false;

    return GestureDetector(
      onTap: () {
        context.read<HomeTheme>().chooseTheme(widget.text);
      },
      child: Container(
        padding: const EdgeInsets.only(right: 30),
        height: 20,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            isChoosed
                ? OneDotIcon(
                    color: Colors.red,
                    strokeWidth: 5,
                    width: 12,
                    height: 12,
                  )
                : SizedBox(),
            SizedBox(width: 5),
            Text(
              widget.text,
              style: isChoosed
                  ? TextStyle(
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.black)
                  : TextStyle(
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.black38),
            )
          ],
        ),
      ),
    );
  }
}
