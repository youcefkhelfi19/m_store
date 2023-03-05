import 'package:flutter/material.dart';

import '../../../../../config/app_colors.dart';

class QuantityRow extends StatelessWidget {
  const QuantityRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      child: Row(
        children: const [
          Icon(Icons.remove_circle,color: AppColors.mainColor,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Text('1'),
          ),
          Icon(Icons.add_circle,color: AppColors.mainColor,)
        ],
      ),
    );
  }
}
