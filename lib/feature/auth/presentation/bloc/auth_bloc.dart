import 'dart:async';

import 'package:meta/meta.dart';
import 'package:news_app/core/errors/failure.dart';
import 'package:news_app/feature/auth/domain/entities/user_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/feature/auth/domain/usecases/signIn_usecase.dart';
import 'package:news_app/feature/auth/domain/usecases/signup_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBLoc extends Bloc<AuthEvent, AuthState> {
  final SignUpUsecase signUpUsecase;
  final SigninUsecase signinUsecase;

  AuthBLoc({required this.signUpUsecase, required this.signinUsecase})
    : super(AuthInitial()) {
    on<AuthSignUp>(_onsignUp);
    on<AuthLogin>(_onsignIn);
  }

  // Future<void>_onsignup(AuthSignUp event, Emitter<AuthState> emit) async {
  //   emit(AuthLoading());

  //   final res = await signUpUsecase.call(
  //     SignUpParams(
  //       name: event.name,
  //       email: event.email,
  //       password: event.password,
  //     ),
  //   );

  //   res.fold(
  //     (failure) => emit(AuthFailure(failure.message)),
  //     (user) => emit(AuthSuccess(user)),
  //   );
  // }

  Future<void> _onsignUp(AuthSignUp event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    print("signUp called");
    final res = await signUpUsecase.call(
      SignUpParams(
        name: event.name,
        email: event.email,
        password: event.password,
      ),
    );
    res.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (user) => emit(AuthSuccess(user)),
    );
    // res.fold((failure) => emit(AuthFailure(failure.message)), (user) async {
    //   final SharedPreferences _prefs = await SharedPreferences.getInstance();
    //   _prefs.setBool('userlogin', true);
    //   emit(AuthSuccess(user));
    // });
  }

  Future<void> _onsignIn(AuthLogin event, Emitter<AuthState> emit) async {
    print("Signin Called");
    emit(AuthLoading());

    final res = await signinUsecase.call(
      SigninParams(email: event.email, password: event.password),
    );
    res.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (user) => emit(AuthSuccess(user)),
    );
    // res.fold((failure) => emit(AuthFailure(failure.message)), (user) async {
    //   final SharedPreferences _prefs = await SharedPreferences.getInstance();
    //   _prefs.setBool('userlogin', true);
    //   emit(AuthSuccess(user));
    // });
  }
}
