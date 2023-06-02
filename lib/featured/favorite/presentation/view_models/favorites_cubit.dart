import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_storage/get_storage.dart';
import 'package:m_store/featured/products/data/models/product_model.dart';
import 'package:meta/meta.dart';

import '../../../../services/locator.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesInitial());
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  getFavoritesProducts() {
    List<String> favorites ;
    if(getIt.get<GetStorage>().read('favorites') == null){
      favorites = <String>[];
    }else{
      favorites = getIt.get<GetStorage>().read('favorites').cast<String>();
    }    return firebaseFirestore
        .collection('products').where('id', whereIn: favorites.isEmpty?['']:favorites  )
        .snapshots();
  }

  favoriteProduct({required String productId}){
    List<String> favorites ;
    if(getIt.get<GetStorage>().read('favorites') == null){
      favorites = <String>[];
    }else{
      favorites = getIt.get<GetStorage>().read('favorites').cast<String>();
    }

    if(favorites.contains(productId)){
      favorites.remove(productId);
      getIt.get<GetStorage>().write('favorites', favorites);
    }else{
      favorites.add(productId);
      getIt.get<GetStorage>().write('favorites', favorites);

    }

  }

}
