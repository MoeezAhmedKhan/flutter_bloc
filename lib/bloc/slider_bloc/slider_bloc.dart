import 'package:bloc/bloc.dart';
import 'package:learn_flutter_bloc/bloc/slider_bloc/slider_event.dart';
import 'package:learn_flutter_bloc/bloc/slider_bloc/slider_state.dart';

class SliderBloc extends Bloc<SliderEvent, SliderState>{
  SliderBloc() : super(const SliderState()){
    on<Slide>(_slide);
    on<Toggle>(_onToggle);
  }
  void _slide(Slide event, Emitter<SliderState> emit){
    emit(state.copyWith(sliderValue: event.sliderValue));
  }

  void _onToggle(Toggle event, Emitter<SliderState> emit){
      emit(state.copyWith(isEnable: !state.isEnbale));
  }
}