import 'package:flutter/material.dart';
import 'package:m_store/config/app_colors.dart';
import 'package:m_store/config/constans.dart';
import 'package:ionicons/ionicons.dart';

import '../config/app_routes.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _index = 0;
  void _onItemTapped(int index) {
    setState(() {
      _index= index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return
       Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('MStore'),
          elevation: 0.0,
          backgroundColor: AppColors.mainColor,
          actions: [IconButton(onPressed: (){
            Navigator.pushNamed(context, AppRoutes.cart);
          }, icon: const Icon(Icons.shopping_cart_outlined))],
        ),
        body: navBarList[_index],
         bottomNavigationBar: BottomNavigationBar(
           selectedItemColor: AppColors.mainColor,
           unselectedItemColor: AppColors.secondaryColor,
           backgroundColor: Colors.transparent,
           elevation: 0,
           items: const <BottomNavigationBarItem>[
             BottomNavigationBarItem(
               icon: Icon(Ionicons.storefront_outline),
               label: '',
             ),
             BottomNavigationBarItem(
               icon: Icon(Ionicons.heart_outline),
               label: '',
             ),
             BottomNavigationBarItem(
               icon: Icon(Ionicons.person_outline),
               label: '',
             ),
           ],
           currentIndex: _index,
           onTap: _onItemTapped,
         ),
    );

  }
}
