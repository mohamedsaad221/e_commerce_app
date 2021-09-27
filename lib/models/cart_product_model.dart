class CartProductModel {
  String? productId;
  String? name;
  String? image;
  String? price;
  int? quantity;

  CartProductModel({
    this.productId,
    this.name,
    this.image,
    this.price,
    this.quantity,
  });


  CartProductModel.fromMap(Map<dynamic, dynamic>? map){
    if (map == null) {
      return;
    }

    productId = map['productId'];
    name = map['name'];
    image = map['image'];
    price = map['price'];
    quantity = map['quantity'];
  }


  toMap() {
    return {
      'productId': productId,
      'name': name,
      'image': image,
      'price': price,
      'quantity': quantity,
    };
  }

}