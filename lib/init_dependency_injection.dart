import 'package:get_it/get_it.dart';
import 'package:noosphere/core/secrets/app_secrets.dart';
import 'package:noosphere/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:noosphere/features/auth/data/repository/auth_repository_impl.dart';
import 'package:noosphere/features/auth/domain/repository/auth_repository.dart';
import 'package:noosphere/features/auth/domain/usecases/user_sign_in.dart';
import 'package:noosphere/features/auth/domain/usecases/user_sign_up.dart';
import 'package:noosphere/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocator = GetIt.instance;
Future<void> initDependencies() async {
  _initAuth();
  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnonKey,
  );
  serviceLocator.registerLazySingleton(() => supabase.client);
}

void _initAuth() {
  // Data sources
  serviceLocator
    ..registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(
        serviceLocator(),
      ),
    )
    // Repositories
    ..registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(
        serviceLocator(),
      ),
    )
    // Use cases
    ..registerFactory(
      () => UserSignUpUseCase(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => UserSignInUseCase(
        serviceLocator(),
      ),
    )
    // Blocs
    ..registerLazySingleton(
      () => AuthBloc(
        userSignUp: serviceLocator(),
        userSignIn: serviceLocator(),
      ),
    );
}
