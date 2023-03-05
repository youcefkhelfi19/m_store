import 'package:bloc/bloc.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get_storage/get_storage.dart';
import 'package:m_store/featured/cart/data/models/cart_product.dart';
import 'package:meta/meta.dart';

import '../../../../../services/locator.dart';

part 'cart_products_state.dart';

class CartProductsCubit extends Cubit<CartProductsState> {
  CartProductsCubit() : super(CartProductsInitial());

  getProducts()async{
    emit( CartProductsLoading());
    try{
      DatabaseReference ref =  FirebaseDatabase.instance.ref('carts');
      var snapshot =await ref.child(getIt.get<GetStorage>().read('id')).get();
      if(snapshot.exists){
      List<ProductCart>  products = [];
        for(var data in snapshot.children) {
          products.add(ProductCart.fromJson(data.value as Map<dynamic,dynamic>));
        }
        emit(CartProductSuccess(products: products));

      }else{
        emit( CartProductSuccess(products: const []));
      }
    }catch(e){
      emit(CartProductsFailed());
    }

  }
}
