import 'package:dartz/dartz.dart';

abstract class CartRepo {
  // Future<String> getPaymentToken();
  // Future<int> getOrderId(
  //     {required String paymentToken, required String amount});
  // Future<String> getPaymentKey(
  //     {required String paymentToken,
  //     required String amount,
  //     required String orderId});


  //      Future<Either<String,String>> payWithPayMob({required int amount});

       Future<Either<String,String>> payWithPayMob({required int amount,required String currency});



}





