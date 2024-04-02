import 'package:fpdart/fpdart.dart';
import 'package:noosphere/core/error/failures.dart';
import 'package:noosphere/core/usecase/usecase.dart';
import 'package:noosphere/features/auth/domain/entities/user.dart';
import 'package:noosphere/features/auth/domain/repository/auth_repository.dart';

class UserSignIn implements UseCase<User, UserSignInParams> {
  final AuthRepository authRepository;

  const UserSignIn(this.authRepository);
  @override
  Future<Either<Failure, User>> call(UserSignInParams params) async {
    return await authRepository.signInWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
  }
}

class UserSignInParams {
  final String email;
  final String password;

  UserSignInParams({
    required this.email,
    required this.password,
  });
}
