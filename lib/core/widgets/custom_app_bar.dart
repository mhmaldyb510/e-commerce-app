import 'package:e_commerce_app/core/themes/text_styles.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading:
          Navigator.canPop(context)
              ? IconButton(
                style: IconButton.styleFrom(
                  padding: const EdgeInsets.all(8),
                  iconSize: 22,
                  fixedSize: const Size(44, 44),
                  side: const BorderSide(color: Color(0xffF1F1F5)),
                ),
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
                icon: const Icon(Icons.arrow_back_ios),
              )
              : null,
      centerTitle: true,
      title: Text(title, style: TextStyles.bodyLargeBold),
    );
  }
}
