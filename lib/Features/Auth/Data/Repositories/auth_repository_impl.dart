import 'package:blogging/Core/error/exceptions.dart';
import 'package:blogging/Core/error/failure.dart';
import 'package:blogging/Features/Auth/Data/DataSources/auth_remote_data_source.dart';
import 'package:blogging/Features/Auth/Domain/Repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSourceImpl authRemoteDataSourceImpl;

  AuthRepositoryImpl(this.authRemoteDataSourceImpl);

  //why are we taking authRemoteDataSourceImpl in constructor
  //why arent we directly initializing it, we are not doing it because, it will
  // --create a dependency of AuthRemoteDataSourceImpl in this AuthRepositoryImpl,
  //so avoid direct initialization, instead we use Dependency injection.

  @override
  Future<Either<Failure, String>> loginInWithEmailPassword(
      {required String email, required String password}) {
    // TODO: implement loginInWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> signUpWithEmailPassword(
      {required String name,
      required String email,
      required String password}) async {
    try {
      final userId = await authRemoteDataSourceImpl.signUpWithEmailPassword(
          email: email, name: name, password: password);
      return right(userId);//we simple can't return userId,that is string, we need a msg a success msg
      //right(userId) this means right() gives a success msg with UserId
    } on ServerException catch (exception) {
      return left(Failure(exception.msg)); // here left is for failure, right is for success
    }//Failure(exception.msg) becos check the signature of method it is returning
    // --Failure class not string, so need to convert string to FAilure()
  }
}
