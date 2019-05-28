class Product {
  int id;
  String name;
  int quantity;
  double price;
  String image;
  int importedDate;
  int createdDate;
  int updatedDate;

  Product() {
    id = null;
    name = "";
    quantity = 0;
    price = 0.0;
    image = "";
    importedDate = 0;
    createdDate = 0;
    updatedDate = 0;
  }

  Product.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    quantity = map['quantity'];
    price = map['price'];
    image = map['image'];
    importedDate = map['importedDate'];
    createdDate = map['createdDate'];
    updatedDate = map['updatedDate'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = Map();
    data['updatedDate'] = this.id;
    data['name'] = this.name;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['image'] = this.image;
    data['importedDate'] = this.importedDate;
    data['createdDate'] = this.createdDate;
    data['updatedDate'] = this.updatedDate;
    return data;
  }
}
