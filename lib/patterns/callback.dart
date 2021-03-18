class Worker {
  Function? doSth;

  void startDoSth() => doSth != null ? doSth!() : null;
}

class Manager {
  Worker makeWorker() {
    Worker worker = Worker();
    worker.doSth = soLazyToDo;
    return worker;
  }

  void soLazyToDo() {
    print('so lazy to do');
  }
}

void main() {
  var manager = Manager();
  var worker = manager.makeWorker();

  worker.startDoSth();
}