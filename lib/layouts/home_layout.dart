import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:white_paper/layouts/cubit/cubit.dart';
import 'package:white_paper/layouts/cubit/state.dart';

import '../shared/components/components/components.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeCubit cubit = HomeCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              cubit.titles[cubit.currentIndex],
            ),
          ),
          body: cubit.screens[cubit.currentIndex],

          // ConditionalBuilder(
          //   condition: HomeCubit.get(context).model != null,
          //   builder: (context) {
          //     var model = FirebaseAuth.instance.currentUser?.emailVerified;
          //     print(model);

          //     return Column(
          //       children: [
          //         if (!HomeCubit.get(context).model!.isEmailVerified!)
          //           Container(
          //             color: Colors.amber.withOpacity(.6),
          //             child: Padding(
          //               padding: const EdgeInsets.symmetric(
          //                 horizontal: 20.0,
          //               ),
          //               child: Row(
          //                 children: [
          //                   Icon(
          //                     Icons.info_outline,
          //                   ),
          //                   SizedBox(
          //                     width: 15.0,
          //                   ),
          //                   Expanded(
          //                     child: Text(
          //                       'please verify your email',
          //                     ),
          //                   ),
          //                   SizedBox(
          //                     width: 15.0,
          //                   ),
          //                   defaultTextButton(
          //                     function: () {
          //                       FirebaseAuth.instance.currentUser
          //                           ?.sendEmailVerification()
          //                           .then((value) {
          //                         showToast(
          //                           text: 'check your mail',
          //                           state: ToastStates.SUCCESS,
          //                         );
          //                       }).catchError((error) {});
          //                     },
          //                     text: 'send',
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           ),
          //       ],
          //     );
          //   },
          //   fallback: (context) => const Center(child: CircularProgressIndicator()),
          // ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            items: cubit.bottomItems,
            onTap: (index) {
              cubit.changeBottom(index);
            },
          ),
        );
      },
    );
  }
}
