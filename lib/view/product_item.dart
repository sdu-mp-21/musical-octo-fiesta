import 'dart:ui';

import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key key,
    this.productImage,
    this.title,
    this.price,
    this.press,
    this.addToCart,
  }) : super(key: key);
  final String productImage, title;
  final double price;
  final Function press;
  final Function addToCart;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: press,
        child: Stack(
          children: [
            Container(
              height: 250,
              width: 165,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 30),
                      blurRadius: 60,
                      color: Color(0xFF393939).withOpacity(.1))
                ],
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: press,
                      child: Container(),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 24,
              child: FlatButton(
                  color: Colors.orange.shade100,
                  onPressed: addToCart,
                  child: Text(
                    'Add to Cart',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  )),
            ),
            Positioned(
              top: 10,
              right: 27,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  productImage,
                  height: 130,
                ),
              ),
            ),
            // Positioned(
            //   top: 150,
            //   right: 10,
            //   child: Text(
            //     title,
            //     style: TextStyle(fontWeight: FontWeight.bold),
            //   ),
            // ),
            // Positioned(
            //   top: 130,
            //   right: 50,
            //   child: Text(
            //     '\$ ${price}',
            //     textAlign: TextAlign.center,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
















// import 'dart:ui';

// import 'package:flutter/material.dart';

// class ProductItem extends StatelessWidget {
//   const ProductItem({
//     Key key,
//     this.productImage,
//     this.title,
//     this.price,
//     this.press,
//     this.addToCart,
//   }) : super(key: key);
//   final String productImage, title;
//   final double price;
//   final Function press;
//   final Function addToCart;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 10),
//       child: GestureDetector(
//         onTap: press,
//         child: Stack(
//           children: [
//             Container(
//               height: 250,
//               width: 165,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 boxShadow: [
//                   BoxShadow(
//                       offset: Offset(0, 30),
//                       blurRadius: 60,
//                       color: Color(0xFF393939).withOpacity(.1))
//                 ],
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     GestureDetector(
//                       onTap: press,
//                       child: Container(),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Positioned(
//               bottom: 0,
//               right: 34,
//               child: FlatButton(
//                   color: Colors.orange.shade100,
//                   onPressed: addToCart,
//                   child: Text(
//                     'Add to Cart',
//                     style: TextStyle(color: Colors.white, fontSize: 12),
//                   )),
//             ),
//             Positioned(
//               top: 10,
//               right: 27,
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(10),
//                 child: Image.network(
//                   productImage,
//                   height: 170,
//                 ),
//               ),
//             ),
//             // Positioned(
//             //   top: 150,
//             //   right: 10,
//             //   child: Text(
//             //     title,
//             //     style: TextStyle(fontWeight: FontWeight.bold),
//             //   ),
//             // ),
//             // Positioned(
//             //   top: 130,
//             //   right: 50,
//             //   child: Text(
//             //     '\$ ${price}',
//             //     textAlign: TextAlign.center,
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }
