part of 'favorites_cubit.dart';

@immutable
abstract class FavoritesState {}

class FavoritesInitial extends FavoritesState {}
class FavoritesLoading extends FavoritesState {}
class FavoritesSuccess extends FavoritesState {
  final List<Product>  products;
  FavoritesSuccess({required this.products});}
class FavoritesFailed extends FavoritesState {}