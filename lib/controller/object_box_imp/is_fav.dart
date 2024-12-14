import 'package:rgc_test_apk/controller/object_box_imp/fev_product_db.dart';
import 'package:rgc_test_apk/model/product_entity/product_entity.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'is_fav.g.dart';

// checks it is favorite or not
class CheckIsFav {
  bool isFav(
      {required int itemId, required List<ProductEntity> listOfProducts}) {
    bool isFav = false;

    for (ProductEntity model in listOfProducts) {
      if (model.itermId == itemId) {
        isFav = true;
        break;
      }
    }
    return isFav;
  }
}

@riverpod
bool isFav(ref, {required int id}) {
  return CheckIsFav()
      .isFav(itemId: id, listOfProducts: ref.read(favProductDbProvider));
}
