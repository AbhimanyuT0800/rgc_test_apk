import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:rgc_test_apk/core/constants/app_urls.dart';
import 'package:rgc_test_apk/core/utils/snakbar.dart';
import 'package:rgc_test_apk/model/product_model/product_model.dart';

class ProductServices {
  final Dio _dio = Dio(BaseOptions(baseUrl: AppUrls.baseUrl));
  Future<ProductModel?> getProducts() async {
    try {
      final Response response = await _dio.get(AppUrls.getProducts);

      if (response.statusCode == 200) {
        final data = ProductModel.fromJson(response.data);

        return data;
      }
      log(response.statusCode.toString());
      return null;
    } catch (e) {
      SnackbarUtils.showSnakBar('Somthing went wrong ....$e');
    }
    return null;
  }
}
