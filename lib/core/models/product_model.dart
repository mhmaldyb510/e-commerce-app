class ProductModel {
  final String title;
  final String price;
  final String image;
  final String rating;

  ProductModel({
    required this.title,
    required this.price,
    required this.image,
    required this.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      title: json['title'],
      price: json['price'].toString(),
      image: json['image'],
      rating: json['rating']['rate'].toString(),
    );
  }
}