class Singleton {
  // MARK: - Properties
  static final Singleton _instance = Singleton._init();
  
  // MARK: - Initializer + Factory
  Singleton._init();
  factory Singleton() => _instance;
}