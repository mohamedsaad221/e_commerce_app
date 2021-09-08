class CategoryModel {
  String? name;
  String? image;

  toMap() {
    return {
      'name': this.name,
      'image': this.image,
    };
  }

  CategoryModel.fromMap(Map<String, dynamic>? map) {
    if (map == null) {
      return;
    }

      name =  map['name'];
      image = map['image'];

  }
}