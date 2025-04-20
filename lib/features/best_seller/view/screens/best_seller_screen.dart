import 'package:e_commerce_app/core/themes/text_styles.dart';
import 'package:e_commerce_app/core/widgets/custom_app_bar.dart';
import 'package:e_commerce_app/core/widgets/product_card.dart';
import 'package:e_commerce_app/features/best_seller/cubit/best_seller_cubit.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerScreen extends StatelessWidget {
  const BestSellerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: CustomAppBar(title: S.of(context).bestSellers),
      ),
      body: BlocProvider(
        create: (context) => BestSellerCubit()..getProducts(),
        child: BlocBuilder<BestSellerCubit, BestSellerState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 24, bottom: 8),
                      child: Text(
                        S.of(context).bestSellers,
                        style: TextStyles.bodyBaseBold.copyWith(
                          color: Theme.of(context).textTheme.bodyLarge?.color,
                        ),
                      ),
                    ),
                  ),
                  state is BestSellerLoading
                      ? const SliverToBoxAdapter(
                        child: Center(child: CircularProgressIndicator()),
                      )
                      : state is BestSellerError
                      ? SliverToBoxAdapter(
                        child: Center(child: Text(state.message)),
                      )
                      : state is BestSellerSuccess
                      ? SliverGrid.builder(
                        itemCount: state.products.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 16,
                              childAspectRatio: 191 / 237,
                            ),

                        itemBuilder:
                            (context, index) => ProductCard(
                              name: state.products[index].title,
                              price: state.products[index].price,
                              imagePath: state.products[index].image,
                              rate: state.products[index].rating,
                            ),
                      )
                      : const SliverToBoxAdapter(child: SizedBox.shrink()),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
