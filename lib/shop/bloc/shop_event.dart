part of 'shop_bloc.dart';

abstract class ShopEvent extends Equatable {
  const ShopEvent();

  @override
  List<Object> get props => [];
}

class ShopPageInitializedEvent extends ShopEvent {}

class ItemAddingCartEvent extends ShopEvent {
  List<Book> cartItems;

  ItemAddingCartEvent({this.cartItems});
}

class ItemAddedCartEvent extends ShopEvent {
  List<Book> cartItems;

  ItemAddedCartEvent({this.cartItems});
}

class ItemDeleteCartEvent extends ShopEvent {
  List<Book> cartItems;
  int index;
  ItemDeleteCartEvent({this.cartItems, this.index});
}
