import 'package:e_commerce_app/features/notifications/model/notification_model.dart';

notificationAPISimulation() async {
  await Future.delayed(const Duration(seconds: 2));
  return [
    NotificationModel(
      title: 'خصم 50% علي اسعار الفواكه بمناسبه العيد',
      image:
          'https://images.unsplash.com/photo-1512436991641-6745cdb1723f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
      notificationStatus: NotificationStatus.newTime,
      time: '12:00',
      type: NotificationType.offer,
      isRead: true,
    ),
    NotificationModel(
      title: 'خصم 30% على الملابس الشتوية',
      image:
          'https://images.unsplash.com/photo-1512436991641-6745cdb1723f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
      notificationStatus: NotificationStatus.newTime,
      time: '14:30',
      type: NotificationType.offer,
      isRead: false,
    ),
    NotificationModel(
      title: 'خصم 70% على الإلكترونيات',
      image:
          'https://images.unsplash.com/photo-1518770660439-4636190af475?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
      notificationStatus: NotificationStatus.newTime,
      time: '16:00',
      type: NotificationType.offer,
      isRead: false,
    ),
    NotificationModel(
      title: 'انتهى عرض خصم 50% على الفواكه الموسمية',
      image:
          'https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
      notificationStatus: NotificationStatus.pastTime,
      time: '10:00',
      type: NotificationType.offer,
      isRead: true,
    ),
    NotificationModel(
      title: 'انتهى عرض خصم 30% على الملابس الشتوية',
      image:
          'https://images.unsplash.com/photo-1512436991641-6745cdb1723f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
      notificationStatus: NotificationStatus.pastTime,
      time: '11:30',
      type: NotificationType.offer,
      isRead: false,
    ),
    NotificationModel(
      title: 'انتهى عرض خصم 70% على الإلكترونيات',
      image:
          'https://images.unsplash.com/photo-1518770660439-4636190af475?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
      notificationStatus: NotificationStatus.pastTime,
      time: '13:00',
      type: NotificationType.offer,
      isRead: false,
    ),
  ];
}
