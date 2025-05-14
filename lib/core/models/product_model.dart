import 'category_model.dart';

class ProductModel {
  final String id;
  final String name;
  final int price;
  final int? priceAfterDiscount;
  final double rate;
  final int soldUnits;
  final String description;
  final String imagePath;
  final int ratingsQuantity;
  final CategoryModel category;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    this.priceAfterDiscount,
    required this.rate,
    required this.soldUnits,
    required this.description,
    required this.imagePath,
    required this.ratingsQuantity,
    required this.category,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: (json['id'] ?? json['_id'] ?? '').toString(),
      name: json['title'] ?? '',
      price: json['price'] ?? 0,
      priceAfterDiscount: json['priceAfterDiscount'],
      rate: (json['ratingsAverage'] as num?)?.toDouble() ?? 0.0,
      soldUnits: json['sold'] ?? 0,
      description: json['description'] ?? '',
      imagePath: json['imageCover'] ?? '',
      ratingsQuantity: json['ratingsQuantity'] ?? 0,
      category: CategoryModel.fromJson(json['category'] ?? {}),
    );
  }
}
