import 'package:e_commerce_app/models/cart_product_model.dart';

class OrderModel {
  String? userId;
  String? dateTime;
  List<CartProductModel>? products;
  Address? address;

  OrderModel({
    this.userId,
    this.dateTime,
    this.products,
    this.address,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId' : this.userId,
      'dateTime' : this.dateTime,
      // 'products' : this.products,
      // 'address' : this.address,

      'products': List<dynamic>.from(this.products!.map((product) => product.toMap())),

      'address' : this.address!.toMap(),


    };
  }

  OrderModel.fromMap(Map<String, dynamic>? map) {
    if(map == null){
      return;
    }

    userId = map['userId'];
    dateTime = map['dateTime'];

    // products = map['products'];
    // address = map['address'];

    map['products'].forEach((value) => products!.add(CartProductModel.fromMap(value)));

    address = Address.fromMap(map['address']);
  }

}

class Address {
  String? street1;
  String? street2;
  String? city;
  String? state1;
  String? country;

  Address({
    this.street1,
    this.street2,
    this.city,
    this.state1,
    this.country,
  });

  Map<String, dynamic> toMap() {
    return {
      'street1': this.street1,
      'street2': this.street2,
      'city': this.city,
      'state1': this.state1,
      'country': this.country,
    };
  }

  Address.fromMap(Map<String, dynamic>? map) {
    if(map == null){
      return;
    }
      street1 = map['street1'];
      street2 = map['street2'];
      city = map['city'];
      state1 = map['state1'];
      country = map['country'];
  }

}
