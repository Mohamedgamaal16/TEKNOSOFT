

class EndPoint  {

  static String baseUrl =
      "https://climb-upp-2c04b3f20fb9.herokuapp.com/api/v1/";
  static String signUp = "users/signup";
  static String login = "users/login";
  static String addProduct = "users/login";

  static String getAllProducts = "products/";

static String addToCart(productId) {
    return "products/${productId}/addtocart";
  }
static String getUserData(id) {
    return "users/$id";
  }

  static String orders = "ecommerce/orders";
  static String paymentAuth = "auth/tokens";
  static String acceptance = "acceptance/payment_keys";
  static String paymentBaseUrl = "https://accept.paymob.com/api/";
 
//   static String search(search) {
//     return "everything?q=$search";
//   }
//  static String categories(category) {
//     return "$topHeadlines?category=$category";
//   }
 
}

class PaymentApiKey {
  static String apiKeyData =
      "ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2T1RjMU9EWTNMQ0p1WVcxbElqb2lhVzVwZEdsaGJDSjkueXJpTmVOUzJMYm5JWF9SSlEwd3U5bWJBVjhfbWpnSHp3OEtUR1o1S191MkJiNXB3ZnpyT05wallSVjBkTDdUWVkxQXB3WmZ4QW1jb1hCbmQyV3h6WGc=";
  static String apiKey = 'api_key';
  static String token = 'token';
  static String authToken = 'auth_token';
  static String id = 'id';

  static String integrationIdData = '4573521';
}

class ApiKey {
  static String token = 'token';
  static String id = 'id';

  static String name = 'name';
  static String email = 'email';
  static String password = 'password';
  static String passwordConfirm = 'passwordConfirm';

  static String priceEgp = "price_egp";
  static String evaluation = "evaluation";
  static String pic = "pic";
}
