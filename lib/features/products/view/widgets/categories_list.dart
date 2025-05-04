import 'package:e_commerce_app/features/products/model/category_model.dart';
import 'package:e_commerce_app/features/products/view/widgets/category_card.dart';
import 'package:flutter/material.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 89,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: categoriesList.length,
        itemBuilder: (context, index) {
          return CategoryCard(categoryModel: categoriesList[index]);
        },
        separatorBuilder: (context, index) => const SizedBox(width: 9),
      ),
    );
  }
}
