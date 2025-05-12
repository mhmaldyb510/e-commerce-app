import 'package:e_commerce_app/features/account/model/navigation_option.dart';
import 'package:e_commerce_app/features/account/model/option_model.dart';
import 'package:e_commerce_app/features/account/model/switch_option.dart';
import 'package:e_commerce_app/features/account/view/screens/my_orders_screen.dart';
import 'package:e_commerce_app/features/account/view/screens/profile_screen.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

List<OptionModel> optionsList = [
  NavigationOption(
    title: S.current.profile,
    icon: Iconsax.user_outline,
    route: const ProfileScreen(),
  ),
  NavigationOption(
    title: S.current.myOrders,
    icon: Iconsax.box_outline,
    route: const MyOrdersScreen(),
  ),
  NavigationOption(
    title: S.current.payments,
    icon: Iconsax.wallet_outline,
    route: const Text('payments'),
  ),
  NavigationOption(
    title: S.current.favorites,
    icon: Iconsax.heart_outline,
    route: const Text('favorites'),
  ),
  SwitchOption(
    title: S.current.notifications,
    icon: Iconsax.notification_outline,
    value: false,
  ),
  NavigationOption(
    title: S.current.language,
    icon: Iconsax.global_outline,
    route: const Text('language'),
  ),
  SwitchOption(
    title: S.current.theme,
    icon: Iconsax.magicpen_outline,
    value: false,
  ),
];
