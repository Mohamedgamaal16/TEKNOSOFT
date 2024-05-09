import 'package:climb_up/core/api/api_consumer.dart';
import 'package:climb_up/core/api/endpoint.dart';
import 'package:climb_up/core/errors/exceptions.dart';
import 'package:climb_up/features/cart/data/repos/cart_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

class CartREpoImp implements CartRepo {
  final ApiConsumer api;

  CartREpoImp({required this.api});

  @override
  Future<String> getPaymentToken() async {
    try {
      final response = await api.post(EndPoint.auth,
          data: {PaymentApiKey.apiKey: PaymentApiKey.apiKeyData});
      return response.data[PaymentApiKey.token];
    } on ServerException catch (e) {
      return e.errModel.errorMessage;
    }
  }

  @override
  Future<int> getOrderId(
      {required String paymentToken, required String totalPrice}) async {
    try {
      final response = await api.post(EndPoint.orders, data: {
        PaymentApiKey.authToken: paymentToken,
        PaymentApiKey.amountCents: totalPrice,
        PaymentApiKey.deliveryNeeded: "true",
        PaymentApiKey.currency: "EGP",
        PaymentApiKey.items: []
      });
      return response.data[PaymentApiKey.id];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> getPaymentKey(
      {required String paymentToken,
      required String totalPrice,
      required String orderId}) async {
    final response = await api.post(EndPoint.acceptance, data: {
      PaymentApiKey.authToken: paymentToken,
      PaymentApiKey.amountCents: totalPrice,
      PaymentApiKey.currency: "EGP",
      PaymentApiKey.integrationId: 1,
      "order_id": orderId,
      "lock_order_when_paid": "false",
      "billing_data": {
        "apartment": "803",
        "email": "claudette09@exa.com",
        "floor": "42",
        "first_name": "Clifford",
        "street": "Ethan Land",
        "building": "8028",
        "phone_number": "+86(8)9135210487",
        "shipping_method": "PKG",
        "postal_code": "01898",
        "city": "Jaskolskiburgh",
        "country": "CR",
        "last_name": "Nicolas",
        "state": "Utah"
      },
    });
    return response.data[PaymentApiKey.token];
  }

  @override
  Future<Either<String, String>> payWithPayMob({required int totalPrice}) async {
    try {
      String token = await getPaymentToken();
      int orderId = await getOrderId(
          paymentToken: token, totalPrice: (100 * totalPrice).toString());
      String url = await getPaymentKey(
          paymentToken: token,
          orderId: orderId.toString(),
          totalPrice: (100 * totalPrice).toString());
      return right(url);
    } on ServerException catch (e) {
      return left(e.errModel.errorMessage);
    }
  }
}
