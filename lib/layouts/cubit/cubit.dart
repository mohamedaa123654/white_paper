import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:white_paper/layouts/cubit/state.dart';

import '../../models/user_model.dart';
import '../../modules/chats/chats_screen.dart';
import '../../modules/feeds/feeds_screen.dart';
import '../../modules/new_post/new_post_screen.dart';
import '../../modules/settings/settings_screen.dart';
import '../../modules/users/users_screen.dart';
import '../../shared/components/constants.dart';
import '../../shared/resources/icon_broken.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<String> titles = ['Home', 'Chats', 'Post', 'Users', 'Setting'];

  List<BottomNavigationBarItem> bottomItems = const [
    BottomNavigationBarItem(
      icon: Icon(
        IconBroken.Home,
      ),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        IconBroken.Chat,
      ),
      label: 'Chats',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        IconBroken.Paper_Upload,
      ),
      label: 'Post',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        IconBroken.Location,
      ),
      label: 'Users',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        IconBroken.Setting,
      ),
      label: 'Settings',
    ),
  ];

  List<Widget> screens = [
    FeedsScreen(),
    ChatsScreen(),
    NewPostScreen(),
    UsersScreen(),
    SettingsScreen(),
  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(HomeChangeBottomNavState());
  }

  UserModel? model;

  void getUserData() {
    emit(HomeGetUserLoadingState());

    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      //print(value.data());
      model = UserModel.fromJson(value.data()!);
      emit(HomeGetUserSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(HomeGetUserErrorState(error.toString()));
    });
  }
}
