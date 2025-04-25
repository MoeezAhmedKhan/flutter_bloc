abstract class SliderEvent {}

class Slide extends SliderEvent{
  final double sliderValue;
  Slide({required this.sliderValue});
}
class Toggle extends SliderEvent{}
