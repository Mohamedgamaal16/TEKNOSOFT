// class CartProductsModel {
//   final String status;
//   final CartProductsList data;

//   CartProductsModel({required this.status, required this.data});

//   factory CartProductsModel.fromJson(Map<String, dynamic> json) {
//     return CartProductsModel(
//       status: json['status'],
//       data: CartProductsList.fromJson(json['data']),
//     );
//   }
// }

// class CartProductsList {
//   final List<Product> products;
//   final int totalprice;

//   CartProductsList({required this.products, required this.totalprice});

//   factory CartProductsList.fromJson(Map<String, dynamic> json) {
//     List<Product> productsList = [];
//     if (json['products'] != null) {
//       json['products'].forEach((productJson) {
//         productsList.add(Product.fromJson(productJson));
//       });
//     }
//     return CartProductsList(
//       products: productsList,
//       totalprice: json['totalprice'],
//     );
//   }
// }

// class Product {
//   final String id;
//   final String name;
//   final int priceEGP;
//   final String description;
//   final List<String> photos;
//   final int v;

//   Product({
//     required this.id,
//     required this.name,
//     required this.priceEGP,
//     required this.description,
//     required this.photos,
//     required this.v,
//   });

//   factory Product.fromJson(Map<String, dynamic> json) {
//     return Product(
//       id: json['_id'],
//       name: json['name'],
//       priceEGP: json['price_egp'],
//       description: json['description'],
//       photos: List<String>.from(json['photos']),
//       v: json['__v'],
//     );
//   }
// }


class CartProductsModel {
  final String status;
  final CartProductsList data;

  CartProductsModel({required this.status, required this.data});

  factory CartProductsModel.fromJson(Map<String, dynamic> json) {
    return CartProductsModel(
      status: json['status'],
      data: CartProductsList.fromJson(json['data']),
    );
  }
}

class CartProductsList {
  final List<Product> products;
  final int totalprice;

  CartProductsList({required this.products, required this.totalprice});

  factory CartProductsList.fromJson(Map<String, dynamic> json) {
    List<Product> productsList = [];
    if (json['products'] != null) {
      json['products'].forEach((productJson) {
        productsList.add(Product.fromJson(productJson));
      });
    }
    
    // Check if totalprice exists in the JSON data, otherwise set it to 0
    int totalPrice = json.containsKey('totalprice') ? json['totalprice'] : 0;

    return CartProductsList(
      products: productsList,
      totalprice: totalPrice,
    );
  }
}

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