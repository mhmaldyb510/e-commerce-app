import 'package:e_commerce_app/core/cubits/modal_bottom_sheet_cubit/modal_bottom_sheet_cubit.dart';
import 'package:e_commerce_app/core/themes/app_colors.dart';
import 'package:e_commerce_app/features/products/view/widgets/sorting_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
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
          builder: (context) => const SortingBottomSheet(),
        ).whenComplete(() {
          if (context.mounted) {
            BlocProvider.of<ModalBottomSheetCubit>(
              context,
            ).updateModalSheetState(false);
          }
        });
      },
      style: IconButton.styleFrom(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        side: BorderSide(
          color: AppColors.grayscale400.withAlpha(102),
          width: 1,
        ),
        fixedSize: const Size(44, 31),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
      ),
      icon: const Icon(
        Iconsax.arrow_swap_outline,
        color: AppColors.grayscale400,
        size: 20,
      ),
    );
  }
}
