import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/models/cart_product_model.dart';
import 'package:e_commerce_app/shared/constance.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitialState());

  static CartCubit get(context) => BlocProvider.of(context);

  Database? database;
  List<CartProductModel> cartProducts = [];
  double totalPrice = 0;

  void createDatabase() async {
    String path = join(await getDatabasesPath(), 'cart.db');

    await openDatabase(path, version: 1, onCreate: (database, version) async {
      print('database created');
      await database.execute('''CREATE TABLE $tableName (
          name TEXT NOT NULL, 
          image TEXT NOT NULL, 
          price TEXT NOT NULL, 
          productId TEXT NOT NULL, 
          quantity INTEGER NOT NULL)
          ''').then((value) {
        print('table created');
      }).catchError((error) {
        print('Error when creating table ${error.toString()}');
      });
    }, onOpen: (database) {
      print('database opened');

      getAllProduct(database);
    }).then((value) {
      database = value;
      emit(AppCreateDatabaseState());
    });
  }

  insertToDatabase(CartProductModel productModel) async {
    for (var product in cartProducts) {
      print('productId from for in loop = ${product.productId}');

      if (product.productId == productModel.productId) {
        print('true////////////////');
        return;
      }
    }

    database!.transaction((txn) async {
      await txn
          .insert(
        tableName,
        productModel.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      )
          .then((value) {
        print('$value inserted successfully');
        emit(AppInsertDatabaseState());

        getAllProduct(database!);
      }).catchError((error) {
        print('Error when inserting new record ${error.toString()}');
      });
    });
  }

  getAllProduct(Database database) async {
    emit(AppGetAllProductsLoadingState());
    cartProducts = await getDataFromDatabase(database);
    emit(AppGetAllProductsSuccessState());
    getTotalPrice();
  }

  Future<List<CartProductModel>> getDataFromDatabase(Database database) async {
    List<Map> maps = await database.query(tableName);
    List<CartProductModel> list = maps.isNotEmpty
        ? maps.map((product) => CartProductModel.fromMap(product)).toList()
        : [];
    return list;
  }

  getTotalPrice() {
    totalPrice = 0.0;
    for (var product in cartProducts) {
      totalPrice += double.parse(product.price!) * product.quantity!;
    }

    print('totalPrice = $totalPrice');
    emit(AppGetTotalPriceFromDatabaseState());
  }

  updateProduct(CartProductModel productModel) async {
    database!.update(
      tableName,
      productModel.toMap(),
      where: 'productId = ?',
      whereArgs: [productModel.productId!],
    );
    emit(AppUpdateDatabaseState());
  }

  deleteProduct(CartProductModel productModel, int index) async {
    database!.delete(
      tableName,
      where: 'productId = ?',
      whereArgs: [productModel.productId!],
    ).then((value) {
      getAllProduct(database!);
    });
    emit(AppDeleteProductState());
  }

  increaseQuantity(int index) async {
    cartProducts[index].quantity = cartProducts[index].quantity! + 1;
    totalPrice += double.parse(cartProducts[index].price!);
    await updateProduct(cartProducts[index]);
  }

  decreaseQuantity(int index) async {
    if (cartProducts[index].quantity == 1) {
      return 1;
    }
    cartProducts[index].quantity = cartProducts[index].quantity! - 1;
    totalPrice -= double.parse(cartProducts[index].price!);
    await updateProduct(cartProducts[index]);
  }
}
