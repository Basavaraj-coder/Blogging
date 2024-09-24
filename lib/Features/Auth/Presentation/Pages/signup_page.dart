import 'package:blogging/Core/theme/App_pallete.dart';
import 'package:blogging/Features/Auth/Presentation/Pages/login_page.dart';
import 'package:blogging/Features/Auth/Presentation/Widgets/auth_field.dart';
import 'package:blogging/Features/Auth/Presentation/Widgets/auth_gradient_button.dart';
import 'package:blogging/Features/Auth/Presentation/bloc/auth_bloc.dart';
import 'package:blogging/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupPage extends StatefulWidget {
  static route() => PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        // Adjust the duration
        pageBuilder: (context, animation, secondaryAnimation) =>
            const SignupPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      );

  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle defaultStyle =
        Theme.of(context).textTheme.titleMedium!; //default style
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Sign Up.",
                    style: TextStyle(fontSize: 30, color: AppPallete.greyColor),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AuthField(
                    textHint: "Name",
                    controller: nameController,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  AuthField(textHint: "Email", controller: emailController),
                  const SizedBox(
                    height: 15,
                  ),
                  AuthField(
                    textHint: "Password",
                    controller: passwordController,
                    isObscureText: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AuthGradientButton(
                    textOnButton: "Sign Up",
                    onPressed: () {
                      if (_formKey.currentState != null &&
                          _formKey.currentState!.validate()) {
                        //adding event to bloc
                        context.read<AuthBloc>().add(AuthSignUp(
                            emailController.text.trim(),
                            nameController.text.trim(),
                            passwordController.text.trim()));
                      }
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context, LoginPage.route()); //LoginPage.route()
                      //syntax of a factory constructor in Dart,
                      //Equivalent Syntax
                      // The code static route() => PageRouteBuilder() is equivalent to the following:
                      //static route() {
                      //   return PageRouteBuilder();
                      // }
                    },
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Already have an account?  ",
                            style: defaultStyle, // Default style
                          ),
                          TextSpan(
                            text: "Sign In",
                            style: defaultStyle.copyWith(
                                // add some additional color to text
                                color: AppPallete.gradient2,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
