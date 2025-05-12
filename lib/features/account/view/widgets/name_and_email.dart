import 'package:e_commerce_app/core/themes/text_styles.dart';
import 'package:e_commerce_app/features/account/view/widgets/animated_text.dart';
import 'package:flutter/material.dart';

class NameAndEmail extends StatelessWidget {
  const NameAndEmail({super.key, required this.name, required this.email});

  final String name;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (name != '')
          AnimatedText(
            text: name,
            style: TextStyles.bodySmallBold.copyWith(
              color: Theme.of(context).textTheme.bodySmall!.color?.withBlue(20),
            ),
          ),
        if (email != '')
          AnimatedText(
            text: email,
            style: TextStyles.bodyBaseRegular.copyWith(
              color: Theme.of(context).hintColor,
            ),
          ),
      ],
    );
  }
}
