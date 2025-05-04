import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/constants/assets.dart';
import 'package:e_commerce_app/core/cubits/modal_buttom_sheet_cubit/modal_bottom_sheet_cubit.dart';
import 'package:e_commerce_app/core/models/product_model.dart';
import 'package:e_commerce_app/core/themes/app_colors.dart';
import 'package:e_commerce_app/core/themes/text_styles.dart';
import 'package:e_commerce_app/core/widgets/blurring_widget.dart';
import 'package:e_commerce_app/core/widgets/custom_search_field.dart';
import 'package:e_commerce_app/core/widgets/most_popular_row.dart';
import 'package:e_commerce_app/core/widgets/product_card.dart';
import 'package:e_commerce_app/features/home/model/ads_images_list.dart';
import 'package:e_commerce_app/features/notifications/view/screens/notification_screen.dart';
import 'package:e_commerce_app/features/search/view/screen/search_screen.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:icons_plus/icons_plus.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 22,
                            backgroundImage: AssetImage(
                              Assets.imagesProfileImage,
                            ),
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
                              Text(
                                'محمد ',
                                style: TextStyles.bodyBaseBold.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => const NotificationScreen(),
                                ),
                              );
                            },
                            style: Theme.of(context).iconButtonTheme.style,
                            icon: const Icon(Iconsax.notification_outline),
                          ),
                        ],
                      ),
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
                SliverToBoxAdapter(
                  child: FutureBuilder(
                    future: fakeData(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<ProductModel> products =
                            snapshot.data as List<ProductModel>;
                        return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 16,
                                crossAxisSpacing: 16,
                                childAspectRatio: 191 / 237,
                              ),
                          itemCount: products.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return ProductCard(
                              product: ProductModel(
                                title: products[index].title,
                                price: products[index].price,
                                image: products[index].image,
                                rating: products[index].rating,
                              ),
                            );
                          },
                        );
                      } else if (snapshot.hasError) {
                        return Text(snapshot.error.toString());
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          //bottomNavigationBar:const BottomNavBar(),
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

//this is just a testing data we will change it once api is ready

fakeData() async {
  Dio dio = Dio();
  try {
    Response response = await dio.get('https://fakestoreapi.com/products');
    List<dynamic> data = response.data as List<dynamic>;
    List<ProductModel> products =
        data.map((e) => ProductModel.fromJson(e)).toList();
    return products;
  } on DioException catch (e) {
    log(e.toString());
    rethrow;
  }
}
