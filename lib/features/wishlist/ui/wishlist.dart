import 'package:bloc_tutorial/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:bloc_tutorial/features/wishlist/ui/wishlist_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  final WishlistBloc wishlistBloc = WishlistBloc();
  @override
  void initState() {
    super.initState();
    wishlistBloc.add(WishListInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("wishlist"),
      ),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        bloc: wishlistBloc,
        listener: (context, state) {},
        listenWhen: (previous, current) => current is WishlistActionState,
        buildWhen: (previous, current) => current is! WishlistActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case const (WishlistSuccessState) :
              final succesState = state as WishlistSuccessState;
              return ListView.builder(
                  itemCount: succesState.wishListItems.length,
                  itemBuilder: (context, index) {
                    return WishlistTileWidget(
                      productDataModel: succesState.wishListItems[index],
                      wishlistBloc: wishlistBloc,
                    );
                  });
            default:
              return SizedBox();
          }
        },
      ),
    );
  }
}
