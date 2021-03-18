// We have manager and we want that he delegate some of his functions to worker
class Manager {
  ManagerDelegate? delegate;
  
  void manageToDoSth() {
    delegate?.doSth();
  }
}

// Create mixin with this functions 
mixin ManagerDelegate {
  void doSth();
}
// Extend functionality of worker class with mixin
class Worker with ManagerDelegate {
    void doSth() {
      print('do sth');
    }
}

