import 'dart:ui';
import 'package:BookStore/models/book.dart';
import 'package:BookStore/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  List<Book> cartItems;
  double totalAmount = 0;
  void calculateTotalAmount(List<Book> list) {
    double res = 0;

    // print('LIST PRICE: ${list[0].price} QUANTITY: ${list[0].quantity}');

    list.forEach((element) {
      res = res + element.price;
      // print(element.price);
    });

    totalAmount = res;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is ItemAddedCartState) {
          cartItems = state.cartItems;
          calculateTotalAmount(cartItems);
        }
        if (state is ShopPageLoadedState) {
          // print('THIS IS STATE CARTDATA: ${state.cartData.booksData}');
          cartItems = state.cartData.booksData;
          print(cartItems);
          calculateTotalAmount(cartItems);
        }
        if (state is ItemDeletingCartState) {
          cartItems = state.cartItems;
          calculateTotalAmount(cartItems);
        }

        if (state is ItemAddingCartState) {
          cartItems = state.cartItems;
          calculateTotalAmount(cartItems);
        }
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.orange.shade100,
            title: Text(
              'Shopping Cart',
              style: TextStyle(color: Colors.brown),
            ),
            elevation: 0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          bottomNavigationBar: Container(
            height: 68,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 1),
                    blurRadius: 8,
                    color: Color(0xFF000000).withOpacity(0.20),
                  ),
                  BoxShadow(
                    offset: Offset(0, -1),
                    blurRadius: 3,
                    color: Color(0xFF000000).withOpacity(0.20),
                  ),
                  BoxShadow(
                    offset: Offset(0, -1),
                    blurRadius: 4,
                    color: Color(0xFF000000).withOpacity(0.14),
                  ),
                ],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                )),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Text('Total Amount'),
                  Text('\$${totalAmount.toStringAsFixed(2)}'),
                ],
              ),
            ),
          ),
          body: cartItems == null || cartItems.length == 0
              ? Center(child: Text('Your Cart is Empty'))
              : ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        height: 120,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.network(
                                    cartItems[index].image,
                                    height: 64,
                                    width: 64,
                                  ),
                                  SizedBox(width: 20),
                                  Text(cartItems[index].title),
                                  Spacer(),
                                  IconButton(
                                    icon: Icon(Icons.cancel),
                                    onPressed: () {
                                      setState(() {
                                        if (state is ShopPageLoadedState) {
                                          state.cartData.booksData
                                              .removeAt(index);
                                          calculateTotalAmount(cartItems);
                                          BlocProvider.of<CartBloc>(context)
                                            ..add(ItemDeleteCartEvent(
                                                cartItems:
                                                    state.cartData.booksData));
                                        } else if (state
                                            is ItemAddedCartState) {
                                          state.cartItems.removeAt(index);
                                          calculateTotalAmount(cartItems);

                                          BlocProvider.of<CartBloc>(context)
                                            ..add(ItemDeleteCartEvent(
                                                cartItems: state.cartItems));
                                        } else if (state
                                            is ItemDeletingCartState) {
                                          state.cartItems.removeAt(index);
                                          calculateTotalAmount(cartItems);

                                          BlocProvider.of<CartBloc>(context)
                                            ..add(ItemDeleteCartEvent(
                                                cartItems: state.cartItems));
                                        }
                                      });
                                    },
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.remove),
                                    onPressed: () {
                                      if (cartItems[index].quantity > 0)
                                        setState(() {
                                          calculateTotalAmount(cartItems);
                                          cartItems[index].quantity--;
                                        });
                                    },
                                  ),
                                  SizedBox(
                                    height: 20,
                                    width: 30,
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: 0.5)),
                                      child: Text(
                                        cartItems[index].quantity.toString(),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: () {
                                      setState(() {
                                        calculateTotalAmount(cartItems);
                                        cartItems[index].quantity++;
                                      });
                                    },
                                  ),
                                  Spacer(),
                                  Text('\$${cartItems[index].price} ')
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
        );
      },
    );
  }
}
