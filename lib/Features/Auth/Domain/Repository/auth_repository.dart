//domain is independent from ui and data part, now matter how there implemented,
// --Ui may change and Data may change but hardly Domain changes it is nothing but business logic

//we need interface why we need ? = becoz it forces class to implement its methods
import 'package:blogging/Core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  //here will define two methods initially signUpwithUserAndPassword and loginWithUserAndPassword
  //return type would be success or failure

  // iwill create separate class for failure and success so that i get status code,
  Future<Either<Failure, String>> signUpWithEmailPassword( //for signUp
      {required String name, required String email, required String password});

  Future<Either<Failure, String>> loginInWithEmailPassword( //for login
      {required String email, required String password});

  //now thats our entire interface of AuthRepository class
}
