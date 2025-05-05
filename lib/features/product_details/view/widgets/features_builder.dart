import 'package:e_commerce_app/features/product_details/model/feature_model.dart';
import 'package:e_commerce_app/features/product_details/view/widgets/feature_card.dart';
import 'package:flutter/material.dart';

class FeaturesBuilder extends StatelessWidget {
  const FeaturesBuilder({super.key, required this.features});

  final List<FeatureModel> features;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 163 / 80,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemBuilder:
          (context, index) => FeatureCard(
            icon: features[index].icon,
            title: features[index].title,
            value: features[index].value,
          ),
      itemCount: features.length,
    );
  }
}
