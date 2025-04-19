
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../generated/l10n.dart' show S;
import '../../../../generated/l10n.dart';
import '../../../account/view/screens/account_screen.dart';
import '../../../cart/view/screens/cart_screen.dart';
import '../../../categories/view/screens/categories_screen.dart';

import '../screens/home_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);
  final List<Widget> screens = const [
    HomeScreen(),
    CartScreen(),
    CategoriesScreen(),
    AccountScreen(),
  ];
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        contentPadding: 0,

        inactiveIcon: const Icon(Iconsax.home_outline,color: AppColors.grayscale500,) ,
        icon: CircleAvatar(
            radius: 15,
            backgroundColor: AppColors.kPrimaryColor,
            child: Icon(Iconsax.home_bold,color: Theme.of(context).scaffoldBackgroundColor,size: 16)),
        title: S.of(context).home,
      ),
      PersistentBottomNavBarItem(
       contentPadding: 0,
        inactiveIcon: const Icon(Iconsax.element_3_outline,color: AppColors.grayscale500) ,
        icon:  CircleAvatar(
            radius: 15,
            backgroundColor: AppColors.kPrimaryColor,
            child: Icon(Iconsax.element_3_bold,color: Theme.of(context).scaffoldBackgroundColor,size: 16)),
        title: S.of(context).categories,
      ),
      PersistentBottomNavBarItem(
        contentPadding: 0,

        inactiveIcon: const Icon(Iconsax.shopping_cart_outline,color: AppColors.grayscale500,) ,
        icon: CircleAvatar(
            radius: 15,
            backgroundColor: AppColors.kPrimaryColor,
            child: Icon(Iconsax.shopping_cart_bold,color: Theme.of(context).scaffoldBackgroundColor,size: 16)),
        title: S.of(context).cart,
      ),
      PersistentBottomNavBarItem(
        contentPadding: 0,

        inactiveIcon: const Icon(Iconsax.user_outline,color: AppColors.grayscale500,) ,
        icon: CircleAvatar(
            radius: 15,
            backgroundColor: AppColors.kPrimaryColor,
            child: Icon(Iconsax.user_bold,color: Theme.of(context).scaffoldBackgroundColor,size: 16,)),
        title: S.of(context).account,
      ),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: screens,
      items: _navBarsItems(),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen on a non-scrollable screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardAppears: true,

      padding: const EdgeInsets.only(top: 8),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      isVisible: true,
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings( // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings( // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          duration: Duration(milliseconds: 200),
          screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
        ),
      ),
      confineToSafeArea: true,
      navBarHeight: kBottomNavigationBarHeight,

    );
  }
}
