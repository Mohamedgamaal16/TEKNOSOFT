 class AddProductModel {
  final String status;
  final ProductData data;

  AddProductModel({required this.status, required this.data});

  factory AddProductModel.fromJson(Map<String, dynamic> json) {
    return AddProductModel(
      status: json['status'],
      data: ProductData.fromJson(json['data']),
    );
  }
}

class ProductData {
  final Product product;

  ProductData({required this.product});

  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
      product: Product.fromJson(json['product']),
    );
  }
}

class Product {
  final String name;
  final int priceEGP;
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
      priceEGP: json['price_egp'],
      description: json['description'],
      photos: List<String>.from(json['photos']),
      id: json['_id'],
      v: json['__v'],
    );
  }
}
