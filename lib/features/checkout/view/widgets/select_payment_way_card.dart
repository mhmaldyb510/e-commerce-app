import 'package:e_commerce_app/core/themes/app_colors.dart';
import 'package:e_commerce_app/core/themes/text_styles.dart';
import 'package:e_commerce_app/features/checkout/model/how_to_pay_enum.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class SelectPaymentWayCard extends StatelessWidget {
  final String title;
  final String details;
  final int fees;
  final HowToPayEnum value;
  final HowToPayEnum? groupValue;
  final void Function(HowToPayEnum?)? onChanged;
  const SelectPaymentWayCard({
    super.key,
    required this.title,
    required this.details,
    required this.fees,
    required this.value,
    this.groupValue,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border:
            value == groupValue
                ? Border.all(color: AppColors.green1_500)
                : null,
      ),
      child: RadioListTile<HowToPayEnum>(
        activeColor: Theme.of(context).primaryColor,
        value: value,
        groupValue: groupValue,
        onChanged: (value) {
          if (onChanged != null) {
            onChanged!(value);
          }
        },
        tileColor: Theme.of(
          context,
        ).iconButtonTheme.style?.backgroundColor?.resolve({}),
        title: Text(
          title,
          style: TextStyles.bodySmallBold.copyWith(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          details,
          style: TextStyles.bodySmallRegular.copyWith(
            color: Theme.of(context).hintColor,
          ),
        ),
        secondary: Text(
          fees != 0
              ? '$fees ${S.of(context).egyptianPound}'
              : S.of(context).free,
          style: TextStyles.bodySmallBold.copyWith(
            color: AppColors.kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
