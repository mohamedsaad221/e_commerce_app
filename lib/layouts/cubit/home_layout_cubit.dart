import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/models/category_model.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/models/user_model.dart';
import 'package:e_commerce_app/modules/cart/cart_screen.dart';
import 'package:e_commerce_app/modules/products/products_screen.dart';
import 'package:e_commerce_app/modules/profile/profile_screen.dart';
import 'package:e_commerce_app/shared/helper/constance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;


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

    if (index == 0) {
      getCategories();
      currentIndex = index;
      emit(ChangeBottomNavBarState());
    }
    if (index == 1) {
      currentIndex = index;
      emit(ChangeBottomNavBarState());
    }
    if (index == 2) {
      currentIndex = index;
      emit(ChangeBottomNavBarState());
    }
  }

  UserModel? userModel;

  void getCurrentUser() async {
    emit(HomeGetUserLoadingState());
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .get()
        .then((value) {
      userModel = UserModel.fromMap(value.data());
      print('name = ${userModel!.name}');
      print('name = ${userModel!.email}');
      print('name = ${userModel!.email}');
      emit(HomeGetUserSuccessState());
    }).catchError((error) {
      emit(HomeGetUserErrorState(error.toString()));
    });
  }

  late List<CategoryModel> categories;

  void getCategories() async {
    emit(HomeGetCategoriesLoadingState());
    categories = [];
    await FirebaseFirestore.instance
        .collection('categories')
        .get()
        .then((value) {
      value.docs.forEach((value) {
        categories.add(CategoryModel.fromMap(value.data()));
      });

      print('Categories length = ${categories.length}');

      emit(HomeGetCategoriesSuccessState());
    }).catchError((error) {
      emit(HomeGetCategoriesErrorState(error.toString()));
    });
  }

  late List<ProductModel> allProducts;

  void getAllProducts() async {
    emit(HomeGetCategoryProductsLoadingState());

    allProducts = [];

    FirebaseFirestore.instance.collection('product').get().then((value) {
      value.docs.forEach((element) {
        allProducts.add(ProductModel.fromMap(element.data()));
      });

      print('//////////////////////////////////////////${allProducts.length}');

      emit(HomeGetCategoryProductsSuccessState(allProducts));
    }).catchError((error) {
      emit(HomeGetCategoryProductsErrorState(error.toString()));
    });
  }


  List<ProductModel> getProductsByCategory(
      {required String categoryName, required List<ProductModel> allProducts}) {
    List<ProductModel> products = [];

    allProducts.forEach((element) {

      if(element.category == categoryName) {
        products.add(element);
      }

    });

    return products;

  }

  late List<ProductModel> searchedProducts;

  void searchProduct(String query) {
    emit(SearchLoadingState());
    searchedProducts = [];

    if(query.isNotEmpty) {
      searchedProducts.addAll(allProducts.where((product) {
        final nameLower = product.name!.toLowerCase();
        final searchLower = query.toLowerCase();

        return nameLower.contains(searchLower);
      }).toList());
    }else{
      searchedProducts.clear();
    }
     emit(SearchSuccessState());
  }


//move collection docs into another collection
  copyProducts() async {
    await FirebaseFirestore.instance.collection('products').get().then((value) {
      value.docs.forEach((element) {
        element.reference.collection('devices').get().then((value) async {
          value.docs.forEach((element) async {
            await FirebaseFirestore.instance
                .collection('product')
                .doc()
                .set(element.data());

            print('yyyyyyyyyyy= ${element.data().length}');
          });
        });
      });
    });
  }

  void updateUserData({
     required String name,
     required String phone,
    String? image,
  }) async {
    UserModel model = UserModel(
      name: name,
      uId: userModel!.uId,
      email: userModel!.email,
      phone: phone,
      image: image ?? userModel!.image,
    );

    await FirebaseFirestore.instance
        .collection('users')
        .doc(model.uId)
        .update(model.toMap())
        .then((value) {
      getCurrentUser();
    }).catchError((error) {
      print(error.toString());
      emit(HomeUpdateUserErrorState(error.toString()));
    });
  }

  File? profileImage;
  ImagePicker get picker => _picker;
  final ImagePicker _picker = ImagePicker();


  Future<void> getProfileImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(HomeProfileImagePickedSuccessState());
    } else {
      print('No image selected. ');
      emit(HomeProfileImagePickedErrorState());
    }
  }

  void uploadProfileImage({
    required String name,
    required String phone,
  }) {
    emit(HomeUpdateUserLoadingState());

    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print(value);

        updateUserData(
          name: name,
          phone: phone,
          image: value,
        );
      }).catchError((error) {
        print(error.toString());
        emit(HomeUploadProfileImageSuccessState());
      });
    }).catchError((error) {
      print(error.toString());
      emit(HomeUploadProfileImageErrorState(error.toString()));
    });
  }

  }

