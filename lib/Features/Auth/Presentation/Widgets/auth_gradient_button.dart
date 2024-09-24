import 'package:blogging/Core/theme/App_pallete.dart';
import 'package:flutter/material.dart';

class AuthGradientButton extends StatelessWidget {
  final textOnButton;
  // final GlobalKey formkey;
  final VoidCallback onPressed;

  const AuthGradientButton({super.key, required this.textOnButton, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      //this container i have wrapped becos of gradiant,
      // elevated button don't allow for gradiant
      // to use gradiant need to wrap with container
      decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [
        AppPallete.gradient1,
        AppPallete.gradient2,
        AppPallete.gradient3
      ],
            begin: Alignment.bottomLeft,
            end: Alignment.bottomRight,
          ),
        borderRadius: BorderRadius.circular(10),
      ), //for gradiant,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          //elevated button color
          //increase the height and width
          fixedSize: const Size(double.maxFinite, 55), //size of the button,
          backgroundColor: AppPallete.transparentColor,
          shadowColor: AppPallete.transparentColor
        ),
        child: Text(
          textOnButton,
          style: TextStyle(
            color: AppPallete.whiteColor,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
