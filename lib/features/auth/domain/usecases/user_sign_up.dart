import 'package:fpdart/fpdart.dart';
import 'package:noosphere/core/error/failures.dart';
import 'package:noosphere/core/usecase/usecase.dart';
import 'package:noosphere/features/auth/domain/entities/user.dart';
import 'package:noosphere/features/auth/domain/repository/auth_repository.dart';

class UserSignUpUseCase implements UseCase<User, UserSignUpParams> {
  final AuthRepository authRepository;
  const UserSignUpUseCase(this.authRepository);
  @override
  Future<Either<Failure, User>> call(UserSignUpParams params) async {
    return await authRepository.signUpWithEmailAndPassword(
      email: params.email,
      password: params.password,
      name: params.name,
    );
  }
}

class UserSignUpParams {
  final String email;
  final String password;
  final String name;

  UserSignUpParams({
    required this.email,
    required this.password,
    required this.name,
  });
}
