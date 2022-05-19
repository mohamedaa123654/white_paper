import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:white_paper/layouts/home_layout.dart';

import '../../shared/components/components/components.dart';
import '../../shared/network/local/cache_helper.dart';
import '../../shared/resources/strings_manager.dart';
import '../register_Screen/register_screen.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class LoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginErrorState) {
            showToast(
              text: state.error,
              state: ToastStates.ERROR,
            );
          }
          if (state is LoginSuccessState) {
            CacheHelper.saveData(key: 'uId', value: state.uId).then((value) {
              // token = state.loginModel?.data!.token;
              navigateAndFinish(
                context,
                const HomeScreen(),
              );
            });
          }
          // if (state is LoginSuccessState) {
          //   if (state.loginModel?.status ?? false) {
          //     print(state.loginModel?.message);
          //     print(state.loginModel?.data!.token);
          //     showToast(
          //       text: state.loginModel?.message ?? 'لم يتم تسجيل الدخول',
          //       state: ToastStates.SUCCESS,
          //     );

          //     CacheHelper.saveData(
          //       key: 'token',
          //       value: state.loginModel?.data!.token,
          //     ).then((value) {
          //       token = state.loginModel?.data!.token;
          //       navigateAndFinish(
          //         context,
          //         const Layout(),
          //       );
          //     });
          //   } else {
          //     print(state.loginModel?.message);

          //     showToast(
          //       text: state.loginModel?.message ?? 'لم يتم تسجيل الدخول',
          //       state: ToastStates.ERROR,
          //     );
          //   }
          // }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.login,
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge
                              ?.copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 32),
                        ),
                        Text(
                          'Login now to communicate with freiends',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(color: Colors.grey, fontSize: 18),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        defaultFormField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return AppStrings.invalidEmail;
                            }
                          },
                          label: AppStrings.emailHint,
                          prefix: Icons.email_outlined,
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        defaultFormField(
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          suffix: LoginCubit.get(context).suffix,
                          onSubmit: (value) {
                            if (formKey.currentState!.validate()) {
                              LoginCubit.get(context).userLogin(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                          isPassword: LoginCubit.get(context).isPassword,
                          suffixPressed: () {
                            LoginCubit.get(context).changePasswordVisibility();
                          },
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return AppStrings.passwordInvalid;
                            }
                          },
                          label: 'Password',
                          prefix: Icons.lock_outline,
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        ConditionalBuilder(
                          condition: state is! LoginLoadingState,
                          builder: (context) => defaultButton(
                            function: () {
                              if (formKey.currentState!.validate()) {
                                LoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              }
                            },
                            text: 'login',
                            isUpperCase: true,
                          ),
                          fallback: (context) =>
                              const Center(child: CircularProgressIndicator()),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              AppStrings.registerText,
                            ),
                            defaultTextButton(
                              function: () {
                                navigateTo(
                                  context,
                                  RegisterScreen(),
                                );
                              },
                              text: 'register',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
