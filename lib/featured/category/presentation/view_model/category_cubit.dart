
import 'package:bloc/bloc.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:m_store/featured/category/data/models/category_model.dart';
part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(const CategoryInitial());
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  FirebaseDatabase database = FirebaseDatabase.instance;
   List<CategoryModel> categories  = [];

  getCategories()async{
    emit(const CategoryLoading());
    try{
      DatabaseReference ref =  database.ref('categories');
      var snapshot =await ref.get();
      if(snapshot.exists){
        categories = [];
        for(var data in snapshot.children) {
          categories.add(CategoryModel.fromJson(data.value as Map<dynamic,dynamic>));
        }
        emit(CategorySuccess(categories: categories));

      }else{
        emit(const CategorySuccess(categories: []));
      }
    }catch(e){
      emit(const CategoryFailed());
    }

  }
  getData(){
    final reference = FirebaseDatabase.instance.ref('categories');
    final stream = reference.onValue.map((event) => event.snapshot.value);
    return stream;
  }
}
