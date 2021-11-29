part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class CartPageInitializedEvent extends CartEvent {}

class ItemAddingCartEvent extends CartEvent {
  List<Book> cartItems;

  ItemAddingCartEvent({this.cartItems});
}

class ItemAddedCartEvent extends CartEvent {
  List<Book> cartItems;

  ItemAddedCartEvent({this.cartItems});
}

class ItemDeleteCartEvent extends CartEvent {
  List<Book> cartItems;
  int index;
  ItemDeleteCartEvent({this.cartItems, this.index});
}
