import 'package:BookStore/bloc/cart_bloc.dart';
import 'package:BookStore/models/book.dart';
import 'package:BookStore/view/product_detail.dart';
import 'package:BookStore/view/product_item.dart';
import 'package:BookStore/view/shopping_cart.dart';
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
    return BlocListener<CartBloc, CartState>(
      listener: (context, state) {
        if (state is CartInitial) {
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
        print('CART ITEMS: $_cartItems');
      },
      child: BlocBuilder<CartBloc, CartState>(
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
                            value: BlocProvider.of<CartBloc>(context),
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
                                              // if (_cartItems
                                              //     .contains(shopItems[index])) {
                                              //   print('CONTAINS ALREADY');
                                              //   print(_cartItems
                                              //       .firstWhere((book) =>
                                              //           book.id ==
                                              //           shopItems[index].id)
                                              //       .quantity);
                                              // }
                                              _cartItems.add(shopItems[index]);
                                            });

                                            print("added ${shopItems[index]}");
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
                                                                .of<CartBloc>(
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





































// import 'package:BookStore/models/book.dart';
// import 'package:BookStore/services/books.dart';
// import 'package:BookStore/view/widgets/book_card_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// class ProductPage extends StatefulWidget {
//   const ProductPage({Key key, this.id}) : super(key: key);

//   final String id;
//   @override
//   _ProductPageState createState() => _ProductPageState();
// }

// class _ProductPageState extends State<ProductPage>{

//   List<Widget> bookList(List<Book> books) {
//     List<Widget> list = [];
//     for (Book book in books) {
//       list.add(new BookCard(book));
//     }
//     return list;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.orange.shade100,
//       ),
//       backgroundColor: Color(0xFFEEEEEE),
//       body:

//       FutureBuilder(
//           future: getBooksByGenre(widget.id),
//           builder: (context, snapshot) {
//             switch (snapshot.connectionState) {
//               case ConnectionState.waiting:
//                 return Text("Loading..");
//               default:
//                 if (snapshot.hasError) {
//                   return Text('Error');
//                 } else {
//                   return GridView.count(
//                     // Create a grid with 2 columns. If you change the scrollDirection to
//                     // horizontal, this produces 2 rows.
//                     crossAxisCount: 2,
//                     // Generate 100 widgets that display their index in the List.
//                     children: bookList(snapshot.data)
//                   );
//                 }
//             }
//           }),

//     );
//   }
// }


