

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:m_store/featured/cart/presentation/view_models/cart_products/cart_products_cubit.dart';
import 'package:m_store/featured/cart/presentation/views/widgets/cart_card.dart';

import '../../../../config/text_styles.dart';
import '../../data/models/cart_product.dart';


class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DatabaseEvent>(
      stream: context.read<CartProductsCubit>().getCartProducts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CustomScaffold(body: Center(child: CircularProgressIndicator(),), totalValue: '0.0',);
        } else if (snapshot.connectionState ==
            ConnectionState.active) {

          if (snapshot.data!.snapshot.exists) {
            double totalPrice = 0;

             var data = snapshot.data!.snapshot.children.toList();
             for(var element in data ){
               Cart cart = Cart.fromDataSnapshot(element);
               totalPrice+=cart.price;
             }
            return CustomScaffold(body: ListView.builder(
                itemCount:snapshot.data!.snapshot.children.length ,

                itemBuilder: (context, index){
                  DataSnapshot dataSnapshot = data[index];
                  Cart cart = Cart.fromDataSnapshot(dataSnapshot);
                  totalPrice += cart.price;
                  return CartCard(productCart: cart,
                    productCartId: dataSnapshot.key.toString(),
                  );
                }),
                totalValue: '$totalPrice');

          } else {
            return  const CustomScaffold(
                body: Center(child: Text('No data'),), totalValue: '0.0',);
          }
        }
        return  const CustomScaffold(
          body: Center(
              child:  Text(
                'something_went_wrong',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 30),
              )), totalValue: '0.0',
        );
      },
    );



  }
}

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({Key? key, required this.body, required this.totalValue}) : super(key: key);
  final Widget body;
  final String totalValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          },
            icon: const Icon(Ionicons.arrow_back),
          ),

        ),
        bottomSheet:  Container(
          height: 40,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            children: [
              const Text('Total Price',style: TextStyles.style24,),
              const Spacer(),
              Text(totalValue,style: TextStyles.style24,)
            ],
          ),
        ),
        body: body
    );
  }
}
