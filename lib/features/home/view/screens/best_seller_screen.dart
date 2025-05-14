import 'package:e_commerce_app/core/models/product_model.dart';
import 'package:e_commerce_app/core/themes/text_styles.dart';
import 'package:e_commerce_app/core/widgets/custom_app_bar.dart';
import 'package:e_commerce_app/core/widgets/product_card.dart';
import 'package:e_commerce_app/features/home/cubit/home_cubit.dart';
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
        create: (context) => HomeCubit()..getHomeData(),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: RefreshIndicator(
                onRefresh: () async {
                  await context.read<HomeCubit>().getHomeData();
                },
                child: CustomScrollView(
                  physics:
                      state is HomeLoaded
                          ? const AlwaysScrollableScrollPhysics(
                            parent: BouncingScrollPhysics(),
                          )
                          : const NeverScrollableScrollPhysics(),

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
                    state is HomeLoading
                        ? const SliverFillRemaining(
                          hasScrollBody: false,

                          child: Center(child: CircularProgressIndicator()),
                        )
                        : state is HomeError
                        ? SliverFillRemaining(
                          hasScrollBody: false,
                          child: Center(child: Text(state.message)),
                        )
                        : state is HomeLoaded
                        ? SliverGrid.builder(
                          itemCount: context.read<HomeCubit>().products.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 8,
                                crossAxisSpacing: 16,
                                childAspectRatio: 191 / 237,
                              ),

                          itemBuilder:
                              (context, index) => ProductCard(
                                product: ProductModel(
                                  id:
                                      context
                                          .read<HomeCubit>()
                                          .products[index]
                                          .id,
                                  name:
                                      context
                                          .read<HomeCubit>()
                                          .products[index]
                                          .name,
                                  category:
                                      context
                                          .read<HomeCubit>()
                                          .products[index]
                                          .category,
                                  price:
                                      context
                                          .read<HomeCubit>()
                                          .products[index]
                                          .price,
                                  imagePath:
                                      context
                                          .read<HomeCubit>()
                                          .products[index]
                                          .imagePath,
                                  description:
                                      context
                                          .read<HomeCubit>()
                                          .products[index]
                                          .description,
                                  rate:
                                      context
                                          .read<HomeCubit>()
                                          .products[index]
                                          .rate,
                                  ratingsQuantity:
                                      context
                                          .read<HomeCubit>()
                                          .products[index]
                                          .ratingsQuantity,
                                  soldUnits:
                                      context
                                          .read<HomeCubit>()
                                          .products[index]
                                          .soldUnits,
                                  priceAfterDiscount:
                                      context
                                          .read<HomeCubit>()
                                          .products[index]
                                          .priceAfterDiscount,
                                ),
                              ),
                        )
                        : const SliverToBoxAdapter(child: SizedBox.shrink()),

                    const SliverToBoxAdapter(child: SizedBox(height: 100)),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
