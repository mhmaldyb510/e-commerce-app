import 'package:e_commerce_app/core/cubits/modal_buttom_sheet_cubit/modal_bottom_sheet_cubit.dart';
import 'package:e_commerce_app/core/widgets/custom_nav_bar_item.dart';
import 'package:e_commerce_app/features/home/view/screens/home_screen.dart';
import 'package:e_commerce_app/features/products/view/screens/product_screen.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  late PersistentTabController _controller;

  List<Widget> _screens() => [
    const HomeScreen(),
    const ProductScreen(),
    const Center(child: Text('Cart')),
    const Center(child: Text('Account')),
  ];

  List<PersistentBottomNavBarItem> _navBarsItems({
    required int index,
    required Color color,
  }) {
    return [
      customNaveBarIcon(
        context,
        activeIcon: Iconsax.home_1_bold,
        unActiveIcon: Iconsax.home_outline,
        title: S.of(context).home,
      ),
      customNaveBarIcon(
        context,
        activeIcon: Iconsax.element_3_bold,
        unActiveIcon: Iconsax.element_3_outline,
        title: S.of(context).products,
      ),
      customNaveBarIcon(
        context,
        activeIcon: Iconsax.shopping_cart_bold,
        unActiveIcon: Iconsax.shopping_cart_outline,
        title: S.of(context).cart,
      ),
      customNaveBarIcon(
        context,
        activeIcon: Iconsax.user_bold,
        unActiveIcon: Iconsax.user_outline,
        title: S.of(context).account,
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ModalBottomSheetCubit(),
      child: Builder(
        builder: (context) {
          return BlocBuilder<ModalBottomSheetCubit, ModalBottomSheetState>(
            builder: (context, state) {
              return Scaffold(
                body: PersistentTabView(
                  context,
                  resizeToAvoidBottomInset: true,
                  isVisible:
                      !BlocProvider.of<ModalBottomSheetCubit>(
                        context,
                      ).isModalSheetOpened,
                  bottomScreenMargin: 0,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  handleAndroidBackButtonPress: true,
                  decoration: NavBarDecoration(
                    colorBehindNavBar: Colors.transparent,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(25),
                        blurRadius: 7,
                        offset: const Offset(0, -2),
                      ),
                    ],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  onItemSelected: (value) {
                    setState(() {
                      _controller.index = value;
                    });
                  },
                  controller: _controller,
                  screens: _screens(),
                  items: _navBarsItems(
                    index: _controller.index,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
