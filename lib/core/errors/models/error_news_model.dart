class ErrorNewsModel {
  final String status;
  final String code;
  final String message;

  ErrorNewsModel({
    required this.status,
    required this.code,
    required this.message,
  });

  factory ErrorNewsModel.fromJson(Map<String, dynamic> json) {
    return ErrorNewsModel(
      status: json['status'],
      code: json['code'],
      message: json['message'],
    );
  }
}
