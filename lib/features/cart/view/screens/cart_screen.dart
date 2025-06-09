import 'package:e_commerce_app/core/widgets/custom_app_bar.dart';
import 'package:e_commerce_app/features/cart/cubit/cart_cubit.dart';
import 'package:e_commerce_app/features/cart/view/widgets/cart_body.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit()..getCartProducts(),
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () => context.read<CartCubit>().getCartProducts(),
            child: Scaffold(
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(56),
                child: CustomAppBar(title: S.of(context).cart),
              ),
              body:
                  state is CartLoading
                      ? const Center(child: CircularProgressIndicator())
                      : state is CartSuccess
                      ? CartBody(
                        cartProducts: context.read<CartCubit>().products,
                      )
                      : state is CartError
                      ? SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: Text(state.message),
                      )
                      : const SizedBox.shrink(),
            ),
          );
        },
      ),
    );
  }
}
