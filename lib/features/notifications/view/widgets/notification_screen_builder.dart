import 'package:e_commerce_app/features/notifications/model/notification_api_semulation.dart';
import 'package:e_commerce_app/features/notifications/model/notification_model.dart';
import 'package:e_commerce_app/features/notifications/view/widgets/notification_body.dart';
import 'package:flutter/material.dart';

class NotificationScreenBuilder extends StatelessWidget {
  const NotificationScreenBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: notificationAPISimulation(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        } else if (snapshot.hasData) {
          List<NotificationModel> notifications =
              snapshot.data as List<NotificationModel>;
          List<NotificationModel> newNotifications =
              notifications
                  .where(
                    (element) =>
                        element.notificationStatus ==
                        NotificationStatus.newTime,
                  )
                  .toList();
          List<NotificationModel> pastNotifications =
              notifications
                  .where(
                    (element) =>
                        element.notificationStatus ==
                        NotificationStatus.pastTime,
                  )
                  .toList();
          return NotificationBody(
            newNotifications: newNotifications,
            pastNotifications: pastNotifications,
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
