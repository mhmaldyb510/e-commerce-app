import 'package:e_commerce_app/features/notifications/model/notification_model.dart';
import 'package:e_commerce_app/features/notifications/view/widgets/notification_label_row.dart';
import 'package:e_commerce_app/features/notifications/view/widgets/notification_list.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class NotificationBody extends StatelessWidget {
  final List<NotificationModel> newNotifications;
  final List<NotificationModel> pastNotifications;
  const NotificationBody({
    super.key,
    required this.newNotifications,
    required this.pastNotifications,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        NotificationLabelRow(
          count: newNotifications.length,
          label: S.of(context).newNotification,
          onShowAllPressed: () {},
        ),
        const SizedBox(height: 16),
        NotificationList(notifications: newNotifications),
        const SizedBox(height: 11),
        NotificationLabelRow(
          count: pastNotifications.length,
          label: S.of(context).inPastTime,
          onShowAllPressed: () {},
        ),
        const SizedBox(height: 16),
        NotificationList(notifications: pastNotifications),
      ],
    );
  }
}
