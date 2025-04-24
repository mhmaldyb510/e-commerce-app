class NotificationModel {
  final String title;
  final String image;
  final String time;
  bool isRead;
  NotificationStatus notificationStatus;

  NotificationType? type;

  NotificationModel({
    required this.title,
    required this.image,
    required this.time,
    this.isRead = false,
    this.notificationStatus = NotificationStatus.newTime,
    this.type,
  });
}

enum NotificationType { offer }

enum NotificationStatus { newTime, pastTime }
