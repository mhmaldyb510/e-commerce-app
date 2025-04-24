import 'package:e_commerce_app/core/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/core/themes/app_colors.dart';
import 'package:e_commerce_app/features/notifications/model/notification_model.dart';

class NotificationTile extends StatelessWidget {
  final NotificationModel notificationModel;
  const NotificationTile({super.key, required this.notificationModel});

  @override
  Widget build(BuildContext context) {
    String? percentage;

    // Extract percentage using a regular expression
    final regex = RegExp(r'(\d+%)');
    final match = regex.firstMatch(notificationModel.title);
    if (match != null) {
      percentage = match.group(0); // Extract the percentage
    }

    return Stack(
      clipBehavior: Clip.none,
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          tileColor:
              !notificationModel.isRead
                  ? Theme.of(
                    context,
                  ).iconButtonTheme.style?.backgroundColor?.resolve({})
                  : null,
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(notificationModel.image),
          ),
          title:
              notificationModel.type == NotificationType.offer
                  ? RichText(
                    text: TextSpan(
                      text: notificationModel.title.split(percentage!)[0],
                      style: TextStyles.bodySmallBold.copyWith(
                        color: Theme.of(context).textTheme.bodyMedium!.color,
                        fontWeight: FontWeight.w600,
                      ),
                      children: [
                        TextSpan(
                          text: percentage,
                          style: TextStyles.bodyBaseBold.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Colors.red,
                          ),
                        ),
                        TextSpan(
                          text: notificationModel.title.split(percentage)[1],
                        ),
                      ],
                    ),
                  )
                  : Text(notificationModel.title),
          trailing: Text(
            notificationModel.time,
            style: TextStyles.bodySmallRegular.copyWith(
              color: Theme.of(context).hintColor,
            ),
          ),
        ),
        Positioned(
          right: 22,
          top: -4,
          child: Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
                  !notificationModel.isRead
                      ? AppColors.kPrimaryColor
                      : Colors.transparent,
            ),
          ),
        ),
      ],
    );
  }
}
