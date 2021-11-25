import 'dart:ui';

import 'package:BookStore/models/book.dart';
import 'package:BookStore/product/shopping_cart.dart';
import 'package:BookStore/shop/bloc/shop_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//BookPage
class ProductDetail extends StatefulWidget {
  const ProductDetail({Key key, this.shopItem}) : super(key: key);

  final Book shopItem;
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  List<Book> cartItems = [];
  ScrollController _scrollController;
  bool _itemselected = false;
  @override
  Widget build(BuildContext context) {
    return BlocListener<ShopBloc, ShopState>(
      listener: (context, state) {},
      child: BlocBuilder<ShopBloc, ShopState>(
        builder: (context, state) {
          if (state is ItemAddingCartState) {
            cartItems = state.cartItems;
          }
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              elevation: 0,
              backgroundColor: Colors.orange.shade100,
            ),
            body: Padding(
              padding: EdgeInsets.all(0),
              child: Stack(
                children: [
                  CustomScrollView(
                    controller: _scrollController,
                    slivers: <Widget>[
                      SliverAppBar(
                        expandedHeight: 400,
                        flexibleSpace: Container(
                          height: 400,
                          child: Stack(
                            children: <Widget>[
                              ClipRRect(
                                child: ImageFiltered(
                                  imageFilter:
                                      ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                                  child: Image.network(widget.shopItem.image,
                                      fit: BoxFit.cover,
                                      width: double.infinity),
                                ),
                              ),
                              Align(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Image.network(widget.shopItem.image,
                                      width: 250, height: 300),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SliverFillRemaining(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              children: [
                                Container(
                                  height: 150,
                                  width: 150,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              widget.shopItem.title,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Spacer(),
                                            Text(
                                              '\$${widget.shopItem.price}',
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Quantity',
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            IconButton(
                                              icon: Icon(Icons.remove),
                                              onPressed: () {
                                                if (widget.shopItem.quantity >
                                                    0)
                                                  setState(() {
                                                    widget.shopItem.quantity--;
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
                                                        color: Colors.black,
                                                        width: 0.5)),
                                                child: Text(
                                                  widget.shopItem.quantity
                                                      .toString(),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                              icon: Icon(Icons.add),
                                              onPressed: () {
                                                setState(() {
                                                  widget.shopItem.quantity++;
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(30),
                                          child: Column(children: [
                                            Text(
                                              widget.shopItem.description,
                                              style: TextStyle(
                                                  fontStyle: FontStyle.italic),
                                            ),
                                          ]),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: TextButton(
                                        onPressed: () {
                                          if (_itemselected == false) {
                                            Book cartItem = Book(
                                              image: widget.shopItem.image,
                                              title: widget.shopItem.title,
                                              price: widget.shopItem.price,
                                              quantity:
                                                  widget.shopItem.quantity,
                                            );

                                            cartItems.add(cartItem);

                                            BlocProvider.of<ShopBloc>(context)
                                              ..add(ItemAddedCartEvent(
                                                  cartItems: cartItems));

                                            setState(() {
                                              _itemselected = true;
                                            });
                                          } else
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (_) =>
                                                    BlocProvider.value(
                                                  value:
                                                      BlocProvider.of<ShopBloc>(
                                                          context),
                                                  child: ShoppingCart(),
                                                ),
                                              ),
                                            );
                                        },
                                        child: Text(
                                          _itemselected
                                              ? 'Go to Cart'
                                              : 'Add to Cart',
                                          style: TextStyle(color: Colors.white),
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
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

// borderRadius: BorderRadius.only(
//                   topRight: Radius.circular(5),
//                   bottomRight: Radius.circular(5),
//                   bottomLeft: Radius.circular(5),
//                   topLeft: Radius.circular(5)),
//             ),
