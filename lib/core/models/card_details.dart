import 'package:objectbox/objectbox.dart';

@Entity()
class CardDetails {
  @Id()
  int id = 0;

  String cardHolderName;
  String cardNumber;
  String expiryDate;
  String cvv;
  String cardType; // e.g., "Visa" or "MasterCard"

  CardDetails({
    required this.cardHolderName,
    required this.cardNumber,
    required this.expiryDate,
    required this.cvv,
    required this.cardType,
  });
}
