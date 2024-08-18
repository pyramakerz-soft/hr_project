import 'package:equatable/equatable.dart';

const noInternetConnection ='لا يوجد إتصال بالإنترنت';

class Failure extends Equatable {
  final String message;
  final int? statusCode;
  const Failure({this.statusCode, required this.message});

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure({required super.message});
}

class DatabaseFailure extends Failure {
  const DatabaseFailure({required super.message});
}
