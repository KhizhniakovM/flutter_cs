// You can use it when you need to make a copy
// of the object with it special complicated state

// Prototype is a general interface

mixin Prototype<T> {
  // MARK: - Methods
  T clone();
}

// Immutable class
class Point {
  // MARK: - Properties
  final int x;
  final int y;

  // MARK: - Initializers
  const Point(this.x, this.y);
}
// NOTE: - Implementation with extension methods
extension SuperPoint on Point {
  Point clone() => Point(x, y);
}

// NOTE: - Implementation with mixin
// ```
// class SuperPoint extends Point with Prototype<SuperPoint> {
//   // MARK: - Initializers
//   SuperPoint(int x, int y) : super(x, y);

//   // MARK: - Methods
//   SuperPoint clone() => SuperPoint(x, y);
// }
// ```

// or we can add this methods directly in the main class
// ```
// class Point {
//   // MARK: - Properties
//   final int x;
//   final int y;

//   // MARK: - Initializers
//   const Point(this.x, this.y);

//   // MARK: - Methods
//   Point clone() => Point(x, y);
// }
// ```

// or make cool initializer
// ```
// class Point {
//   // MARK: - Properties
//   late int x;
//   late int y;

//   // MARK: - Initializers
//   Point(this.x, this.y);
//   Point.clone(Point point) {
//     this.x = point.x;
//     this.y = point.y;
//   }
// }
// ```