//in domain also we was having same interface than why again here same ?
// that was for Domain part here this is for data part, and look at both the methods they are not returning --
// Either<> like Domain interface, it only returns string.
//this interface communicates with external database unlike Domain's auth_repository
import 'package:blogging/Core/error/exceptions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource {
  Future<String> signUpWithEmailPassword(
      //
      {required String email,
      required String name,
      required String password});

  Future<String> loginWithEmailPassword(
      {required String email, required String password});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;

  AuthRemoteDataSourceImpl(
      this.supabaseClient); //why are we taking supabaseclient in constructor
  //why arent we directly initializing it, we are not doing it because, it will
  // --create a dependency of supabase in this AuthRemoteDataSourceImpl,
  //inorder to change the database in future from supabase to firebase, need to change a lot things
  //so avoid direct initialization, instead we use Dependency injection, whenever this class is called --
  //pass the instance of Database (supabse,firebase etc)

  @override
  Future<String> loginWithEmailPassword(
      {required String email, required String password}) {
    // TODO: implement loginWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<String> signUpWithEmailPassword(
      {required String email,
      required String name,
      required String password}) async {
    try{
      //so here i m facing issue how to pass name here, beoz they haven't -
      // -provided any parameter like name,id etc,so inorder to pass name i need to use data:{}

      final response = await supabaseClient.auth.signUp(password: password,email: email,data:{
        'name' : name
      });
      if(response.user == null){
        throw ServerException("User is null");
      }else{}
      return response.user!.id; // we only want to return id, if user is not null
    }catch(exception){
      throw ServerException(exception.toString());
    }
  }
}
