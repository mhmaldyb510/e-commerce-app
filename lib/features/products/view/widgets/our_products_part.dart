import 'package:e_commerce_app/core/themes/text_styles.dart';
import 'package:e_commerce_app/features/products/view/widgets/categories_list.dart';
import 'package:e_commerce_app/features/products/view/widgets/filter_button.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class OurProductsPart extends StatelessWidget {
  const OurProductsPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              S.of(context).ourProducts,
              style: TextStyles.bodyBaseBold.copyWith(
                color: Theme.of(context).textTheme.bodyMedium!.color,
              ),
            ),
            const FilterButton(),
          ],
        ),
        const SizedBox(height: 8),
        const CategoriesList(),
      ],
    );
  }
}
