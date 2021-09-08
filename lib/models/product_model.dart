import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ProductModel {
  String? productId;
  String? name;
  String? image;
  String? description;
  String? size;
  String? category;
  dynamic price;
  Color? color;

  ProductModel({
    this.productId,
    this.name,
    this.image,
    this.description,
    this.size,
    this.category,
    this.price,
    this.color,
  });


  ProductModel.fromMap(Map<String, dynamic>? map){
    if (map == null) {
      return;
    }

    productId = map['productId'];
    name = map['name'];
    image = map['image'];
    description = map['description'];
    size = map['size'];
    category = map['category'];
    price = map['price'];
    color = HexColor(map['color']);
  }


  toMap() {
    return {
      'productId': productId,
      'name': name,
      'image': image,
      'description': description,
      'size': size,
      'category': category,
      'price': price,
      'color': color,
    };
  }


}
