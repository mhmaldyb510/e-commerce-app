import 'package:e_commerce_app/features/notifications/model/notification_model.dart';
import 'package:e_commerce_app/features/notifications/view/widgets/notification_tile.dart';
import 'package:flutter/material.dart';

class NotificationList extends StatelessWidget {
  const NotificationList({super.key, required this.notifications});

  final List<NotificationModel> notifications;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          notifications.length < 3 ? notifications.length : 3,
          (index) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              NotificationTile(notificationModel: notifications[index]),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
