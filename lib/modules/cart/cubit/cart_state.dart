part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitialState extends CartState {}

class AppCreateDatabaseState extends CartState{}

class AppGetAllProductsLoadingState extends CartState{}

class AppGetAllProductsSuccessState extends CartState{}

class AppInsertDatabaseState extends CartState{}

class AppUpdateDatabaseState extends CartState{}

class AppDeleteProductState extends CartState{}

class AppGetTotalPriceFromDatabaseState extends CartState{}

class ProductIncrementState extends CartState{}

class ProductDecrementState extends CartState{}

class CartClearDatabaseState extends CartState{}
