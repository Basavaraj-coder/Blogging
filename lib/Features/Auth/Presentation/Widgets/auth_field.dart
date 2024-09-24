import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final String textHint;
  final TextEditingController controller;
  final bool isObscureText;

  const AuthField(
      {super.key,
      required this.textHint,
      required this.controller,
      this.isObscureText = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          hintText: textHint,
          hintStyle: const TextStyle(
            fontSize: 18.0,
          )
      ),
      obscureText: isObscureText,
      //so inorder to change the decoration, and avoid redundancy of code--
      // add/update input-decoration at theme.dart
      validator: (value) {
        if (value!.isEmpty) {
          return "Please fill $textHint";
        }if (textHint == "Email" && !_validateEmail(value)) {
          return "Please enter a valid email";
        }if(textHint == "Password" && !_validatePassword(value)){
          return "Password should be of More than 10 characters \nand it should contain Caps/Small/special_symbols and number";
        }
        return null;
      },
    );
  }

  bool _validateEmail(String value) {
    final RegExp emailRegex = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$',
    );
    return emailRegex.hasMatch(value);
  }

  bool _validatePassword(String value) {
    final RegExp passwordRegex = RegExp(
      r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{10,}$',
      // At least one letter, one number, one special character, and a minimum length of 8 characters
    );
    return passwordRegex.hasMatch(value);
  }
}
