import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/utils/service_locator.dart';
import 'package:ecommerce_app/core/utils/storage_helper.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/login_response_model.dart';
import '../../data/repo/auth_repo.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepo) : super(AuthInitial());

  final AuthRepo _authRepo;

  void login({required String username, required String password}) async {
    emit(LoadingAuthState());

    final Either<String, LoginResponseModel> res =
        await _authRepo.login(username, password);

    res.fold((error) {
      emit(ErrorAuthState(error));
    }, (right) {
      emit(SuccessAuthState("Login Successfully"));
    });
  }

  void logout() {
    sl<StorageHelper>().removeToken();
  }
}
