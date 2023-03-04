import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:m_store/config/app_colors.dart';
import 'package:m_store/config/text_styles.dart';

class Favorite extends StatelessWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('FFFF');
    return Scaffold(
      body: ListView.builder(
          itemCount: 10,
          itemBuilder:(context,index){
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
                          child: Image.asset('assets/images/logo.png',height: 100,width: 100,),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children:  [
                          const Text('title',style: TextStyles.style20,),
                          const SizedBox(height: 20,),
                          Text('3000DA',style: TextStyles.style20.copyWith(color: Colors.grey.shade700,fontWeight: FontWeight.normal),)
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                    padding: const EdgeInsets.all(5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: const Icon(Ionicons.remove_circle_outline,color: AppColors.secondaryColor,),
                ))
              ],
            );
          }
      ),
    );
  }
}
