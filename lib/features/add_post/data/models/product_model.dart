//  class AddProductModel {
 class AddProductModel {
  String status;
  ProductData data;

  AddProductModel({required this.status, required this.data});

  factory AddProductModel.fromJson(Map<String, dynamic> json) {
    return AddProductModel(
      status: json['status'],
      data: ProductData.fromJson(json['data']),
    );
  }
}

class ProductData {
  Product product;

  ProductData({required this.product});

  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
      product: Product.fromJson(json['product']),
    );
  }
}

class Product {
  String name;
  double priceEgp;
  String description;
  List<String> photos;
  String id;
  int v;

  Product({
    required this.name,
    required this.priceEgp,
    required this.description,
    required this.photos,
    required this.id,
    required this.v,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      priceEgp: json['price_egp'].toDouble(),
      description: json['description'],
      photos: List<String>.from(json['photos'].map((x) => x)),
      id: json['_id'],
      v: json['__v'],
    );
  }
}
