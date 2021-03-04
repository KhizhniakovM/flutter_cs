import 'package:meta/meta.dart';

// We have some class. We want to use its method. We can't override this method or class.
// I don't know how to prevent this class from inheritance and can we do it generally. 
class Adaptee {
  @nonVirtual
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

// More `dart'y` =) method with double inheritance
// Create mixin with necessary method
// But maybe this break SOLID single-responsibility principle ??
mixin TargetMixin {
  void makeSth();
}
// Extend Adaptee with TargetMethod
class AdapterAnother extends Adaptee with TargetMixin {
  @override
  void makeSth() {
    print('[Adapter] user call interface method');
    this.specificUnchangedMethod();
  }  
}