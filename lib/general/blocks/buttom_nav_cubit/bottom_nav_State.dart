part of 'bottom_nav_cubit.dart';

abstract class BottomNavState extends Equatable {
  final int index;
  const BottomNavState(this.index);
}

class BottomNavInitial extends BottomNavState {
  BottomNavInitial() : super(0);

  @override
  List<Object> get props => [index];
}

class BottomNavUpdateState extends BottomNavState {
  BottomNavUpdateState(int index) : super(index);

  @override
  List<Object> get props => [index];
}
