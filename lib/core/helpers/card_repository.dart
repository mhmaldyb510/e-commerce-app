import 'package:e_commerce_app/core/models/card_details.dart';
import 'package:e_commerce_app/objectbox.g.dart';

class CardRepository {
  final Box<CardDetails> _cardBox;

  CardRepository(Store store) : _cardBox = store.box<CardDetails>();

  void addCard(CardDetails card) {
    _cardBox.put(card);
  }

  List<CardDetails> getAllCards() {
    return _cardBox.getAll();
  }

  void removeCard(int id) {
    _cardBox.remove(id);
  }

  void updateCard(CardDetails card) {
    _cardBox.put(card); // same method as add – it replaces if ID exists
  }
}
