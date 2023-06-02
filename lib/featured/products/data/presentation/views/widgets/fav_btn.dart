import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../../../config/app_colors.dart';
import '../../../../../../services/locator.dart';
import '../../../../../favorite/presentation/view_models/favorites_cubit.dart';

class FaveBtn extends StatefulWidget {
  const FaveBtn({Key? key, required this.id}) : super(key: key);
  final String id ;
  @override
  State<FaveBtn> createState() => _FaveBtnState();
}

class _FaveBtnState extends State<FaveBtn> {

  @override
  Widget build(BuildContext context) {
    return  Positioned(
      right: 5,
      top: 5,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration:  BoxDecoration(
            color: AppColors.mainColor.withOpacity(0.2),
            shape: BoxShape.circle
        ),
        child: InkWell(
            onTap: (){
              context.read<FavoritesCubit>().favoriteProduct(productId: widget.id);
              setState(() {
              });
            }, child: Icon(getIt.get<GetStorage>().read('favorites') == null?Ionicons.heart_outline:getIt.get<GetStorage>().read('favorites').contains(widget.id)?Ionicons.heart:
        Ionicons.heart_outline,color: Colors.red,)),
      ),
    );
  }
}