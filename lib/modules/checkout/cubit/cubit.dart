import 'package:e_commerce_app/modules/cart/cart_screen.dart';
import 'package:e_commerce_app/modules/checkout/address_screen.dart';
import 'package:e_commerce_app/modules/checkout/cubit/state.dart';
import 'package:e_commerce_app/modules/checkout/summary_screen.dart';
import 'package:e_commerce_app/shared/components/components.dart';
import 'package:e_commerce_app/shared/constance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../deliverytime_screen.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(CheckoutInitial());

  static CheckoutCubit get(context) => BlocProvider.of(context);

  int activeStep = 0;
  int upperBound = 4;


  void incrementIndex() {
    if (activeStep < upperBound) {
      activeStep++;
      emit(IncrementChangeIndexStepper());
    }
  }

  void minusIndex() {
    if (activeStep > 0) {
      activeStep--;
      emit(MinusChangeIndexStepper());
    }
  }

  void stepReach(index){
    activeStep = index;
    emit(ReachIndexStepper());
  }


}
