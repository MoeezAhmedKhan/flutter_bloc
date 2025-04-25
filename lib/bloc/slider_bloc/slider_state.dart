class SliderState{
  final double slideValue;
  final bool isEnbale;
  const SliderState({
    this.slideValue = 0.4,
    this.isEnbale = false,
  });

  SliderState copyWith({double? sliderValue, bool? isEnable}){
    return SliderState(slideValue: sliderValue ?? this.slideValue, isEnbale: isEnable ?? this.isEnbale);
  }
}