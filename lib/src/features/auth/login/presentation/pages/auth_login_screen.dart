import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/src/features/auth/login/presentation/bloc/auth_bloc.dart';
import 'package:task/src/features/auth/login/presentation/bloc/auth_event.dart';
import 'package:task/src/features/auth/login/presentation/bloc/auth_state.dart';
import 'package:task/src/features/products/presentation/view/products_page.dart';
import 'package:task/src/utils/colors/app_colors.dart';
import 'package:task/src/utils/common/widgets/custom_button_widget.dart';
import 'package:task/src/utils/common/widgets/space_widget.dart';
import 'package:task/src/utils/common/widgets/text_field_widget.dart';
import 'package:task/src/utils/constant/constant.dart';
import 'package:task/src/utils/style/text_style.dart';
import 'package:task/src/utils/validator/validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final _formkey = GlobalKey<FormState>();
  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();

    Future.delayed(const Duration(seconds: 1), () async {
      final SharedPreferences prefs = await shared_preferences;
      final data = prefs.getString("token");
      if (data != null) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => ProductListPage()),
            (route) => false);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
          child: BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              } else if (state is AuthLoaded) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => ProductListPage()),
                    (route) => false);
              }
            },
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const VerticalSpace(height: 50.0),
                const Text(
                  'Sign In',
                  style: pageHeaderTextStyle,
                ),
                const VerticalSpace(height: 30.0),
                Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        CustomTextFieldWidget(
                            validator: (value) {
                              return validateEmail(value ?? "");
                            },
                            controller: emailController,
                            iconData: Icons.email_outlined,
                            labelText: "Email Address"),
                        const VerticalSpace(height: 20.0),
                        CustomTextFieldWidget(
                            validator: (value) {
                              return validatePassword(value ?? "");
                            },
                            controller: passwordController,
                            iconData: Icons.lock_outline,
                            labelText: "Password"),
                      ],
                    )),
                const VerticalSpace(height: 20.0),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forgot password?",
                    style: TextStyle(
                        color: AppColors.textGrayColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 17),
                  ),
                ),
                const VerticalSpace(height: 20.0),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    if (state is AuthLoading) {
                      return const CircularProgressIndicator();
                    }
                    return CustomButton(
                      txt: 'Sign In',
                      ontap: () {
                        if (_formkey.currentState!.validate()) {
                          BlocProvider.of<AuthBloc>(context).add(LoginEvent(
                            email: emailController.text,
                            password: passwordController.text,
                          ));
                        }
                      },
                    );
                  },
                ),
                const VerticalSpace(height: 40.0),
                const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Haven’t any account?", style: haveAccountTextStyle),
                      HorizontalSpace(width: 10),
                      Text("Create Account", style: redColorSignInTextStyle)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
