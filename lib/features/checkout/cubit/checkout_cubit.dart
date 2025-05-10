import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/models/product_model.dart';
import 'package:e_commerce_app/features/checkout/model/how_to_pay_enum.dart';
import 'package:e_commerce_app/features/checkout/model/payment_way_enum.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(CheckoutInitial());
  List<String> done = [];
  int pageIndex = 0;

  HowToPayEnum howToPay = HowToPayEnum.online;

  PaymentWayEnum paymentWay = PaymentWayEnum.visa;

  int? cardNumber;

  void setCardNumber(int number) {
    cardNumber = number;
    emit(CheckoutInitial());
  }

  void changePaymentWay(PaymentWayEnum paymentWay) {
    this.paymentWay = paymentWay;
    emit(CheckoutInitial());
  }

  List<ProductModel> products = [];

  void changePageIndex(int index) {
    pageIndex = index;

    emit(CheckoutInitial());
  }

  String fullAddress = '';
  void setAddress(String address) {
    fullAddress = address;
    emit(CheckoutInitial());
  }
}
