import 'package:objectbox/objectbox.dart';

// entity class for objectBox
@Entity()
class ProductEntity {
  @Id()
  int? id;

  int? itermId;

  ProductEntity({this.id = 0, required this.itermId});
}
