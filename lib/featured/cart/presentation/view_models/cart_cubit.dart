import 'package:bloc/bloc.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get_storage/get_storage.dart';
import 'package:m_store/featured/cart/data/models/cart_product.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

import '../../../../config/app_colors.dart';
import '../../../../services/locator.dart';
import '../../../../widgets/alerts.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  FirebaseDatabase database = FirebaseDatabase.instance;
  var uuid = const Uuid();

  addProductToCart(ProductCart productCart) async {
    var id = uuid.v4();
    try {
      DatabaseReference ref = database.ref("carts").child(
          getIt.get<GetStorage>().read('id')).child(id);
      await ref.set(productCart.toJson()).whenComplete(() {
        customToast(
            msg: 'added success', color: AppColors.mainColor
        );
      });
    } catch (e) {
      emit(CartFailed());
    }
  }
}
