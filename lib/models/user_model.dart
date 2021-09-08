class UserModel {
  String? name;
  String? email;
  String? uId;
  String? image;
  String? phone;

  UserModel({
    this.name,
    this.email,
    this.uId,
    this.image,
    this.phone,
  });

  UserModel.fromMap(Map<String, dynamic>? map) {
    if (map == null) {
      return;
    }

    name = map['name'];
    email = map['name'];
    uId = map['uId'];
    phone = map['phone'];
    image = map['image'];
  }

  toMap() {
    return {
      'name': name,
      'email': email,
      'uId': uId,
      'phone': phone,
      'image': image,
    };
  }
}
