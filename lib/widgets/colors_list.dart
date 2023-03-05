import 'package:flutter/material.dart';
import 'package:m_store/config/app_colors.dart';
import 'package:m_store/widgets/color_card.dart';

class ColorsList extends StatefulWidget {
  const ColorsList({Key? key, required this.colors, required this.onTap}) : super(key: key);
  final List<int> colors;
  final Function(int) onTap;
  @override
  State<ColorsList> createState() => _ColorsListState();
}

class _ColorsListState extends State<ColorsList> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 200,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          itemCount: widget.colors.length,
          itemBuilder: (context,index){
        return GestureDetector(
          onTap: (){
            setState(() {
              currentIndex = index;
            });
            widget.onTap(widget.colors[index]);
          },
          child: Container(
            height: 30,
            width: 30,
            margin: const EdgeInsets.all(3),

            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: index == currentIndex? AppColors.mainColor:Colors.transparent,
                width: 2
              ),
            ),
              child: ColorCard(colorCode:widget.colors[index] ,)
          ),
        );
      }),
    );
  }
}
