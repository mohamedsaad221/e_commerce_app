abstract class CheckoutState {}

class CheckoutInitial extends CheckoutState {}
class IncrementChangeIndexStepper extends CheckoutState {}
class MinusChangeIndexStepper extends CheckoutState {}
class ReachIndexStepper extends CheckoutState {}