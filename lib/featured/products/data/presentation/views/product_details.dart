import 'package:card_swiper/card_swiper.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:m_store/config/text_styles.dart';

import '../../../../../config/app_colors.dart';
import '../../models/product_model.dart';
import '../../../../../widgets/colors_list.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key, required  this.product})
      : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MaterialButton(
              height: 50,
              minWidth: 150,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
              ),
              color: AppColors.mainColor,
              onPressed: (){},
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
            IconButton(onPressed: (){}, icon: const Icon(Ionicons.heart_outline,size: 35,))
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title:  Text(product.title),
        elevation: 0.0,
        backgroundColor: AppColors.mainColor,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Ionicons.heart))
        ],
      ),
      body: ListView(
        children: [
          Container(
              height: 400,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Swiper(
                itemBuilder: (context, index) {
                  final image = product.images![index];
                  return Padding(
                    padding: const EdgeInsets.only(left: 3,right: 3),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        image,
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
                indicatorLayout: PageIndicatorLayout.SCALE,
                autoplay: false,
                itemCount: product.images!.length,
                pagination: const SwiperPagination(),
                control:  const SwiperControl(
                    color: Colors.transparent,disableColor: Colors.transparent
                ),
              )
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                const Text('Price:',style: TextStyles.style20,),

                Text('${product.price}DZD',style:  TextStyles.style20,),

              ],),
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text('Description:',style: TextStyles.style20),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ExpandableText(
              product.description,
              style: TextStyle(fontSize: 16,color: Colors.grey.shade700),
              expandText: 'show more',
              collapseText: 'show less',
              maxLines: 3,
              linkColor: Colors.blue,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Sizes:',style:TextStyles.style20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomRadioButton(
                      elevation: 0,
                      padding: 0,
                      absoluteZeroSpacing: false,
                      shapeRadius: 10,
                      enableShape: true,
                      width: 60,
                      height: 40,
                      unSelectedColor: Colors.white,
                      selectedBorderColor: AppColors.mainColor,
                      unSelectedBorderColor: AppColors.mainColor,
                      defaultSelected: product.sizes[0],
                      buttonLables: product.sizes,
                      buttonValues: product.sizes,
                      buttonTextStyle: const ButtonTextStyle(
                          selectedColor: Colors.white,
                          unSelectedColor: Colors.black,
                          textStyle: TextStyle(fontSize: 16)),
                      radioButtonValue: (value) {
                      },
                      selectedColor: AppColors.mainColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
          ColorsList(colors: product.colors,)
        ],
      ),
    );
  }
}
