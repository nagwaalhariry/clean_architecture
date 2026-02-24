import 'package:dartz/dartz.dart';

import '../error/failures.dart';

/// Generic use case contract.
abstract class BaseUseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

/// Use when no input params are required.
class NoParams {
  const NoParams();
}
