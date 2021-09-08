part of 'home_layout_cubit.dart';

@immutable
abstract class HomeLayoutState {}

class HomeLayoutInitial extends HomeLayoutState {}

class ChangeBottomNavBarState extends HomeLayoutState {}

class HomeGetUserLoadingState extends HomeLayoutState {}

class HomeGetUserSuccessState extends HomeLayoutState {}

class HomeGetUserErrorState extends HomeLayoutState {
  final String error;
  HomeGetUserErrorState(this.error) {
    print(error.toString());
  }
}

class HomeGetCategoriesLoadingState extends HomeLayoutState {}

class HomeGetCategoriesSuccessState extends HomeLayoutState {}

class HomeGetCategoriesErrorState extends HomeLayoutState {
  final String error;
  HomeGetCategoriesErrorState(this.error) {
    print(error.toString());
  }
}
