import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:m_store/featured/cart/data/models/cart_product.dart';
import 'package:m_store/featured/cart/presentation/view_models/cart_cubit.dart';
import 'package:m_store/featured/products/data/models/product_model.dart';

import '../../../../../config/app_colors.dart';
import '../../../../../config/text_styles.dart';

class AddToCartBtn extends StatelessWidget {
  const AddToCartBtn({Key? key,required this.product, required this.index, required this.selectedSize, }) : super(key: key);
 final Product product ;
 final int index;
 final String selectedSize;
  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
  listener: (context, state) {
  },
  child: MaterialButton(
      height: 50,
      minWidth: 150,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
      ),
      color: AppColors.mainColor,
      onPressed: (){
        Cart productCart = Cart(
             title: product.title, price: product.price, image: product.images![index], color: product.colors[index], size: selectedSize,
            dateTime: DateTime.now().toString(), productId: product.productId.toString());
        context.read<CartCubit>().addProductToCart(productCart);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Add to Cart',style: TextStyles.style20.copyWith(color: Colors.white,fontSize: 18),),
          const SizedBox(width: 20,),
          const Icon(Ionicons.bag_add_outline,color: Colors.white,)
        ],
      ),
    ),
);
  }
}
