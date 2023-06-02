part of 'cart_products_cubit.dart';

@immutable
abstract class CartProductsState {}

class CartProductsInitial extends CartProductsState {}
class CartProductsLoading extends CartProductsState {}
class CartProductSuccess extends CartProductsState {
  final List<Cart>  products;

  CartProductSuccess({required this.products});}
class CartProductsFailed extends CartProductsState {}
