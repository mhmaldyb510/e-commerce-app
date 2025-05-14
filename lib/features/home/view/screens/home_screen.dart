import 'package:e_commerce_app/core/cubits/modal_bottom_sheet_cubit/modal_bottom_sheet_cubit.dart';
import 'package:e_commerce_app/core/models/product_model.dart';
import 'package:e_commerce_app/core/themes/app_colors.dart';
import 'package:e_commerce_app/core/widgets/blurring_widget.dart';
import 'package:e_commerce_app/core/widgets/custom_search_field.dart';
import 'package:e_commerce_app/core/widgets/most_popular_row.dart';
import 'package:e_commerce_app/core/widgets/product_card.dart';
import 'package:e_commerce_app/features/home/cubit/home_cubit.dart';
import 'package:e_commerce_app/features/home/model/ads_images_list.dart';
import 'package:e_commerce_app/features/home/view/widgets/welcoming_part.dart';
import 'package:e_commerce_app/features/search/view/screen/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocProvider(
          create: (context) => HomeCubit()..getHomeData(limit: 10),
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return Scaffold(
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: RefreshIndicator(
                    onRefresh: () async {
                      await context.read<HomeCubit>().getHomeData(limit: 10);
                    },
                    child: CustomScrollView(
                      slivers: [
                        const SliverToBoxAdapter(
                          child: SafeArea(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 16),
                              child: WelcomingPart(),
                            ),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: CustomSearchField(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SearchScreen(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: ImageSlideshow(
                              autoPlayInterval: 5000,
                              isLoop: true,
                              indicatorColor: AppColors.kPrimaryColor,
                              indicatorRadius: 5,

                              children: List.generate(
                                adsImagesList.length,
                                (index) => Image.asset(adsImagesList[index]),
                              ),
                            ),
                          ),
                        ),
                        const SliverToBoxAdapter(
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 8),
                            child: MostPopularRow(),
                          ),
                        ),
                        if (state is HomeLoading)
                          const SliverToBoxAdapter(
                            child: Center(child: CircularProgressIndicator()),
                          ),
                        if (state is HomeLoaded)
                          SliverGrid.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 16,
                                  crossAxisSpacing: 16,
                                  childAspectRatio: 191 / 237,
                                ),
                            itemCount:
                                context.read<HomeCubit>().products.length,
                            itemBuilder: (context, index) {
                              return ProductCard(
                                product: ProductModel(
                                  name:
                                      context
                                          .read<HomeCubit>()
                                          .products[index]
                                          .name,
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
                                  id:
                                      context
                                          .read<HomeCubit>()
                                          .products[index]
                                          .id,
                                  category:
                                      context
                                          .read<HomeCubit>()
                                          .products[index]
                                          .category,
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

                                  description:
                                      context
                                          .read<HomeCubit>()
                                          .products[index]
                                          .description,
                                ),
                              );
                            },
                          ),
                        if (state is HomeError)
                          SliverToBoxAdapter(
                            child: Center(child: Text(state.message)),
                          ),

                        const SliverToBoxAdapter(child: SizedBox(height: 100)),
                      ],
                    ),
                  ),
                ),
              );
              //bottomNavigationBar:const BottomNavBar(),
            },
          ),
        ),
        BlocBuilder<ModalBottomSheetCubit, ModalBottomSheetState>(
          builder: (context, modalState) {
            return context.read<ModalBottomSheetCubit>().isModalSheetOpened
                ? const BlurringWidget()
                : const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
