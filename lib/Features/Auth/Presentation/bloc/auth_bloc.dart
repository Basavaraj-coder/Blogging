import 'package:blogging/Features/Auth/Domain/usecase/user_sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignup _userSignup;

  // _userSignup = userSignup, this is called as initializer List
  AuthBloc({required UserSignup userSignup})
      : _userSignup = userSignup,
        super(AuthInitial()) {
    on<AuthSignUp>((event, emit) async {
      final response = await _userSignup(UserSignUpParameters(
          event.email, event.password, event.name)); //calling
      //l for failure r for success
      response.fold((l)=> emit(AuthFailure(errorMessage:l.error)),(r)=>emit(AuthSuccess(r)));

    });
  }
}
