// We have some class. We want to use its method.
class Adaptee {
  void specificUnchangedMethod() {
    print('[Adaptee] make specific method');
  }
}

// Create Interface with necessary methods
abstract class Target {
  void makeSth();
}

// Create Adapter.
class Adapter implements Target {
  // MARK: - Properties
  final Adaptee _adaptee;
  
  // MARK: - Initializer
  Adapter(this._adaptee);
  
  // MARK: - Methods
  void makeSth() {
    print('[Adapter] user call interface method');
    _adaptee.specificUnchangedMethod();
  }
}