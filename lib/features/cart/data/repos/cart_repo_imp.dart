import 'package:climb_up/core/api/api_consumer.dart';
import 'package:climb_up/core/api/endpoint.dart';
import 'package:climb_up/core/utils/constants.dart';
import 'package:climb_up/core/utils/service_locator.dart';
import 'package:climb_up/features/cart/data/repos/cart_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepoImp implements CartRepo {
  final ApiConsumer api;

  CartRepoImp({required this.api});

  @override
  Future<Either<String, String>> payWithPayMob(
      {required int amount, required String currency}) async {
    try {
      // Get the authentication token
      String authenticationToken = await _getAuthenticationToken();

      // Get the order ID
      int orderId = await _getOrderId(
        authenticationToken: authenticationToken,
        amount: (100 * amount).toString(),
        currency: currency,
      );

      // Get the payment key
      String paymentKey = await _getPaymentKey(
        authenticationToken: authenticationToken,
        amount: (100 * amount).toString(),
        currency: currency,
        orderId: orderId.toString(),
      );

      return right(paymentKey);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<String> _getAuthenticationToken() async {
    final Response response =
        await Dio().post("${EndPoint.paymentBaseUrl}${EndPoint.paymentAuth}", data: {
      PaymentApiKey.apiKey: PaymentApiKey.apiKeyData,
    });
    return response.data[PaymentApiKey.token];
  }

  Future<int> _getOrderId({
    required String authenticationToken,
    required String amount,
    required String currency,
  }) async {
    final Response response = await Dio()
        .post("${EndPoint.paymentBaseUrl}${EndPoint.orders}", data: {
      PaymentApiKey.authToken: authenticationToken,
      "amount_cents": amount, // Amount in cents (STRING)
      "currency": currency, // Not required
      "delivery_needed": "false",
      "items": [],
    });
    return response.data[PaymentApiKey.id]; // Order ID (INTEGER)
  }

  Future<String> _getPaymentKey({
    required String authenticationToken,
    required String orderId,
    required String amount,
    required String currency,
  }) async {
        final SharedPreferences prefs = await getIt.getAsync<SharedPreferences>();

    final Response response = await Dio()
        .post("${EndPoint.paymentBaseUrl}${EndPoint.acceptance}", data: {
      // All of these fields are required
      "expiration": 3600,
      "auth_token": authenticationToken, // From the first API
      "order_id": orderId, // From the second API (STRING)
      "integration_id": "4573521", // Integration ID of the payment method
      "amount_cents": amount,
      "currency": currency,
      "billing_data": {
        // These fields must have values
        "first_name": prefs.getString(SharedPrefKeys.kProfileName),
        "last_name": prefs.getString(SharedPrefKeys.kProfileName),
        "email": prefs.getString(SharedPrefKeys.kProfileEmail),
        "phone_number": "+86(8)9135210487",
        // Other fields can be set to "NA"
        "apartment": "NA",
        "floor": "NA",
        "street": "NA",
        "building": "NA",
        "shipping_method": "NA",
        "postal_code": "NA",
        "city": "NA",
        "country": "NA",
        "state": "NA",
      },
    });
    return response.data[PaymentApiKey.token];
  }
}
