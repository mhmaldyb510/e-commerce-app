import 'package:e_commerce_app/features/account/model/order_status.dart';
import 'package:flutter/material.dart';
import 'package:timelines_plus/timelines_plus.dart';
import 'package:e_commerce_app/core/themes/app_colors.dart';
import 'package:e_commerce_app/core/themes/text_styles.dart';

class OrderTimeline extends StatelessWidget {
  final List<OrderStatus> orderStatuses;

  const OrderTimeline({super.key, required this.orderStatuses});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 20),
      child: FixedTimeline.tileBuilder(
        theme: TimelineThemeData(
          indicatorTheme: const IndicatorThemeData(size: 20.0),
          connectorTheme: ConnectorThemeData(
            thickness: 2.0,
            color: Colors.grey.shade300,
          ),
        ),
        builder: TimelineTileBuilder.connected(
          itemCount: orderStatuses.length,
          contentsAlign: ContentsAlign.alternating,
          connectionDirection: ConnectionDirection.before,
          oppositeContentsBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                orderStatuses[index].date,
                style: TextStyles.bodySmallBold.copyWith(
                  fontWeight: FontWeight.w600,
                  color:
                      orderStatuses[index].isCompleted
                          ? Theme.of(context).hintColor
                          : Colors.grey.shade400,
                ),
              ),
            );
          },
          contentsBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                orderStatuses[index].title,
                style: TextStyles.bodySmallBold.copyWith(
                  fontWeight: FontWeight.w600,
                  color:
                      orderStatuses[index].isCompleted
                          ? Theme.of(context).textTheme.bodyLarge?.color
                          : Colors.grey.shade400,
                ),
              ),
            );
          },
          indicatorBuilder: (context, index) {
            return DotIndicator(
              size: 18,
              color:
                  orderStatuses[index].isCompleted
                      ? AppColors.kPrimaryColor
                      : Colors.grey.shade300,
              child:
                  orderStatuses[index].isCompleted
                      ? const Icon(Icons.check, size: 12, color: Colors.white)
                      : null,
            );
          },
          connectorBuilder: (context, index, type) {
            return SizedBox(
              height: 23,
              child: SolidLineConnector(
                color:
                    orderStatuses[index].isCompleted
                        ? AppColors.kPrimaryColor
                        : Colors.grey.shade300,
              ),
            );
          },
        ),
      ),
    );
  }
}
