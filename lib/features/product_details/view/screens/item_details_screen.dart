import 'package:e_commerce_app/core/models/product_model.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:e_commerce_app/features/checkout/view/screens/checkout_screen.dart';
import 'package:e_commerce_app/features/product_details/view/widgets/product_details_section.dart';
import 'package:e_commerce_app/features/product_details/view/widgets/product_image.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class ItemDetailsScreen extends StatelessWidget {
  final ProductModel product;
  const ItemDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [
              ProductImage(productImage: product.imagePath),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ProductDetailsSection(product: product),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: CustomButton(
                  text: S.of(context).addToCart,
                  onPressed:
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => CheckoutScreen(products: [product]),
                        ),
                      ),
                ),
              ),
              const SizedBox(height: 70),
            ],
          ),
          Positioned(
            right: 16,
            top: 16,
            child: SafeArea(
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: IconButton.styleFrom(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  foregroundColor:
                      Theme.of(context).textTheme.bodyMedium!.color,
                ),
                icon: const Icon(Icons.arrow_back_ios),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
