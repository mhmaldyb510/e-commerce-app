import 'package:e_commerce_app/core/helpers/storage.dart';
import 'package:e_commerce_app/core/themes/text_styles.dart';
import 'package:e_commerce_app/core/widgets/custom_app_bar.dart';
import 'package:e_commerce_app/features/account/model/navigation_option.dart';
import 'package:e_commerce_app/features/account/model/option_model.dart';
import 'package:e_commerce_app/features/account/model/switch_option.dart';
import 'package:e_commerce_app/features/account/view/widgets/name_and_email.dart';
import 'package:e_commerce_app/features/account/view/widgets/navigation_option_tile.dart';
import 'package:e_commerce_app/features/account/view/widgets/options_list.dart';
import 'package:e_commerce_app/features/account/view/widgets/profile_image.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  String name = '';
  String email = '';
  List<OptionModel> options = [
    NavigationOption(
      title: S.current.profile,
      icon: Iconsax.user_outline,
      route: const Text('profile'),
    ),
    NavigationOption(
      title: S.current.myOrders,
      icon: Iconsax.box_outline,
      route: const Text('myOrders'),
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

  @override
  void initState() {
    Storage.getUserData().then((value) {
      setState(() {
        name = value['name']!;
        email = value['email']!;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: CustomAppBar(title: S.of(context).myAccount),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Row(
                children: [
                  const ProfileImage(),
                  const SizedBox(width: 24),
                  NameAndEmail(name: name, email: email),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                S.of(context).general,
                style: TextStyles.bodySmallBold.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              OptionsList(options: options),
              const SizedBox(height: 22),
              Text(
                S.of(context).help,
                style: TextStyles.bodySmallBold.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              NavigationOptionTile(
                option: NavigationOption(
                  title: S.of(context).whoWeAre,
                  icon: Iconsax.info_circle_outline,
                  route: const Text('whoWeAre'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
