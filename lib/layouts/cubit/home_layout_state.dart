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

class HomeGetCategoryProductsLoadingState extends HomeLayoutState {}

class HomeGetCategoryProductsSuccessState extends HomeLayoutState {
  final List<ProductModel> products;

  HomeGetCategoryProductsSuccessState(this.products);
}

class HomeGetCategoryProductsErrorState extends HomeLayoutState {
  final String error;
  HomeGetCategoryProductsErrorState(this.error) {
    print(error.toString());
  }
}

class SearchLoadingState extends HomeLayoutState {}

class SearchSuccessState extends HomeLayoutState {}
