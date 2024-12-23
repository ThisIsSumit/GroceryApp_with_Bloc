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
    // TODO: implement initState
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
        builder: (context, state) {
          switch (state.runtimeType) {
            case WishlistSuccessState _:
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
              return Container();
          }
        },
      ),
    );
  }
}
