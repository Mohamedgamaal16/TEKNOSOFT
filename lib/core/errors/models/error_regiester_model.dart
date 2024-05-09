import 'package:climb_up/core/api/endpoint.dart';

class ErroreCommerceOrders {
  final String errorMessage;

  ErroreCommerceOrders({required this.errorMessage});
  factory ErroreCommerceOrders.fromJson(Map<String, dynamic> jsonData) {
    return ErroreCommerceOrders(
      errorMessage: jsonData["detail"],
    );
  }
}
