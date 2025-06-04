class CartProductModel {
  final String id;
  final String name;
  final String imageURL;
  final int count;
  final double price;

  CartProductModel({
    required this.id,
    required this.name,
    required this.imageURL,
    required this.count,
    required this.price,
  });

  factory CartProductModel.fromJson(Map<String, dynamic> json) {
    return CartProductModel(
      id: json['product']['id'] ?? '',
      name: json['product']['title'] ?? '',
      imageURL: json['product']['imageCover'] ?? '',
      count: int.tryParse(json['count'].toString()) ?? 0,
      price: double.tryParse(json['price'].toString()) ?? 0.0,
    );
  }
}
