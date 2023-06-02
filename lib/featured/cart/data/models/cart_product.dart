import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';

class Cart {
  final String productId;
  final String title;
  final double price;
  final String image;
  final String size;
  final int color;
  final String dateTime;




  Cart({
    required this.productId,
    required this.title,
    required this.price,
    required this.image,
    required this.color,
    required this.size,
    required this.dateTime
  });

  factory Cart.fromDataSnapshot(DataSnapshot dataSnapshot) {
    String data = jsonEncode(dataSnapshot.value) ;
    final map = jsonDecode(data);
    return Cart(
      productId: map['id'],
      title: map['title'],
      dateTime: map['dateTime'],
      price: map['price'].toDouble(),
      image: map['image'],
      color: map['color'],
      size: map['size'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = productId;
    data['title'] = title;
    data['price'] = price;
    data['image'] = image;
    data['dateTime'] = dateTime;
    data['color'] = color;
    data['size'] = size;
    return data;
  }
}
