import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m_store/featured/cart/presentation/view_models/cart_cubit.dart';

import '../../../../../config/app_colors.dart';

class QuantityRow extends StatefulWidget {
  const QuantityRow({Key? key, required this.id}) : super(key: key);
  final String id ;
  @override
  State<QuantityRow> createState() => _QuantityRowState();
}

class _QuantityRowState extends State<QuantityRow> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(

        onTap: (){

            context.read<CartCubit>().deleteCartProduct(widget.id);


        },
        child: const Icon(Icons.remove_circle,color: AppColors.mainColor,));
  }
}
