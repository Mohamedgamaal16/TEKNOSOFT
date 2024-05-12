class Product {
  final String id;
  final String name;
  final int priceEGP;
  final String description;
  final List<String> photos;
  final int v;

  Product({
    required this.id,
    required this.name,
    required this.priceEGP,
    required this.description,
    required this.photos,
    required this.v,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'],
      name: json['name'],
      priceEGP: json['price_egp'],
      description: json['description'],
      photos: List<String>.from(json['photos']),
      v: json['__v'],
    );
  }
}

class ProductDataModel {
  final List<Product> products;

  ProductDataModel({required this.products});

  factory ProductDataModel.fromJson(Map<String, dynamic> json) {
    return ProductDataModel(
      products: List<Product>.from(
          json['data']['products'].map((product) => Product.fromJson(product))),
    );
  }
}
