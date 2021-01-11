// Bridge is similar to adapter, with some differences
// 1. We can change class, whose methods we want to use.
// 2. Often bridge use for more than one similar interfaces.

// We have some classes with similar interface
// or we need to make some interface, if they use similar methods
abstract class Vehicle {
  void ride();
}

class Car implements Vehicle {
  @override
  void ride() {
    print('Ride on car');
  }
}

class Moto implements Vehicle {
  @override
  void ride() {
    print('Ride on moto');
  }
}

// We want to use all this classes from one more interface
abstract class AbstractRider {
  Vehicle _vehicle;
  AbstractRider(this._vehicle);

  void ride();
  void choose(Vehicle vehicle);
}

// Also we can use default implementation for `vehicle`, to avoid unnecessary constructor
// ```
// abstract class AbstractRiderDefault {
//  Vehicle _vehicle = Car();

//  void ride();
//  void choose(Vehicle vehicle);
// }
//  ```

// Implement our new interface in a new class
class GoodRider implements AbstractRider {
  @override
  Vehicle _vehicle;

  GoodRider(this._vehicle);

  @override
  void ride() {
    _vehicle.ride();
  }

  @override
  void choose(Vehicle vehicle) {
    _vehicle = vehicle;
  }
}