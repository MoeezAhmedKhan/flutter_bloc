import 'package:bloc/bloc.dart';
import 'package:learn_flutter_bloc/bloc/counter_bloc/counter_event.dart';
import 'package:learn_flutter_bloc/bloc/counter_bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState>{
  CounterBloc() : super(CounterState()){
    on<IncreamentCounter>(_increament);
    on<DecreamentCounter>(_decreament);
  }

  void _increament(IncreamentCounter event, Emitter<CounterState> emit){
    emit(state.copyWith(counter: state.counter + 1));
  }

  void _decreament(DecreamentCounter event, Emitter<CounterState> emit){
    emit(state.copyWith(counter: state.counter - 1));
  }
}