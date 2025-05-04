import 'package:e_commerce_app/core/themes/text_styles.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:e_commerce_app/features/products/model/sort_enum.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class SortingBottomSheet extends StatefulWidget {
  final SortEnum? chosenSort;
  const SortingBottomSheet({super.key, this.chosenSort});

  @override
  State<SortingBottomSheet> createState() => _SortingBottomSheetState();
}

class _SortingBottomSheetState extends State<SortingBottomSheet> {
  late SortEnum sort;

  @override
  void initState() {
    sort = widget.chosenSort ?? SortEnum.alphabetically;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 18),
          Divider(
            color: const Color(0xff131F46),
            thickness: 3,
            indent: MediaQuery.of(context).size.width / 2 - 60,
            endIndent: MediaQuery.of(context).size.width / 2 - 60,
          ),
          const SizedBox(height: 7),
          Text(
            S.of(context).sortBy,
            style: TextStyles.bodyLargeBold.copyWith(
              color: Theme.of(context).textTheme.bodyMedium!.color,
            ),
          ),
          const SizedBox(height: 11),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),

            itemCount: SortEnum.values.length,
            itemBuilder: (context, index) {
              List<String> filters = [
                S.of(context).priseLowToHigh,
                S.of(context).priseHighToLow,
                S.of(context).alphabetically,
              ];

              return RadioListTile<SortEnum>(
                value: SortEnum.values[index],
                groupValue: sort,
                onChanged: (value) {
                  setState(() {
                    sort = value!;
                  });
                },
                title: Text(
                  filters[index],
                  style: TextStyles.bodySmallBold.copyWith(
                    color: Theme.of(context).textTheme.bodySmall!.color,
                  ),
                ),
              );
            },
          ),
          CustomButton(
            text: S.of(context).filter,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
