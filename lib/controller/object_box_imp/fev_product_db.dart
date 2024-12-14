import 'package:rgc_test_apk/controller/object_box_imp/object_box_imp.dart';
import 'package:rgc_test_apk/model/product_entity/product_entity.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fev_product_db.g.dart';

// provide favorite Products from objet box
@riverpod
class FavProductDb extends _$FavProductDb {
  @override
  List<ProductEntity> build() {
    return ObjectBoxImpl.box.getAll();
  }

// method for add Products
  void addProduct(ProductEntity product) {
    ObjectBoxImpl.box.put(product);
    state = ObjectBoxImpl.box.getAll();
  }

// method for remove Products
  void removeProduct(int id) {
    ObjectBoxImpl.box.remove(id);
    state = ObjectBoxImpl.box.getAll();
  }
}
