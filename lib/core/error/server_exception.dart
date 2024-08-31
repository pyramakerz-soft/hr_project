// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'error_message_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;

  const ServerException({
    required this.errorMessageModel,
  });

  @override
  String toString() => '${errorMessageModel.message}';
}

class LocalDatabaseException implements Exception {
  final String message;

  const LocalDatabaseException({
    required this.message,
  });
}
