// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:post_clean_arch/core/network/api_service.dart' as _i601;
import 'package:post_clean_arch/features/comments/data/datasources/comments_remote_datasource.dart'
    as _i563;
import 'package:post_clean_arch/features/comments/data/repository/comments_repository_impl.dart'
    as _i736;
import 'package:post_clean_arch/features/comments/domain/repository/comments_repository.dart'
    as _i982;
import 'package:post_clean_arch/features/comments/domain/usecases/get_comments_usecase.dart'
    as _i978;
import 'package:post_clean_arch/features/comments/presentation/provider/comments_provider.dart'
    as _i349;
import 'package:post_clean_arch/features/posts/data/datasources/firestore_post_datasource.dart'
    as _i377;
import 'package:post_clean_arch/features/posts/data/repository/post_repository_impl.dart'
    as _i897;
import 'package:post_clean_arch/features/posts/domain/repository/post_repository.dart'
    as _i1026;
import 'package:post_clean_arch/features/posts/domain/usecases/add_post_usecase.dart'
    as _i369;
import 'package:post_clean_arch/features/posts/domain/usecases/delete_post_usecase.dart'
    as _i538;
import 'package:post_clean_arch/features/posts/domain/usecases/read_post_usecase.dart'
    as _i355;
import 'package:post_clean_arch/features/posts/domain/usecases/update_post_usecase.dart'
    as _i763;
import 'package:post_clean_arch/features/posts/presentation/providers/post_provider.dart'
    as _i36;
import 'package:post_clean_arch/features/users/data/datasources/firebase_auth_datasource.dart'
    as _i266;
import 'package:post_clean_arch/features/users/data/repository/user_repository_impl.dart'
    as _i660;
import 'package:post_clean_arch/features/users/domain/repository/user_repository.dart'
    as _i521;
import 'package:post_clean_arch/features/users/domain/usecases/sign_in_with_email_password_usecase.dart'
    as _i598;
import 'package:post_clean_arch/features/users/domain/usecases/sign_up_with_email_password_usecase.dart'
    as _i145;
import 'package:post_clean_arch/features/users/presentation/providers/auth_email_provider.dart'
    as _i369;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i369.AuthProvider>(() => _i369.AuthProvider());
    gh.lazySingleton<_i601.ApiService>(() => _i601.ApiService());
    gh.lazySingleton<_i377.FirestorePostDataSource>(
      () => _i377.FirestorePostDataSource(),
    );
    gh.lazySingleton<_i266.FirebaseAuthDataSource>(
      () => _i266.FirebaseAuthDataSource(),
    );
    gh.lazySingleton<_i521.UserRepository>(
      () => _i660.UserRepositoryImpl(
        firebaseAuthDataSource: gh<_i266.FirebaseAuthDataSource>(),
      ),
    );
    gh.lazySingleton<_i563.CommentsRemoteDatasource>(
      () => _i563.CommentsRemoteDatasource(gh<_i601.ApiService>()),
    );
    gh.factory<_i145.SignUpWithEmailPasswordUseCase>(
      () => _i145.SignUpWithEmailPasswordUseCase(
        userRepository: gh<_i521.UserRepository>(),
      ),
    );
    gh.factory<_i598.SignInWithEmailPasswordUseCase>(
      () => _i598.SignInWithEmailPasswordUseCase(
        userRepository: gh<_i521.UserRepository>(),
      ),
    );
    gh.lazySingleton<_i982.CommentsRepository>(
      () => _i736.CommentsRepositoryImpl(gh<_i563.CommentsRemoteDatasource>()),
    );
    gh.lazySingleton<_i1026.PostRepository>(
      () => _i897.PostRepositoryImpl(
        postDataSource: gh<_i377.FirestorePostDataSource>(),
      ),
    );
    gh.factory<_i355.ReadPostUseCase>(
      () => _i355.ReadPostUseCase(postRepository: gh<_i1026.PostRepository>()),
    );
    gh.factory<_i538.DeletePostUseCase>(
      () =>
          _i538.DeletePostUseCase(postRepository: gh<_i1026.PostRepository>()),
    );
    gh.factory<_i369.AddPostUseCase>(
      () => _i369.AddPostUseCase(postRepository: gh<_i1026.PostRepository>()),
    );
    gh.factory<_i763.UpdatePostUseCase>(
      () =>
          _i763.UpdatePostUseCase(postRepository: gh<_i1026.PostRepository>()),
    );
    gh.lazySingleton<_i978.GetCommentsUsecase>(
      () => _i978.GetCommentsUsecase(
        commentsRepository: gh<_i982.CommentsRepository>(),
      ),
    );
    gh.factory<_i349.CommentsProvider>(
      () => _i349.CommentsProvider(gh<_i978.GetCommentsUsecase>()),
    );
    gh.factory<_i36.PostProvider>(
      () => _i36.PostProvider(
        addPostUseCase: gh<_i369.AddPostUseCase>(),
        updatePostUseCase: gh<_i763.UpdatePostUseCase>(),
        deletePostUseCase: gh<_i538.DeletePostUseCase>(),
        readPostUseCase: gh<_i355.ReadPostUseCase>(),
      ),
    );
    return this;
  }
}
