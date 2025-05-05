import 'package:e_commerce_app/features/product_details/view/screens/image_fall_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({super.key, required this.productImage});

  final String productImage;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: productImage,
      child: ClipPath(
        clipper: OvalBottomBorderClipper(),
        child: GestureDetector(
          onTap:
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ImageFallScreen(image: productImage),
                ),
              ),
          child: Container(
            height: 376,
            decoration: BoxDecoration(
              color: Theme.of(context).hintColor.withAlpha(50),
              image: DecorationImage(
                image: NetworkImage(productImage),
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
