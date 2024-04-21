
import 'package:climb_up/core/api/endpoint.dart';

class ErrorRegesterModel {
  final int status;
  final String errorMessage;

  ErrorRegesterModel({required this.status, required this.errorMessage});
  factory ErrorRegesterModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorRegesterModel(
      status: jsonData[RegestrionApiKey.status],
      errorMessage: jsonData[RegestrionApiKey.errorMessage],
    );
  }
}
