class CounterRepository {
  int counterValue = 0;

  //must have only one shared instance in the whole code
  static final CounterRepository _singleton =
      CounterRepository._createSingleton();
  CounterRepository._createSingleton();
  factory CounterRepository() {
    return _singleton;
  }
}
