import 'package:bloc/bloc.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get_storage/get_storage.dart';
import 'package:m_store/featured/cart/data/models/cart_product.dart';
import 'package:meta/meta.dart';

import '../../../../../services/locator.dart';

part 'cart_products_state.dart';

class CartProductsCubit extends Cubit<CartProductsState> {
  CartProductsCubit() : super(CartProductsInitial());

  Stream<DatabaseEvent> getCartProducts(){
      DatabaseReference ref =  FirebaseDatabase.instance.ref('carts');
      var snapshot = ref.child(getIt.get<GetStorage>().read('id')).onValue;
      return snapshot;

  }
}
