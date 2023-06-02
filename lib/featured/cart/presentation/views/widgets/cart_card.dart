import 'package:flutter/material.dart';
import 'package:m_store/featured/cart/data/models/cart_product.dart';
import 'package:m_store/featured/cart/presentation/views/widgets/quantity_row.dart';

import '../../../../../config/app_colors.dart';
import '../../../../../config/text_styles.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    super.key, required this.productCart, required this.productCartId,
  });
   final Cart productCart;
   final String productCartId;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(productCart.image ,height: 100,width: 100,),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                   Text(productCart.title,style: TextStyles.style20,),
                  Text('${productCart.price}',style: TextStyles.style20.copyWith(color: Colors.grey.shade700,fontWeight: FontWeight.normal),),
                  Text('Size: ${productCart.size}',style: TextStyles.style20.copyWith(color: Colors.grey.shade700,fontWeight: FontWeight.normal,fontSize: 16),),
                  SizedBox(

                    child: Row(
                      children: [
                        Text('Colors ',style: TextStyles.style20.copyWith(color: Colors.grey.shade700,fontWeight: FontWeight.normal,fontSize: 16),),
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(productCart.color)
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
         Positioned(
            top: 5,
            right: 5,
            child: QuantityRow(

              id: productCartId,

            )),
        Positioned(
            bottom: 10,
            right: 10,
            child:                                 Container(
              height: 30,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.secondaryColor,
                borderRadius: BorderRadius.circular(10),

              ),
              child: const Text('Pending',style: TextStyle(
                  color: AppColors.mainColor
              ),),
            )
        )
      ],
    );
  }
}
