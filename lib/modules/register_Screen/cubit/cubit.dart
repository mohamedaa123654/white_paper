import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:white_paper/models/user_model.dart';
import 'package:white_paper/modules/register_Screen/cubit/states.dart';
// import 'package:_app/modules/register_Screen/cubit/states.dart';

import '../../../models/login_model.dart';
import '../../../shared/network/remote/dio_helper.dart';
import '../../../shared/resources/strings_manager.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  LoginModel? loginModel;

  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) {
    emit(RegisterLoadingState());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      userCreate(
        uId: value.user!.uid,
        phone: phone,
        email: email,
        name: name,
      );
    }).catchError((onError) {
      emit(RegisterErrorState(onError.toString()));
    });
  }

  void userCreate({
    required String name,
    required String email,
    required String phone,
    required String uId,
  }) {
    UserModel model = UserModel(
        name: name,
        email: email,
        phone: phone,
        uId: uId,
        isEmailVerified: false);

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(CreateUserSuccessState());
    }).catchError((onError) {
      print('XXXXXXXXXXXXXXXXXXXXXXXXXX' + onError.toString());
      emit(CreateUserErrorState(onError.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(RegisterChangePasswordVisibilityState());
  }
}
