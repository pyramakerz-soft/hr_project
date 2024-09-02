import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final int? statusCode;
  final String? message;
  final bool? success;

  const ErrorMessageModel({
    this.statusCode = 400,
    this.message,
    this.success,
  });

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
      statusCode: json["status"],
      message: json["message"],
      success: json["result"] == "true",
    );
  }

  @override
  List<Object?> get props => [
        message,
        success,
      ];
}
