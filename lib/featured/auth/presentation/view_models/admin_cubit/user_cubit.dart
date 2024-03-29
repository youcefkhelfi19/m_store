import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geocode/geocode.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_storage/get_storage.dart';
import 'package:meta/meta.dart';
import 'package:m_store/config/app_colors.dart';
import 'package:m_store/featured/auth/data/models/user.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../../../../services/locator.dart';
import '../../../../../widgets/alerts.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(AdminInitial());
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  @override
  void onChange(Change<UserState> change) {
    super.onChange(change);
  }
  Future fetchAdminData({required String id , bool showLoading = false})async{
    showLoading?emit(AdminLoading()):null;
    UserModel user;
    try{
      var snapshot =  firebaseFirestore.collection('users').doc(id);
      snapshot.get().then((value){
        user = UserModel(
            userId:value.get('userId') ,
            username: value.get('username'),
            email: value.get('email'),
            phone: value.get('phone'),
           address: value.get('address'),
          image: value.get('image'),
            favorites: []
        );
        emit(AdminSuccess(
          admin: user
        ));
      });
    }catch(e){
      emit(AdminFailed(errMsg: e.toString()));
    }
  }
  Future updateField({required String fieldValue, required String field}) async {

    try{
      await  firebaseFirestore
          .collection('users')
          .doc(getIt.get<GetStorage>().read('id'))
          .update({field: fieldValue}).then((value){
            fetchAdminData(id: getIt.get<GetStorage>().read('id'));
      });


    }catch(e){
      customToast(
        msg: 'Something went wrong ', color: Colors.red
      );
    }

  }
  uploadImage(File image)async{
    customToast(
        msg: 'uploading image', color: AppColors.mainColor
    );
   try{
     final ref =  firebaseStorage
         .ref()
         .child('users')
         .child(getIt.get<GetStorage>().read('id'));
     await ref.putFile(image).whenComplete(() async {
       await ref.getDownloadURL().then((value) => {
        updateField(fieldValue: value, field: 'image')
       });

     });
   }catch(e){

     customToast(
         msg: 'Something went wrong ', color: Colors.red
     );
   }
  }
  getCurrentLocation()async {
    String? finalAddress ;
    await Geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) async{
      GeoCode geoCode = GeoCode();
      Address address = await geoCode.reverseGeocoding(latitude: position.latitude, longitude: position.longitude);
      String fullAddress ="${address.streetAddress}, ${address.city}, ${address.countryName}, ${address.postal}";
      print(fullAddress);
      //updateField(fieldValue: fullAddress, field: 'address');
    }).catchError((e) {
      print(e);
    });
    return finalAddress;
  }
}
