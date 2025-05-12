import 'package:e_commerce_app/core/constants/assets.dart';
import 'package:e_commerce_app/core/themes/app_colors.dart';
import 'package:e_commerce_app/core/themes/text_styles.dart';
import 'package:e_commerce_app/core/widgets/custom_app_bar.dart';
import 'package:e_commerce_app/features/account/model/order_status.dart';
import 'package:e_commerce_app/features/account/view/widgets/time_line.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: CustomAppBar(title: S.of(context).myOrders),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            const SizedBox(height: 16),
            ExpansionTile(
              leading: CircleAvatar(
                radius: 33,
                backgroundColor: Theme.of(
                  context,
                ).scaffoldBackgroundColor.withValues(green: 10, blue: 10),
                foregroundColor: AppColors.kPrimaryColor,
                child: SvgPicture.asset(Assets.iconsBox),
              ),
              title: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${S.of(context).orderNumber} #1234',
                    style: TextStyles.bodySmallBold,
                  ),
                  Text(
                    '${S.of(context).orderDone} :${DateFormat.yMMMd().format(DateTime.now())}',
                    style: TextStyles.bodyXSmallRegular.copyWith(
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '${S.of(context).orderCount} : ',
                        style: TextStyles.bodySmallRegular.copyWith(
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      Text('3', style: TextStyles.bodySmallBold),
                      const SizedBox(width: 15),
                      Text(
                        '250 ${S.of(context).egyptianPound}',
                        style: TextStyles.bodySmallRegular.copyWith(
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      Text('200\$', style: TextStyles.bodySmallBold),
                    ],
                  ),
                ],
              ),
              children: [
                OrderTimeline(
                  orderStatuses: [
                    OrderStatus(
                      title: S.of(context).orderTrack,
                      date: '22 مارس, 2024',
                      isCompleted: true,
                    ),
                    OrderStatus(
                      title: S.of(context).orderAccepted,
                      date: '22 مارس, 2024',
                      isCompleted: true,
                    ),
                    OrderStatus(
                      title: S.of(context).orderShipped,
                      date: '22 مارس, 2024',
                      isCompleted: true,
                    ),
                    OrderStatus(
                      title: S.of(context).outForDelivery,
                      date: '',
                      isCompleted: false,
                    ),
                    OrderStatus(
                      title: S.of(context).delivered,
                      date: '',
                      isCompleted: false,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
