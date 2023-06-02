import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:m_store/featured/cart/presentation/view_models/cart_cubit.dart';
import 'package:m_store/featured/favorite/presentation/view_models/favorites_cubit.dart';

import 'config/app_routes.dart';
import 'config/app_theme.dart';
import 'featured/auth/presentation/view_models/admin_cubit/user_cubit.dart';
import 'featured/auth/presentation/view_models/auth_cubit/auth_cubit.dart';
import 'featured/cart/presentation/view_models/cart_products/cart_products_cubit.dart';
import 'featured/category/presentation/view_model/category_cubit.dart';
import 'featured/products/data/presentation/view_model/product/product/product_cubit.dart';
import 'featured/products/data/presentation/view_model/product/products/products_list_cubit.dart';
import 'firebase_options.dart';
import 'services/locator.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage().initStorage;
  await Firebase.initializeApp(  options: DefaultFirebaseOptions.currentPlatform,
  );
  setup();

  runApp(const MStore());
}
class MStore extends StatelessWidget {
  const MStore({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(create:(context) => AuthCubit()),
        BlocProvider(create:(context) => UserCubit()),
        BlocProvider(create:(context) => CategoryCubit()),
        BlocProvider(create:(context) => ProductsListCubit()),
        BlocProvider(create:(context) => ProductCubit()),
        BlocProvider(create:(context) => CartCubit()),
        BlocProvider(create:(context) => CartProductsCubit()),
        BlocProvider(create:(context) => FavoritesCubit()),

      ],
      child: MaterialApp(
        onGenerateRoute: AppRoutes.generateRoutes,
        initialRoute: '/',
        theme: englishTheme,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

