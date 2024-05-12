class AddToCartResponse {
  final String status;
  final String message;

  AddToCartResponse({
    required this.status,
    required this.message,
  });

  factory AddToCartResponse.fromJson(Map<String, dynamic> json) =>
      AddToCartResponse(
        status: json['status'] as String,
        message: json['message'] as String,
      );
}
