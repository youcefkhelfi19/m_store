import 'package:drift/drift.dart';

class Product extends Table{
      TextColumn get productId => text().named('productId')();
      TextColumn get productName => text().named('title')();
      TextColumn get productDescription => text().named('description')();
      BoolColumn get isPopular => boolean().named('colors')();
      BoolColumn get isRecommended => boolean().named('productId')();
      TextColumn get productColors => text().named('productId')();
}