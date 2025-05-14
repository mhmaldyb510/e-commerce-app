import 'package:e_commerce_app/core/constants/assets.dart';
import 'package:e_commerce_app/core/helpers/storage.dart';
import 'package:e_commerce_app/core/themes/text_styles.dart';
import 'package:e_commerce_app/features/account/view/widgets/animated_text.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class WelcomingPart extends StatefulWidget {
  const WelcomingPart({super.key});

  @override
  State<WelcomingPart> createState() => _WelcomingPartState();
}

class _WelcomingPartState extends State<WelcomingPart> {
  String name = '';

  @override
  void initState() {
    Storage.getUserData().then((value) {
      setState(() {
        name = value['name']!;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 22,
          backgroundImage: AssetImage(Assets.imagesProfileImage),
        ),
        const SizedBox(width: 11),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              S.of(context).goodMorning,
              style: TextStyles.bodyBaseRegular.copyWith(
                color: Theme.of(context).hintColor,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 2),
            if (name != '')
              AnimatedText(
                text: name,
                style: TextStyles.bodyBaseBold.copyWith(
                  color: Theme.of(context).textTheme.bodySmall!.color,
                  fontWeight: FontWeight.w700,
                ),
              ),
            // Text(
            //   name,
            //   style: TextStyles.bodyBaseBold.copyWith(
            //     fontWeight: FontWeight.w700,
            //   ),
            // ),
          ],
        ),
        const Spacer(),
      ],
    );
  }
}
