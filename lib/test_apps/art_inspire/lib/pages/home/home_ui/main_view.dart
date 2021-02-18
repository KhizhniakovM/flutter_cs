import 'package:art_inspire/pages/home/home_ui/home_ui.dart';
import 'package:art_inspire/pages/home/home_ui/theme_view/home_theme_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'artist_view/artist_view.dart';
import 'main_logo.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: ListView(
          children: [
            HomeLogo(),
            ChangeNotifierProvider(
              create: (context) => HomeTheme(),
              child: Column(
                children: [HomeThemeChooser(), HomeThemeView()],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ArtistView()
          ],
        ));
  }
}

class HomeTheme with ChangeNotifier {
  String _choosedTheme = 'Pop Art';
  String get choosedTheme => _choosedTheme;

  int _choosedView = 0;
  int get choosedView => _choosedView;

  // TODO: - take this info from api
  int get count {
    switch (_choosedTheme) {
      case 'Pop Art':
        return 7;
      case 'Nature':
        return 5;
      default:
        return 3;
    }
  }

  Color get color {
    switch (_choosedTheme) {
      case 'Pop Art':
        return Colors.green;
      case 'Nature':
        return Colors.pink;
      default:
        return Colors.blue;
    }
  }

  void chooseTheme(String theme) {
    this._choosedView = 0;
    this._choosedTheme = theme;
    notifyListeners();
  }

  void chooseView(int number) {
    if (this._choosedView != number) {
      this._choosedView = number;
      notifyListeners();
    }
  }
}
