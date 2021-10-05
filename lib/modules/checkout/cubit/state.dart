import 'package:e_commerce_app/shared/components/components.dart';

abstract class CheckoutState {}

class CheckoutInitial extends CheckoutState {}

class ChangeStatusIndex extends CheckoutState {}

class ChangeRadio extends CheckoutState {}

class OrderSubmittingSuccessState extends CheckoutState {}

class OrderSubmittingErrorState extends CheckoutState {
  final String error;

  OrderSubmittingErrorState(this.error){
    showToast(text: error.toString(), state: ShowToastColor.ERROR);
  }
}