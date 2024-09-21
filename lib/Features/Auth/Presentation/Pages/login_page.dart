import 'package:blogging/Core/theme/App_pallete.dart';
import 'package:blogging/Features/Auth/Presentation/Pages/signup_page.dart';
import 'package:blogging/Features/Auth/Presentation/Widgets/auth_field.dart';
import 'package:blogging/Features/Auth/Presentation/Widgets/auth_gradient_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static route() => PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        // Adjust the duration
        pageBuilder: (context, animation, secondaryAnimation) =>
            const LoginPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      );

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle defaultStyle =
        Theme.of(context).textTheme.titleMedium!; //default style
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Sign In.",
                  style: TextStyle(fontSize: 40, color: AppPallete.greyColor),
                ),
                const SizedBox(
                  height: 20,
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
                const AuthGradientButton(textOnButton: "Sign In",),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context, SignupPage.route()//SignupPage.route()
                      //syntax of a factory constructor in Dart,
                      //Equivalent Syntax
                      // The code static route() => PageRouteBuilder() is equivalent to the following:
                      //static route() {
                      //   return PageRouteBuilder();
                      // }
                    );
                  },
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Don't have an account?  ",
                          style: defaultStyle, // Default style
                        ),
                        TextSpan(
                          text: "Sign Up",
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
    );
  }
}
