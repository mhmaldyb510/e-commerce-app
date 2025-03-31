import 'package:e_commerce_app/core/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;

  const CustomButton({super.key, this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: Theme.of(context).primaryColor,
        padding: EdgeInsets.all(15),
        textStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          fontFamily: GoogleFonts.cairo().fontFamily,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyles.bodyBaseBold.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
