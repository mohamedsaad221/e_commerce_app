import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/layouts/home_layout.dart';
import 'package:e_commerce_app/models/cart_product_model.dart';
import 'package:e_commerce_app/models/order_model.dart';
import 'package:e_commerce_app/modules/checkout/cubit/state.dart';
import 'package:e_commerce_app/shared/components/components.dart';
import 'package:e_commerce_app/shared/helper/constance.dart';
import 'package:e_commerce_app/shared/helper/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(CheckoutInitial());

  static CheckoutCubit get(context) => BlocProvider.of(context);

  int get index => _processIndex;
  int _processIndex = 0;

  Pages get pages => _pages;
  Pages _pages = Pages.DeliveryTime;

  Delivery get delivery => _delivery;
  Delivery _delivery = Delivery.StandardDelivery;

  String? street1, street2, city, state1, country;

  GlobalKey<FormState> formState = GlobalKey();

  void changeIndex(int index, context) {
    if (index == 0 || index < 0) {
      _pages = Pages.DeliveryTime;
      _processIndex = index;
    } else if (index == 1) {
      _pages = Pages.AddAddress;
      _processIndex = index;
    } else if (index == 2) {
      formState.currentState!.save();
      if (formState.currentState!.validate()) {
        _pages = Pages.Summary;
        _processIndex = index;
      }
    } else if (index == 3) {
      navigateAndFinish(context, HomeLayout());
      _pages = Pages.DeliveryTime;
      _processIndex = 0;
    }
    emit(ChangeStatusIndex());
  }

  Color getColor(int index) {
    if (index == _processIndex) {
      return inProgressColor;
    } else if (index < _processIndex) {
      return Colors.green;
    } else {
      return todoColor;
    }
  }

  void changeRadio(Delivery delivery ){
    _delivery = delivery;
    emit(ChangeRadio());
  }

  Future<void> sendOrder({
    @required String? dateTime,
    @required List<CartProductModel>? products,
  }) async{

    Address address = Address(
      street1: street1,
      street2: street2,
      city: city,
      state1: state1,
      country: country,
    );

    OrderModel orderModel = OrderModel(
      userId: uId,
      dateTime: dateTime,
      products: products,
      address: address,
    );

    await FirebaseFirestore.instance
        .collection('orders')
        .add(orderModel.toMap())
        .then((value) {
      showToast(text: 'your order is submitted', state: ShowToastColor.SUCCESS);
      emit(OrderSubmittingSuccessState());
    }).catchError((error) {
      emit(OrderSubmittingErrorState(error));
    });

  }

}
