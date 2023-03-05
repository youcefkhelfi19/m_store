
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m_store/featured/cart/presentation/view_models/cart_products/cart_products_cubit.dart';
import 'package:m_store/featured/cart/presentation/views/widgets/cart_card.dart';


class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    context.read<CartProductsCubit>().getProducts();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: BlocBuilder<CartProductsCubit, CartProductsState>(
        builder: (BuildContext context, state) {
         if(state is CartProductSuccess){
           return  ListView.builder(
               itemCount: state.products.length,
               itemBuilder:(context,index){
                 return CartCard(productCart: state.products[index]);
               }
           );
         }else if( state is CartProductsFailed){

         }
         return const Scaffold(
           body: Center(
             child: CircularProgressIndicator(),
           ),
         );
      },),
    );
  }
}

