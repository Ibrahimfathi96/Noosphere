import 'package:fpdart/fpdart.dart';
import 'package:noosphere/core/error/failures.dart';

abstract interface class UseCase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params params);
}
