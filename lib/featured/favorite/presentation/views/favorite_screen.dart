import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m_store/featured/favorite/presentation/view_models/favorites_cubit.dart';
import 'package:m_store/featured/products/data/presentation/views/widgets/product_card.dart';

import '../../../../../config/app_colors.dart';
import '../../../products/data/models/product_model.dart';

class Favorite extends StatelessWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: context.read<FavoritesCubit>().getFavoritesProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState ==
              ConnectionState.active) {

            if (snapshot.data!.docs.isNotEmpty) {
              return GridView.builder(
                  padding: const EdgeInsets.only(top: 10,left: 10,right: 10),

                  itemCount:snapshot.data!.docs.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.82),
                  itemBuilder: (context,index){
                    Map<String, dynamic>? data = snapshot.data!.docs[index].data() as Map<String, dynamic>? ;
                    Product product = Product.fromMap(data!);
                    return  ProductCard(
                      product: product,
                    );
                  });


            } else {
              return const Center(child: Text('No data'),);
            }
          }
          return const Center(
              child:  Text(
                'something_went_wrong',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 30),
              ));
        },
      ),
    );
  }
}
