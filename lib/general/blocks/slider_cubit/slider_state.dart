part of 'slider_cubit.dart';

abstract class SliderState extends Equatable {
  final List sliders;
  const SliderState(this.sliders);
}

class SliderInitial extends SliderState {
  SliderInitial() : super([]);

  @override
  List<Object> get props => [sliders];
}

class SliderUpdateState extends SliderState {
  SliderUpdateState(List sliders) : super(sliders);

  @override
  List<Object> get props => [sliders];
}
