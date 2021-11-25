import 'dart:async';

import 'package:BookStore/models/book.dart';
import 'package:BookStore/services/books.dart';
//import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'shop_event.dart';
part 'shop_state.dart';

class ShopBloc extends Bloc<ShopEvent, ShopState> {
  //s shopDataProvider = ShopDataProvider();
  ShopBloc() : super(ShopInitial()) {
    add(ShopPageInitializedEvent());
  }

  @override
  Stream<ShopState> mapEventToState(
    ShopEvent event,
  ) async* {
    if (event is ShopPageInitializedEvent) {
      BooksData shopData = await getShopItems();
      BooksData cartData = await getCartItems();
      yield ShopPageLoadedState(shopData: shopData, cartData: cartData);
    }
    if (event is ItemAddingCartEvent) {
      yield ItemAddingCartState(cartItems: event.cartItems);
    }
    if (event is ItemAddedCartEvent) {
      yield ItemAddedCartState(cartItems: event.cartItems);
    }
    if (event is ItemDeleteCartEvent) {
      yield ItemDeletingCartState(cartItems: event.cartItems);
    }
  }
}
