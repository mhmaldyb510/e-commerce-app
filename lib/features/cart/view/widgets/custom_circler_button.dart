import 'package:flutter/material.dart';

class CustomCirclerButton extends StatelessWidget {
  final Color? backgroundColor;
  final Widget child;
  final EdgeInsets? padding;
  final VoidCallback? onPressed;
  const CustomCirclerButton({
    super.key,
    this.backgroundColor,
    required this.child,
    this.padding,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      autofocus: true,
      borderRadius: BorderRadius.circular(30),
      onTap: onPressed,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor,
        ),
        child: child,
      ),
    );
  }
}
