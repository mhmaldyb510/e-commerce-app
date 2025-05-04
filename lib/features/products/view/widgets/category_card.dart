import 'package:e_commerce_app/core/themes/text_styles.dart';
import 'package:e_commerce_app/features/products/model/category_model.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel categoryModel;
  const CategoryCard({super.key, required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 32,
          backgroundImage: AssetImage(categoryModel.image),
        ),
        const SizedBox(height: 2),
        Text(
          categoryModel.name,
          style: TextStyles.bodySmallBold.copyWith(
            fontWeight: FontWeight.w600,
            color: Theme.of(context).textTheme.bodySmall!.color,
          ),
        ),
      ],
    );
  }
}
