import 'package:e_commerce_app/core/themes/text_styles.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class NotificationLabelRow extends StatelessWidget {
  const NotificationLabelRow({
    super.key,
    required this.count,
    required this.label,
    required this.onShowAllPressed,
  });

  final int count;
  final String label;
  final void Function()? onShowAllPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyles.bodyBaseBold.copyWith(
              color: Theme.of(context).textTheme.titleMedium!.color,
            ),
          ),
          const SizedBox(width: 6),
          CircleAvatar(
            backgroundColor: Theme.of(context).hintColor.withAlpha(50),
            radius: 11,
            child: Text(
              count.toString(),
              style: TextStyles.bodySmallBold.copyWith(
                color: Theme.of(context).textTheme.titleMedium!.color,
              ),
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: () {},

            child: Text(
              S.of(context).markAllAsRead,
              style: TextStyles.bodySmallBold.copyWith(
                color: Theme.of(context).hintColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
