import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/models/category_model.dart';
import 'package:e_commerce_app/models/user_model.dart';
import 'package:e_commerce_app/modules/cart/cart_screen.dart';
import 'package:e_commerce_app/modules/products/products_screen.dart';
import 'package:e_commerce_app/modules/profile/profile_screen.dart';
import 'package:e_commerce_app/shared/constance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'home_layout_state.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutState> {
  HomeLayoutCubit() : super(HomeLayoutInitial());

  static HomeLayoutCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens = [
    ProductsScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeBottomNavBarState());
  }

  late UserModel userModel;

  void getCurrentUser() async {
    emit(HomeGetUserLoadingState());
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .get()
        .then((value) {
      userModel = UserModel.fromMap(value.data());
      emit(HomeGetUserSuccessState());
    }).catchError((error) {
      emit(HomeGetUserErrorState(error.toString()));
    });
  }

  List<CategoryModel> categories = [];

  void getCategories() async {
    emit(HomeGetCategoriesLoadingState());
    await FirebaseFirestore.instance
        .collection('categories')
        .get()
        .then((value) {


          // //first solution
          // value.docs.map((value) {
          //   categories.add(CategoryModel.fromMap(value.data()));
          // });
          //
          // //second solution
          // for (int i = 0; i < value.docs.length; i++) {
          //   categories.add(CategoryModel.fromMap(value.docs[i].data()));
          // }

          //third solution
          value.docs.forEach((value) {
            categories.add(CategoryModel.fromMap(value.data()));
          });

          print('Categories length = $categories');

      emit(HomeGetCategoriesSuccessState());
    }).catchError((error) {
      emit(HomeGetCategoriesErrorState(error.toString()));
    });
  }


}
