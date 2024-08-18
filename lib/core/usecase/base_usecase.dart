import '../error/failure.dart';
import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';

abstract class BaseUseCase<T, Parameters> {
  Future<Either<Failure, T>> call(Parameters parameters);
}

class NoParameters extends Equatable {
  const NoParameters();

  @override
  List<Object?> get props => [];
}
