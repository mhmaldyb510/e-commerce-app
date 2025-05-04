import 'package:e_commerce_app/core/constants/assets.dart';

class CategoryModel {
  final String name;
  final String image;

  CategoryModel({required this.name, required this.image});
}

List<CategoryModel> categoriesList = [
  CategoryModel(name: 'Electronics', image: Assets.imagesElectronics),
  CategoryModel(name: 'Jewelery', image: Assets.imagesJewelery),
  CategoryModel(name: 'Men\'s clothing', image: Assets.imagesMensClothing),
  CategoryModel(name: 'Women\'s clothing', image: Assets.imagesWomenSClothing),
];
