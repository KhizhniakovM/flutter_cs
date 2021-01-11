// Help to make complex classes

// We have some class and we need to make many different instance of it.
class Pizza {
  // MARK: - Properties
  late Size _diameter;
  late Set<String> _toppings;
  String? _comments;

  // MARK: - Initializer
  Pizza(PizzaBuilder builder) {
    this._diameter = builder.diameter;
    this._toppings = builder.toppings;
    this._comments = builder.comments;
  }
}

enum Size { small, medium, big }

class PizzaBuilder {
  // MARK: - Properties
  // You can make default values for `builder`, make properties `nullable` or `late`.
  late Size diameter;
  String? comments;
  Set<String> toppings = <String>{};

  // MARK: - Methods
  Pizza build() {
    return Pizza(this);
  }

  // We can add getters and setters for every property and make them private, if we need.
}
