import 'dart:developer';

import 'package:rgc_test_apk/core/utils/snakbar.dart';
import 'package:rgc_test_apk/model/product_model/product_model.dart';
import 'package:rgc_test_apk/services/product_services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fetch_products_controller.g.dart';

@riverpod
Future<ProductModel?> fetchProductController(ref) async {
  final procuctModel = await ProductServices().getProducts();
  if (procuctModel != null) {
    log(procuctModel.count.toString());
    return procuctModel;
  }
  SnackbarUtils.showSnakBar('No products available...');
  return null;
}
