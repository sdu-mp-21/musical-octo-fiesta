import 'dart:async';
import 'package:BookStore/models/book.dart';
import 'package:BookStore/services/books.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  //s shopDataProvider = ShopDataProvider();
  CartBloc() : super(CartInitial()) {
    add(CartPageInitializedEvent());
  }

  @override
  Stream<CartState> mapEventToState(
    CartEvent event,
  ) async* {
    if (event is CartPageInitializedEvent) {
      BooksData shopData = await getShopItems();
      BooksData cartData = await getCartItems();
      print(shopData);
      print(cartData);
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
