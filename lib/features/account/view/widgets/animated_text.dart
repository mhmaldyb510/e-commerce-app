import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class AnimatedText extends StatelessWidget {
  const AnimatedText({super.key, required this.text, this.style});

  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: style ?? Theme.of(context).textTheme.bodySmall!,
      child: AnimatedTextKit(
        animatedTexts: [
          TypewriterAnimatedText(
            text,
            speed: const Duration(milliseconds: 100),
            textStyle: style ?? Theme.of(context).textTheme.bodySmall!,
          ),
        ],
        isRepeatingAnimation: false,
      ),
    );
  }
}
