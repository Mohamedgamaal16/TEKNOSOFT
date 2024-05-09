import 'package:dartz/dartz.dart';

abstract class CartRepo {
  Future<String> getPaymentToken();
  Future<int> getOrderId(
      {required String paymentToken, required String totalPrice});
  Future<String> getPaymentKey(
      {required String paymentToken,
      required String totalPrice,
      required String orderId});
       Future<Either<String,String>> payWithPayMob({required int totalPrice});
}





