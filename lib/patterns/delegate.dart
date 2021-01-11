// Create mixin
mixin ManagerDelegate {
  void doSth();
}
// Extend functionality of worker class with mixin
class Worker with ManagerDelegate {
    void doSth() {
      print('do sth');
    }
}
// Add delegate to manager class, and assign it to make sth
class Manager {
  ManagerDelegate? delegate;
  
  void manageToDoSth() {
    delegate?.doSth();
  }
}