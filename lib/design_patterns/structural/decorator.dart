// Decorator helps to extend class functionality dynamically (in runtime)
// Good to OCP and SRP.

// We have interface
abstract class Pizza {
  String getDescription();
  double getPrice();
}

// We have base class, that implements our interface
class PizzaBase extends Pizza {
  String description;

  PizzaBase(this.description);

  String getDescription() {
    return description;
  }

  double getPrice() {
    return 100;
  }
}

// We have some abstract decorator class, that we use to wrap all ours pizzas
abstract class PizzaDecorator extends Pizza {
  final Pizza pizza;

  PizzaDecorator(this.pizza);

  String getDescription() {
    return pizza.getDescription();
  }

  double getPrice() {
    return pizza.getPrice();
  }
}

// We can make concrete decoratora for our pizza
class Basil extends PizzaDecorator {
  String? description;

  Basil(Pizza pizza, {this.description}) : super(pizza);

  String getDescription() {
    return pizza.getDescription() + ' +' + (description ?? '');
  }

  double getPrice() {
    return pizza.getPrice() + 20;
  }
}

class Salami extends PizzaDecorator {
  String? description;

  Salami(Pizza pizza, {this.description}) : super(pizza);

  String getDescription() {
    return pizza.getDescription() + ' +' + (description ?? '');
  }

  double getPrice() {
    return pizza.getPrice() + 40;
  }
}

void main() {
  Pizza pizza = PizzaBase('Base pizza ');
  print(pizza.getDescription());
  pizza = Salami(pizza, description: 'Salami');
  print(pizza.getDescription());
  pizza = Basil(pizza, description: 'Basil');
  print(pizza.getDescription());
  print(pizza.getPrice().toString());
}
