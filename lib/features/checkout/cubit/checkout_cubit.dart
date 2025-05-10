import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/features/checkout/model/how_to_pay_enum.dart';
import 'package:meta/meta.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(CheckoutInitial());
  List<String> done = [];
  int pageIndex = 0;

  HowToPayEnum howToPay = HowToPayEnum.online;
  void changePageIndex(int index) {
    pageIndex = index;

    emit(CheckoutInitial());
  }
}
