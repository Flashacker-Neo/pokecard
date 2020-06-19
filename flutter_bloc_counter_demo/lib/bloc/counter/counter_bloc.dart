import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloccounterdemo/repository/counter/counter_repository.dart';

class CounterEvent {}

class IncrementCounterEvent extends CounterEvent {}

class DecrementCounterEvent extends CounterEvent {}

class CounterState {}

class UninitializedCounterState extends CounterState {}

class HasValueCounterState extends CounterState {
  final int value;
  HasValueCounterState(this.value);
}

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  @override
  CounterState get initialState => UninitializedCounterState();

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event is IncrementCounterEvent) {
      //increment counter
      CounterRepository().counterValue++;
    } else if (event is DecrementCounterEvent) {
      //decrement counter
      CounterRepository().counterValue--;
    }

    //get value
    int currentValue = CounterRepository().counterValue;

    //yield state
    yield HasValueCounterState(currentValue);
  }
}
