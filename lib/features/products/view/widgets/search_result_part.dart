import 'package:e_commerce_app/core/themes/text_styles.dart';
import 'package:e_commerce_app/features/products/view/widgets/filter_button.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class SearchResultPart extends StatelessWidget {
  final int count;
  const SearchResultPart({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$count ${S.of(context).results}',
          style: TextStyles.bodyBaseBold.copyWith(
            color: Theme.of(context).textTheme.bodyMedium!.color,
          ),
        ),
        const FilterButton(),
      ],
    );
  }
}
