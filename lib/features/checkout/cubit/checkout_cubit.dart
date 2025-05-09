import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/features/checkout/model/payment_way_enum.dart';
import 'package:meta/meta.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(CheckoutInitial());
  List<String> done = [];
  int pageIndex = 0;

  PaymentWayEnum paymentWay = PaymentWayEnum.online;
  void changePageIndex(int index) {
    pageIndex = index;

    emit(CheckoutInitial());
  }
}
