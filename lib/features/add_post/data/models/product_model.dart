class ProductResponseModel {
  final String status;
  final Product data;

  ProductResponseModel({
    required this.status,
    required this.data,
  });

  factory ProductResponseModel.fromJson(Map<String, dynamic> json) {
    return ProductResponseModel(
      status: json['status'],
      data: Product.fromJson(json['data']['product']),
    );
  }
}





class Product {
  final String name;
  final String priceEGP;
  final String description;
  final List<String> photos;
  final String id;
  final int v;

  Product({
    required this.name,
    required this.priceEGP,
    required this.description,
    required this.photos,
    required this.id,
    required this.v,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      priceEGP: json['price_egp'].toString(),
      description: json['description'],
      photos: List<String>.from(json['photos']),
      id: json['_id'],
      v: json['__v'],
    );
  }
}

