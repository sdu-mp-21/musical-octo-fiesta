part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class ShopPageLoadedState extends CartState {
  BooksData shopData;
  BooksData cartData;

  ShopPageLoadedState({this.cartData, this.shopData});
}

class ItemAddingCartState extends CartState {
  BooksData cartData;
  List<Book> cartItems;

  ItemAddingCartState({this.cartData, this.cartItems});
}

class ItemAddedCartState extends CartState {
  List<Book> cartItems;

  ItemAddedCartState({this.cartItems});
}

class ItemDeletingCartState extends CartState {
  List<Book> cartItems;

  ItemDeletingCartState({this.cartItems});
}
