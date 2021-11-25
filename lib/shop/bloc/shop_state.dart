part of 'shop_bloc.dart';

abstract class ShopState extends Equatable {
  const ShopState();

  @override
  List<Object> get props => [];
}

class ShopInitial extends ShopState {}

class ShopPageLoadedState extends ShopState {
  BooksData shopData;
  BooksData cartData;

  ShopPageLoadedState({this.cartData, this.shopData});
}

class ItemAddingCartState extends ShopState {
  BooksData cartData;
  List<Book> cartItems;

  ItemAddingCartState({this.cartData, this.cartItems});
}

class ItemAddedCartState extends ShopState {
  List<Book> cartItems;

  ItemAddedCartState({this.cartItems});
}

class ItemDeletingCartState extends ShopState {
  List<Book> cartItems;

  ItemDeletingCartState({this.cartItems});
}
