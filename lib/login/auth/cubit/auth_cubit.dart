import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ujikom/login/auth/models/login_request.dart';
import 'package:ujikom/login/auth/models/login_response.dart';
import 'package:ujikom/login/auth/repository/auth_repository.dart';
import 'package:ujikom/login/auth/constants/constants.dart' as constants;

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final AuthRepository _authRepository = AuthRepository();

  void signInUser(LoginRequest loginRequest) async {
    emit(AuthLoading());

    try {
      // ignore: no_leading_underscores_for_local_identifiers
      final _data = await _authRepository.signInUserWithEmailAndPassword(
          loginRequest: loginRequest);

      _data.fold(
        (l) => emit(AuthError(l)),
        (r) => emit(AuthLoginSuccess(r)),
      );
    }
    // e berarti data mentah yang akan kita dapat nanti
    catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  void saveUserToLocal(LoginResponse data) async {
    emit(AuthLoading());

    try {
      // final _data =
      // await GetStorage().write(constants.USER_LOCAL_KEY, data.toJson());
      await GetStorage().write(constants.USER_LOCAL_KEY, jsonEncode(data));
      emit(AuthSuccess());
    } catch (e) {
      // Jika Masuk Kesini berarti ada yg salah
      emit(AuthError(e.toString()));
    }
  }

  void LoadUserFromLocal() async {
    emit(AuthLoading());

    try {
      // final _data =
      // await GetStorage().write(constants.USER_LOCAL_KEY, data.toJson());
      final _data = await GetStorage().read(constants.USER_LOCAL_KEY);
      final _result = LoginResponse.fromJson(jsonDecode(_data));
      emit(AuthLoginSuccess(_result));
    } catch (e) {
      // Jika Masuk Kesini berarti ada yg salah
      emit(AuthError(e.toString()));
    }
  }
}
