import 'package:fpdart/fpdart.dart';
import 'package:noosphere/core/error/failures.dart';
import 'package:noosphere/features/auth/domain/entities/user.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, UserEntity>> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
}
