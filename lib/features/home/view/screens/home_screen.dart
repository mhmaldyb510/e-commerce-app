import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/constants/assets.dart';
import 'package:e_commerce_app/core/themes/app_colors.dart';
import 'package:e_commerce_app/core/themes/text_styles.dart';
import 'package:e_commerce_app/core/widgets/product_card.dart';
import 'package:e_commerce_app/features/home/model/ads_images_list.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:icons_plus/icons_plus.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        backgroundImage: AssetImage(Assets.imagesProfileImage),
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
                            'محمد ناصر',
                            style: TextStyles.bodyBaseBold.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
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
                child: TextField(
                  readOnly: true,
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },
                  decoration: InputDecoration(
                    hintStyle: TextStyles.bodySmallRegular.copyWith(
                      color: Theme.of(context).hintColor,
                    ),
                    prefixIcon: const Icon(
                      Iconsax.search_normal_outline,
                      color: AppColors.kPrimaryColor,
                    ),
                    suffixIcon: const Icon(
                      Iconsax.setting_4_outline,
                      color: AppColors.kPrimaryColor,
                    ),
                    hintText: S.of(context).searchFor,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onTap: () {
                    //Todo: add search screen Navigation
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
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      S.of(context).mostPopular,
                      style: TextStyles.bodyBaseBold,
                    ),
                    Text(
                      S.of(context).more,

                      style: TextStyles.bodySmallRegular.copyWith(
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: FutureBuilder(
                future: fakeData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Product> products = snapshot.data as List<Product>;
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
                          name: products[index].title,
                          price: products[index].price,
                          imagePath: products[index].image,
                          rate: products[index].rating,
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
    );
  }
}

//this is just a testing data we will change it once api is ready

class Product {
  final String title;
  final String price;
  final String image;
  final String rating;

  Product({
    required this.title,
    required this.price,
    required this.image,
    required this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      title: json['title'],
      price: json['price'].toString(),
      image: json['image'],
      rating: json['rating']['rate'].toString(),
    );
  }
}

fakeData() async {
  Dio dio = Dio();
  Response response = await dio.get('https://fakestoreapi.com/products');
  List<dynamic> data = response.data as List<dynamic>;
  List<Product> products = data.map((e) => Product.fromJson(e)).toList();
  return products;
}
 