import 'package:BookStore/models/book.dart';
import 'package:BookStore/product/product_item.dart';
import 'package:BookStore/product/prooduct_detail.dart';
import 'package:BookStore/product/shopping_cart.dart';
import 'package:BookStore/shop/bloc/shop_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPage extends StatefulWidget {
  ProductPage({Key key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<Book> shopItems;
  List<Book> _cartItems = [];
  bool loadingData = true;
  @override
  Widget build(BuildContext context) {
    return BlocListener<ShopBloc, ShopState>(
      listener: (context, state) {
        if (state is ShopInitial) {
          loadingData = true;
        } else if (state is ShopPageLoadedState) {
          shopItems = state.shopData.booksData;
          _cartItems = state.cartData.booksData;
          loadingData = false;
        }
        if (state is ItemAddedCartState) {
          _cartItems = state.cartItems;
          loadingData = false;
        }
        if (state is ItemDeletingCartState) {
          _cartItems = state.cartItems;
          loadingData = false;
        }
      },
      child: BlocBuilder<ShopBloc, ShopState>(
        builder: (context, state) {
          print("produc page state: $state");

          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.orange.shade100,
            ),
            backgroundColor: Color(0xFFEEEEEE),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.orange.shade100,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => BlocProvider.value(
                            value: BlocProvider.of<ShopBloc>(context),
                            child: ShoppingCart())));
              },
              child: Text(
                _cartItems.length.toString(),
              ),
            ),
            body: loadingData
                ? Center(
                    child: Center(
                    child: CircularProgressIndicator(),
                  ))
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 20),
                                  GridView.builder(
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 0.8,
                                        mainAxisSpacing: 16,
                                        crossAxisSpacing: 16,
                                      ),
                                      itemCount: shopItems.length,
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return ProductItem(
                                          addToCart: () {
                                            setState(() {
                                              _cartItems.add(shopItems[index]);
                                            });

                                            print("added");
                                          },
                                          productImage: shopItems[index].image,
                                          //price: shopItems[index].price,
                                          title: shopItems[index].title,
                                          press: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        BlocProvider.value(
                                                            value: BlocProvider
                                                                .of<ShopBloc>(
                                                                    context)
                                                              ..add(ItemAddingCartEvent(
                                                                  cartItems:
                                                                      _cartItems)),
                                                            child:
                                                                ProductDetail(
                                                              shopItem:
                                                                  shopItems[
                                                                      index],
                                                            ))));
                                          },
                                        );
                                      }),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}
