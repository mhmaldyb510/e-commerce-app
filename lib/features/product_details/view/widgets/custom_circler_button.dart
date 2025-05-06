import 'package:flutter/material.dart';

class CustomCirclerButton extends StatelessWidget {
  const CustomCirclerButton({
    super.key, this.onPressed, required this.icon, required this.backgroundColor, required this.iconColor,
  });

  final void Function()? onPressed;
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon:  Icon(icon, color: iconColor),
      style: IconButton.styleFrom(
        backgroundColor: backgroundColor,
        fixedSize: const Size(32, 32),
      ),
    );
  }
}
