import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/models/category_model.dart';
import 'package:e_commerce_app/core/models/product_model.dart';
import 'package:e_commerce_app/features/products/model/products_screen_api_helper.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductCubitInitial());

  getProducts() async {
    emit(ProductsLoadingState());
    try {
      List<ProductModel> products =
          await ProductsScreenApiHelper.getAllProducts(sort: '-sold');
      return products;
    } catch (e) {
      log(e.toString());
      emit(ProductsErrorState(e.toString()));
    }
  }

  getCategories() async {
    emit(ProductsLoadingState());
    try {
      List<CategoryModel> categories =
          await ProductsScreenApiHelper.getCategories();
      return categories;
    } catch (e) {
      log(e.toString());
      emit(ProductsErrorState(e.toString()));
    }
  }

  String sorting = '-sold';
  String? category;

  fetchProductsScreen() async {
    emit(ProductsLoadingState());
    sorting = '-sold';
    category = null;
    try {
      List<ProductModel> products = [];
      List<CategoryModel> categories = [];
      var data = await Future.wait<dynamic>([getCategories(), getProducts()]);
      products = data[1] as List<ProductModel>;
      categories = data[0] as List<CategoryModel>;
      emit(ProductsLoadedState(products: products, categories: categories));
    } catch (e) {
      log(e.toString());
      emit(ProductsErrorState(e.toString()));
    }
  }

  getCategoryProducts({String? category, String? sort}) async {
    emit(ProductsLoadingState());
    String? sorting = sort ?? '-sold';

    this.category = category ?? this.category;
    try {
      List<ProductModel> products =
          await ProductsScreenApiHelper.getAllProducts(
            categoryId: this.category,
            sort: sorting,
          );
      emit(ProductFilteredState(products: products));
    } catch (e) {
      log(e.toString());
      emit(ProductsErrorState(e.toString()));
    }
  }
}
