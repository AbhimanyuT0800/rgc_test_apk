// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  int count;
  dynamic next;
  dynamic previous;
  List<Result> results;

  ProductModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  int id;
  String name;
  String price;
  String description;
  String category;
  Weights weights;
  Barcode barcode;
  String code;
  double rating;
  dynamic imageUrl;

  Result({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.category,
    required this.weights,
    required this.barcode,
    required this.code,
    required this.rating,
    required this.imageUrl,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        category: json["category"],
        weights: Weights.fromJson(json["weights"]),
        barcode: Barcode.fromJson(json["barcode"]),
        code: json["code"],
        rating: json["rating"]?.toDouble(),
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "description": description,
        "category": category,
        "weights": weights.toJson(),
        "barcode": barcode.toJson(),
        "code": code,
        "rating": rating,
        "image_url": imageUrl,
      };
}

class Barcode {
  int barcodeNumber;

  Barcode({
    required this.barcodeNumber,
  });

  factory Barcode.fromJson(Map<String, dynamic> json) => Barcode(
        barcodeNumber: json["barcode_number"],
      );

  Map<String, dynamic> toJson() => {
        "barcode_number": barcodeNumber,
      };
}

class Weights {
  int netWeight;
  int grossWeight;

  Weights({
    required this.netWeight,
    required this.grossWeight,
  });

  factory Weights.fromJson(Map<String, dynamic> json) => Weights(
        netWeight: json["net_weight"],
        grossWeight: json["gross_weight"],
      );

  Map<String, dynamic> toJson() => {
        "net_weight": netWeight,
        "gross_weight": grossWeight,
      };
}
