part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistState {}

final class WishlistInitial extends WishlistState {}

abstract class WishlistActionState extends WishlistState{}

class WishlistSuccessState extends WishlistState{
  final List<ProductDataModel> wishListItems;
  WishlistSuccessState({
    required this.wishListItems,
  });
}
