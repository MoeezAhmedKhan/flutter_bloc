class CounterState{
  final int counter;
  CounterState({this.counter = 1});

  CounterState copyWith({int? counter}){
    return CounterState(counter: counter ?? this.counter);
  }
}