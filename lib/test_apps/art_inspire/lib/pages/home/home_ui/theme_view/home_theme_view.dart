import 'package:art_inspire/pages/home/home_ui/theme_view/home_theme_cell.dart';
import 'package:art_inspire/pages/home/home_ui/theme_view/home_theme_scroll_dots.dart';
import 'package:art_inspire/pages/home/home_ui/main_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeThemeView extends StatefulWidget {
  @override
  _HomeThemeViewState createState() => _HomeThemeViewState();
}

class _HomeThemeViewState extends State<HomeThemeView> {
  String? _currentTheme;
  String? _newTheme;
  final PageController _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    if (_currentTheme == null) {
      _currentTheme = context.watch<HomeTheme>().choosedTheme;
      _newTheme = context.read<HomeTheme>().choosedTheme;
    }
    if (_newTheme != context.read<HomeTheme>().choosedTheme) {
      _newTheme = context.read<HomeTheme>().choosedTheme;
      _controller.jumpToPage(0);
    }

    return Container(
        height: 350,
        child: Column(
          children: [
            Container(
              height: 320,
              child: PageView.builder(
                  controller: _controller,
                  onPageChanged: (value) {
                    context.read<HomeTheme>().chooseView(value);
                  },
                  itemCount: context.read<HomeTheme>().count,
                  itemBuilder: (context, position) => HomeThemeCell(
                        color: context.read<HomeTheme>().color,
                      )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 70),
              child: HomeThemeScrollDots(),
            )
          ],
        ));
  }
}
