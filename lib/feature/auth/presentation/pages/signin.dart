import 'package:flutter/material.dart';
import 'package:news_app/core/config/app_images.dart';
import 'package:news_app/core/config/app_snackbar.dart';
import 'package:news_app/core/config/app_textstyles.dart';
import 'package:news_app/core/utils/media_query_helper.dart';
import 'package:news_app/core/utils/validators.dart';
import 'package:news_app/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:news_app/feature/auth/presentation/pages/signup.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/feature/auth/presentation/widgets/loader.dart';
import 'package:news_app/feature/news/presentation/pages/news_screen.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isobsecure = true;
  @override
  Widget build(BuildContext context) {
    final mq = MediaQueryHelper(context);
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            child: Image.asset(
              AppImages.signin,
              height: mq.screenHeight,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 45,
            left: 0,
            right: 0,
            child: Form(
              key: formkey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: BlocConsumer<AuthBLoc, AuthState>(
                  listener: (context, state) {
                    if (state is AuthSuccess) {
                      AppSnackbar.show(
                        context: context,
                        message: 'Signin successful!',
                        backgroundColor: Colors.green,
                      );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => NewsScreen()),
                      );
                    } else if (state is AuthFailure) {
                      AppSnackbar.show(
                        context: context,
                        message: state.message,
                        backgroundColor: Colors.red,
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is AuthLoading) {
                      return Loader();
                    }

                    return Column(
                      children: [
                        Text("SignIn", style: AppTextstyles.signup_style),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: emailController,
                          validator: Validators.validateEmail,
                          style: TextStyle(
                            fontSize: 20, // Typing character size
                            color: const Color.fromARGB(
                              255,
                              194,
                              4,
                              4,
                            ), // Typing character color
                            fontWeight: FontWeight.w500,
                          ),
                          decoration: InputDecoration(
                            hintText: "Email",
                            fillColor: const Color(0xFFC5CBC9),
                            filled: true,
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: passwordController,
                          validator: Validators.validatePassword,
                          obscureText: isobsecure,
                          style: TextStyle(
                            fontSize: 20, // Typing character size
                            color: const Color.fromARGB(255, 194, 4, 4),
                            fontWeight: FontWeight.w500,
                          ),
                          decoration: InputDecoration(
                            hintText: "Password",
                            fillColor: const Color(0xFFC5CBC9),
                            filled: true,
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isobsecure = !isobsecure;
                                });
                              },
                              icon: Icon(
                                isobsecure
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),

                        ElevatedButton(
                          onPressed: () {
                            if (formkey.currentState?.validate() ?? false) {
                              print("validate successful");
                              context.read<AuthBLoc>().add(
                                AuthLogin(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                ),
                              );
                            }
                          },
                          child: Text("SignIn"),
                        ),

                        SizedBox(height: 10),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't you have an account ",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 5),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => SignupPage(),
                                  ),
                                );
                              },
                              child: Text(
                                "Signup ",
                                style: TextStyle(
                                  color: const Color.fromARGB(255, 223, 14, 14),
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
