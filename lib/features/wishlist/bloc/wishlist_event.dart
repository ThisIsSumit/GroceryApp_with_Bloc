part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistEvent {}

class WishListInitialEvent extends WishlistEvent{}

class ItemRemoveFromWishListEvent extends WishlistEvent {
  final ProductDataModel productDataModel;
  ItemRemoveFromWishListEvent({
    required this.productDataModel,
  });
}