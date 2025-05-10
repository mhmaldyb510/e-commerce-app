import 'package:e_commerce_app/core/cubits/modal_buttom_sheet_cubit/modal_bottom_sheet_cubit.dart';
import 'package:e_commerce_app/core/models/product_model.dart';
import 'package:e_commerce_app/core/widgets/custom_app_bar.dart';
import 'package:e_commerce_app/features/checkout/cubit/checkout_cubit.dart';
import 'package:e_commerce_app/features/checkout/view/widgets/address_page.dart';
import 'package:e_commerce_app/features/checkout/view/widgets/checkout_titles_list.dart';
import 'package:e_commerce_app/features/checkout/view/widgets/payment_page.dart';
import 'package:e_commerce_app/features/checkout/view/widgets/shipping_page.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutScreen extends StatefulWidget {
  final List<ProductModel>? products;
  const CheckoutScreen({super.key, this.products = const []});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  late List<String> pages;
  late ModalBottomSheetCubit modalBottomSheetCubit;

  @override
  void initState() {
    BlocProvider.of<ModalBottomSheetCubit>(context).updateModalSheetState(true);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    modalBottomSheetCubit = BlocProvider.of<ModalBottomSheetCubit>(context);
    pages = [
      S.of(context).shipping,
      S.of(context).address,
      S.of(context).payment,
      S.of(context).review,
    ];
  }

  @override
  void dispose() {
    modalBottomSheetCubit.updateModalSheetState(false);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckoutCubit(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(56),
              child: CustomAppBar(
                title: pages[BlocProvider.of<CheckoutCubit>(context).pageIndex],
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: BlocBuilder<CheckoutCubit, CheckoutState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        const SizedBox(height: 16),
                        CheckoutTitlesList(titles: pages),
                        const SizedBox(height: 32),
                        IndexedStack(
                          index:
                              BlocProvider.of<CheckoutCubit>(context).pageIndex,
                          children: const [
                            ShippingPage(),
                            AddressPage(),
                            PaymentPage(),
                            Center(child: Text('Review')),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
