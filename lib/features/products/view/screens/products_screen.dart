import 'package:e_commerce_app/core/cubits/modal_bottom_sheet_cubit/modal_bottom_sheet_cubit.dart';
import 'package:e_commerce_app/core/widgets/blurring_widget.dart';
import 'package:e_commerce_app/core/widgets/custom_app_bar.dart';
import 'package:e_commerce_app/core/widgets/custom_search_field.dart';
import 'package:e_commerce_app/core/widgets/most_popular_row.dart';
import 'package:e_commerce_app/core/widgets/product_card.dart';
import 'package:e_commerce_app/features/products/cubit/product_cubit.dart';
import 'package:e_commerce_app/features/products/view/widgets/our_products_part.dart';
import 'package:e_commerce_app/features/products/view/widgets/search_result_part.dart';
import 'package:e_commerce_app/features/search/view/screen/search_screen.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        return Stack(
          children: [
            RefreshIndicator(
              onRefresh: () async {
                await context.read<ProductCubit>().fetchProductsScreen();
              },
              child: Scaffold(
                appBar: PreferredSize(
                  preferredSize: const Size.fromHeight(56),
                  child: CustomAppBar(title: S.of(context).products),
                ),
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: SafeArea(
                          bottom: false,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: CustomSearchField(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) => const SearchScreen(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 24),
                          child:
                              state is ProductFilteredState
                                  ? SearchResultPart(
                                    count: state.products.length,
                                  )
                                  : const OurProductsPart(),
                        ),
                      ),
                      if (state is! ProductFilteredState)
                        const SliverToBoxAdapter(
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 24),
                            child: MostPopularRow(),
                          ),
                        ),
                      if (state is ProductsLoadingState)
                        const SliverToBoxAdapter(
                          child: Center(child: CircularProgressIndicator()),
                        ),
                      if (state is ProductsLoadedState)
                        SliverGrid.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 16,
                                crossAxisSpacing: 16,
                                childAspectRatio: 191 / 237,
                              ),
                          itemBuilder:
                              (context, index) =>
                                  ProductCard(product: state.products[index]),
                          itemCount: 10,
                        ),
                      if (state is ProductFilteredState)
                        SliverGrid.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 16,
                                crossAxisSpacing: 16,
                                childAspectRatio: 191 / 237,
                              ),
                          itemBuilder:
                              (context, index) =>
                                  ProductCard(product: state.products[index]),
                          itemCount: state.products.length,
                        ),
                      const SliverToBoxAdapter(child: SizedBox(height: 100)),
                    ],
                  ),
                ),
              ),
            ),
    
            BlocBuilder<ModalBottomSheetCubit, ModalBottomSheetState>(
              builder: (context, modalState) {
                return context
                        .read<ModalBottomSheetCubit>()
                        .isModalSheetOpened
                    ? const BlurringWidget()
                    : const SizedBox.shrink();
              },
            ),
          ],
        );
      },
    );
  }
}
