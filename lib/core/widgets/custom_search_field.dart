import 'package:e_commerce_app/core/cubits/modal_bottom_sheet_cubit/modal_bottom_sheet_cubit.dart';
import 'package:e_commerce_app/core/themes/app_colors.dart';
import 'package:e_commerce_app/core/themes/text_styles.dart';
import 'package:e_commerce_app/core/widgets/price_filter_bottom_sheet.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';

class CustomSearchField extends StatelessWidget {
  final void Function()? onTap;

  const CustomSearchField({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextField(
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
        suffixIcon: IconButton(
          onPressed: () {
            BlocProvider.of<ModalBottomSheetCubit>(
              context,
            ).updateModalSheetState(true);
            showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              builder: (BuildContext context) => const PriceFilterBottomSheet(),
            ).whenComplete(() {
              if (context.mounted) {
                BlocProvider.of<ModalBottomSheetCubit>(
                  context,
                ).updateModalSheetState(false);
              }
            });
          },
          style: IconButton.styleFrom(backgroundColor: Colors.transparent),
          icon: const Icon(
            Iconsax.setting_4_outline,
            color: AppColors.kPrimaryColor,
          ),
        ),
        hintText: S.of(context).searchFor,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide.none,
        ),
      ),
      onTap: onTap,
    );
  }
}
