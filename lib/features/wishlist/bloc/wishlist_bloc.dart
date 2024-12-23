import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_tutorial/data/wishlist_items.dart';
import 'package:bloc_tutorial/features/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishListInitialEvent>(wishListInitialEvent);
    on<ItemRemoveFromWishListEvent>(itemRemoveFromWishListEvent);
  }

  FutureOr<void> wishListInitialEvent(
      WishListInitialEvent event, Emitter<WishlistState> emit) {
    emit(WishlistSuccessState(wishListItems: wishlistItems));
  }

  FutureOr<void> itemRemoveFromWishListEvent(
      ItemRemoveFromWishListEvent event, Emitter<WishlistState> emit) {
    wishlistItems.remove(event.productDataModel);
    emit(WishlistSuccessState(wishListItems: wishlistItems));
  }
}
