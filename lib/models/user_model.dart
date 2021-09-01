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

  UserModel.fromJson(Map<String , dynamic> json){
    name = json['name'];
    email = json['name'];
    uId = json['uId'];
    phone = json['phone'];
    image = json['image'];

  }

  Map<String , dynamic> toMap() {
    return {
      'name':name,
      'email':email,
      'uId':uId,
      'phone':phone,
      'image':image,
    };
  }
}