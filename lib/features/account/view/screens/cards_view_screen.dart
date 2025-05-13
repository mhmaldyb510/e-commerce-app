import 'package:e_commerce_app/core/cubits/payment_cubit/payment_cubit.dart';
import 'package:e_commerce_app/core/widgets/custom_app_bar.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:e_commerce_app/features/account/view/screens/add_card_screen.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';

class CardsViewScreen extends StatelessWidget {
  const CardsViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,

      children: [
        Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(56),
            child: CustomAppBar(title: S.of(context).payments),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: BlocBuilder<PaymentCubit, PaymentState>(
              builder: (context, state) {
                var cards = context.read<PaymentCubit>().getAllCards();
                return RefreshIndicator(
                  onRefresh:
                      () async => context.read<PaymentCubit>().getAllCards(),
                  child: ListView.separated(
                    separatorBuilder:
                        (context, index) => const SizedBox(height: 16),
                    physics: const AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics(),
                    ),
                    itemCount: cards.length,
                    itemBuilder: (context, index) {
                      return Directionality(
                        textDirection: TextDirection.ltr,
                        child: Card(
                          child: ListTile(
                            leading:
                                ![
                                      Brands.visa,
                                      Brands.mastercard,
                                    ].contains(cards[index].cardType)
                                    ? const Icon(Iconsax.card_bold)
                                    : Brand(cards[index].cardType),
                            title: Text(
                              '**** **** **** ${cards[index].cardNumber.substring(cards[index].cardNumber.length - 4)}',
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ),
        Positioned(
          width: MediaQuery.of(context).size.width - 32,
          bottom: 176,
          child: CustomButton(
            text: S.of(context).addNewCard,
            onPressed:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddCardScreen(),
                  ),
                ),
          ),
        ),
      ],
    );
  }
}
