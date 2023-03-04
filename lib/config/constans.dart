import 'package:m_store/featured/products/data/presentation/views/home_screen.dart';
import 'package:m_store/featured/auth/presentation/views/profile_screen.dart';

import '../featured/favorite/presentation/views/favorite_screen.dart';



const List<String> sizes = [
  'S','M','L','XL','XXL'
];

const List<String> shoesSizes = [
  '38','39','40','41','42','43','44','45','46'
];

List navBarList = [
  const HomeScreen(),
  const Favorite(),
  const ProfileScreen(),
];
const String me = 'https://avatars.githubusercontent.com/u/76778467?s=400&u=c003ba31cde90a84a0be5e07f3c6157e799bd3e9&v=4';
