//for each feature we need different use case like for signup different use case
// and signIn different use case
//usecase is single class or single function doing our job
import 'package:blogging/Core/Usecase/usercase_interface.dart';
import 'package:blogging/Core/error/failure.dart';
import 'package:blogging/Features/Auth/Data/Repositories/auth_repository_impl.dart';
import 'package:blogging/Features/Auth/Presentation/Pages/signup_page.dart';
import 'package:fpdart/fpdart.dart';

class UserSignup implements UseCase<String, UserSignUpParameters>{
  final AuthRepositoryImpl authRepositoryImpl;

  UserSignup(this.authRepositoryImpl);

  @override
  Future<Either<Failure, String>> call(UserSignUpParameters params) async {
    return  await authRepositoryImpl.signUpWithEmailPassword(name: params.name, email:
    params.email, password: params.password);
  }
  
}

class UserSignUpParameters {
  final String email;
  final String password;
  final String name;

  UserSignUpParameters(this.email, this.password, this.name);
}