// Facade help us to make simple interface for complex tasks with many components.
// We have many small classes (SOLID-style =))
class Network {
  void makeRequest() => print('[ Network request ]');
}
class Parser {
  void parseSth() => print('[ Parse something ]');
}
class Presenter {
  void presentOnScreen() => print('[ Present data on screen ]');
}

// We make one facade interface, to make all actions by one tap 
// Need to use only when tasks is to difficult to understand 
class Facade {
  final Network _network;
  final Parser _parser;
  final Presenter _presenter;

  Facade(this._network, this._parser, this._presenter);

  void showDataOnScreen() {
    _network.makeRequest();
    _parser.parseSth();
    _presenter.presentOnScreen();
  }
}