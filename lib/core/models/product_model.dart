class ProductModel {
  final String title;
  final String price;
  final String image;
  final String rating;
  final String description;
  final String ratingCount ;

  ProductModel( {
    required this.title,
    required this.price,
    required this.image,
    required this.rating,
    required this.ratingCount,
    required this.description,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      title: json['title'],
      price: json['price'].toString(),
      image: json['image'],
      rating: json['rating']['rate'].toString(),
      ratingCount: json['rating']['count'].toString(),
      description: json['description'],
    );
  }
}
