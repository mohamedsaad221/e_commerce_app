class CategoryModel {
  String? name;
  String? image;

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'image': this.image,
    };
  }

  CategoryModel.fromMap(Map<String, dynamic> map) {
      name =  map['name'];
      image = map['image'];

  }
}