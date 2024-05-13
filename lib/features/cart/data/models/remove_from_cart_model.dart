class RemoveFromCartModel {
  final String status;
  final String message;

  RemoveFromCartModel({required this.status, required this.message});

  factory RemoveFromCartModel.fromJson(Map<String, dynamic> json) {
    return RemoveFromCartModel(
      status: json['status'],
      message: json['message'],
    );
  }
}