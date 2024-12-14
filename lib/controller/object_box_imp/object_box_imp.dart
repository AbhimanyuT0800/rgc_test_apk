import 'package:rgc_test_apk/model/product_entity/product_entity.dart';
import 'package:rgc_test_apk/objectbox.g.dart';
import 'dart:io';

// ObjectBox declaration
class ObjectBoxImpl {
  late final Store store;
  static late final Box<ProductEntity> box;

  ObjectBoxImpl._create(this.store) {
    box = store.box<ProductEntity>();
  }

  static Future<ObjectBoxImpl> create() async {
    // Use a directory relative to the current working directory
    final directory = Directory('./objectbox_data');

    // Ensure the directory exists
    if (!directory.existsSync()) {
      directory.createSync(recursive: true);
    }

    final store = await openStore(directory: directory.path);
    return ObjectBoxImpl._create(store);
  }
}
