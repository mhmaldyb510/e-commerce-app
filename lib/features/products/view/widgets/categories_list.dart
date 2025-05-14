import 'package:e_commerce_app/core/models/category_model.dart';
import 'package:e_commerce_app/features/products/cubit/product_cubit.dart';
import 'package:e_commerce_app/features/products/view/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 89,
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductsLoadedState) {
            List<CategoryModel> categoriesList = state.categories;
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: categoriesList.length,
              itemBuilder: (context, index) {
                return CategoryCard(categoryModel: categoriesList[index]);
              },
              separatorBuilder: (context, index) => const SizedBox(width: 9),
            );
          } else if (state is ProductsLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductsErrorState) {
            return Text(state.message);
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
