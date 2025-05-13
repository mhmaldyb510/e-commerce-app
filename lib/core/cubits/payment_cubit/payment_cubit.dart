import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/helpers/card_repository.dart';
import 'package:e_commerce_app/core/models/card_details.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:meta/meta.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final CardRepository _cardRepository;

  PaymentCubit(this._cardRepository) : super(PaymentInitial());

  // Store temporary card data
  String _cardHolderName = '';
  String _cardNumber = '';
  String _expiryDate = '';
  String _cvv = '';
  String _cardType = Brands.visa; // default or set by logic

  void setCardHolderName(String name) {
    _cardHolderName = name;
  }

  void setCardNumber(int number) {
    _cardNumber = number.toString();
    if (_cardNumber.startsWith('4')) {
      _cardType = Brands.visa;
    } else if (_cardNumber.startsWith('5')) {
      _cardType = Brands.mastercard;
    } else {
      _cardType = '';
    }
  }

  void setExpiryDate(String date) {
    _expiryDate = date;
  }

  void setCVV(String cvv) {
    _cvv = cvv;
  }

  void setCardType(String type) {
    _cardType = type;
  }

  void addCard() {
    try {
      emit(PaymentLoading());
      final card = CardDetails(
        cardHolderName: _cardHolderName,
        cardNumber: _cardNumber,
        expiryDate: _expiryDate,
        cvv: _cvv,
        cardType: _cardType,
      );
      _cardRepository.addCard(card); // Synchronous call
      emit(PaymentSuccess()); // Success state
    } catch (e) {
      emit(PaymentFailure(e.toString())); // Failure state
    }
  }

  void reset() {
    _cardHolderName = '';
    _cardNumber = '';
    _expiryDate = '';
    _cvv = '';
    _cardType = '';
  }

  List<CardDetails> getAllCards() {
    return _cardRepository.getAllCards();
  }
}
