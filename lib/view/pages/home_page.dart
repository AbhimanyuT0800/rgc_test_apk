import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rgc_test_apk/controller/fetch_products_controller.dart';
import 'package:rgc_test_apk/core/constants/app_urls.dart';
import 'package:rgc_test_apk/core/theme/color_pallets.dart';
import 'package:rgc_test_apk/model/auth_model/auth_model.dart';
import 'package:rgc_test_apk/model/product_model/product_model.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key, required this.authModel});

  final AuthModel authModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productController = ref.watch(fetchProductControllerProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 53),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        authModel.user.fname,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        authModel.user.email,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 8),
                  CircleAvatar(
                    radius: 43,
                    backgroundImage: NetworkImage(authModel.user.profilePic),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Trending Foods',
                      style: TextStyle(
                        color: ColorPallets.textColor,
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: ColorPallets.redColor,
                      child: Icon(
                        Icons.add,
                        size: 28,
                        color: ColorPallets.white500,
                      ),
                    ),
                  ],
                ),
              ),
              productController.when(
                data: (data) {
                  if (data == null || data.results.isEmpty) {
                    log('No products available');
                    return const Center(
                      child: Text('No products available'),
                    );
                  }

                  return Column(
                    children: data.results
                        .map((product) => ProductCardWidget(product: product))
                        .toList(),
                  );
                },
                error: (error, stackTrace) {
                  log('Error fetching products: $error');
                  return Center(
                    child: Text('Error: $error'),
                  );
                },
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductCardWidget extends HookConsumerWidget {
  const ProductCardWidget({super.key, required this.product});

  final Result product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: ColorPallets.borderColor, width: 1),
        ),
        child: Column(
          children: [
            Image.network(
              product.imageUrl ?? AppUrls.commonFoodImg,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 180,
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: ColorPallets.textColor,
                        ),
                      ),
                      Text(
                        '\$ ${product.price}',
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: ColorPallets.lightTextColor,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: const Color.fromARGB(255, 231, 206, 151),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: ColorPallets.goldColor,
                          ),
                          const SizedBox(width: 2),
                          Text(
                            product.rating.toString(),
                            style:
                                const TextStyle(color: ColorPallets.goldColor),
                          ),
                          const SizedBox(width: 3),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 7),
                  const CircleAvatar(
                    radius: 16,
                    backgroundColor: ColorPallets.bgColor,
                    child: Icon(Icons.favorite_border_outlined),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
