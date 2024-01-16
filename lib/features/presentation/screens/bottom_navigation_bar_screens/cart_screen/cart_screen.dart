import 'dart:async';
import 'package:agriplant/features/data/products.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../../data/models/product.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    List cartItems = products.take(4).toList();
    final totalPrice =
        cartItems.map((item) => item.price).reduce((acc, curr) => acc + curr);
    print(cartItems);
    return Scaffold(
      appBar: customAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            SizedBox(
              height: cartItems.length * 150,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                // itemBuilder: (context, index) => CartItem(
                //   index: index,
                //   product: products[index],
                //   // onDismissed: (direction){
                //   //   setState(() {
                //   //     cartItems.removeAt(index);
                //   //     print(cartItems);
                //   //   });
                //   // },
                // ),

                itemBuilder: (context, index) => Dismissible(
                  key: Key(products[index].description) ,
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    setState(() {
                      cartItems.removeAt(index);
                      products.removeAt(index);
                    });

                  },

                  confirmDismiss: (direction) async {
                    final completer = Completer<bool>();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: const Duration(seconds: 2),
                        content: const Text('Remove From Cart ?'),
                        action: SnackBarAction(
                          label: 'Keep',
                          onPressed: () {
                            completer.complete(false);
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          },
                        ),
                      ),
                    );
                    Timer(
                      const Duration(seconds: 2),
                          () {
                        if (!completer.isCompleted) {
                          completer.complete(true);
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        }
                      },
                    );
                    return await completer.future;
                  },
                  background: buildDismissibleBackground(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: SizedBox(
                      height: 130,
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)),
                        elevation: 0.8,
                        color: Colors.white,
                        child: Row(
                          children: [
                            buildProductImage(index),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  buildProductTitleInCart(context,index),
                                  buildProductsDescriptionInCart(context,index),
                                  const SizedBox(height: 10),
                                  buildPriceAndAddProductsToCart(context,index)
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                itemCount: cartItems.length,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10).copyWith(top: 0),
              child: Row(
                children: [
                  Text(
                    'Total (${cartItems.length} items )',
                  ),
                  const Spacer(),
                  Text('$totalPrice\$',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () {},
                icon: const Icon(IconlyBold.arrowRight),
                label: const Text('Proceed To Checkout' ,),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Container buildDismissibleBackground() {
    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(12.0)),
      child: const Icon(
        IconlyLight.delete,
        color: Colors.white,
      ),
    );
  }

  Widget buildPriceAndAddProductsToCart(BuildContext context , int index) {
    return Row(
      children: [
        Text(
          "${products[index].price}\$",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const Spacer(),
        SizedBox(
          height: 30,
          child: ToggleButtons(
              onPressed: (index) {},
              borderRadius: BorderRadius.circular(100.0),
              constraints: const BoxConstraints(minWidth: 30, minHeight: 30),
              selectedColor: Theme.of(context).colorScheme.primary,
              isSelected: const [
                true,
                false,
                true
              ],
              children: const [
                Icon(Icons.remove),
                Text('2'),
                Icon(Icons.add),
              ]),
        ),
      ],
    );
  }

  Widget buildProductsDescriptionInCart(BuildContext context,int index) {
    return Text(
      products[index].description,
      style: Theme.of(context).textTheme.bodySmall,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    );
  }

  Widget buildProductTitleInCart(BuildContext context,int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Text(
        products[index].name,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildProductImage(int index) {
    return Container(
      height: double.infinity,
      width: 90,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(products[index].image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

AppBar customAppBar(context) => AppBar(
      scrolledUnderElevation: 0,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hi Wilson! 👋',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            'Enjoy Our Services !',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: IconButton.filledTonal(
            onPressed: () {},
            icon: badges.Badge(
              badgeContent: const Text(
                '3',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              position: badges.BadgePosition.topEnd(top: -13, end: -13),
              child: const Icon(
                IconlyBroken.notification,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
      ],
    );

// class CartItem extends StatefulWidget {
//   CartItem({
//     super.key,
//     required this.product,
//     // required this.onDismissed,
//     required this.index ,
//
//
//   });
//
//
//   Product product;
//   int index ;
//
//   // final Function(DismissDirection) onDismissed;
//   @override
//   State<CartItem> createState() => _CartItemState();
// }
//
// class _CartItemState extends State<CartItem> {
//
//   @override
//   Widget build(BuildContext context) {
//
//
//     return Dismissible(
//       key: Key(widget.product.name) ,
//       direction: DismissDirection.endToStart,
//       onDismissed: (direction) {
//         setState(() {
//           cartItems.removeAt(widget.index);
//           print(CartItem);
//           print( cartItems.length);
//         });
//
//       },
//
//       confirmDismiss: (direction) async {
//         final completer = Completer<bool>();
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             duration: const Duration(seconds: 2),
//             content: const Text('Remove From Cart ?'),
//             action: SnackBarAction(
//               label: 'Keep',
//               onPressed: () {
//                 completer.complete(false);
//                 ScaffoldMessenger.of(context).hideCurrentSnackBar();
//               },
//             ),
//           ),
//         );
//         Timer(
//           const Duration(seconds: 2),
//           () {
//             if (!completer.isCompleted) {
//               completer.complete(true);
//               ScaffoldMessenger.of(context).hideCurrentSnackBar();
//             }
//           },
//         );
//         return await completer.future;
//       },
//       background: buildDismissibleBackground(),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 10.0),
//         child: SizedBox(
//           height: 130,
//           child: Card(
//             clipBehavior: Clip.antiAlias,
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12.0)),
//             elevation: 0.8,
//             color: Colors.white,
//             child: Row(
//               children: [
//                 buildProductImage(),
//                 const SizedBox(width: 10),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       buildProductTitleInCart(context),
//                       buildProductsDescriptionInCart(context),
//                       const SizedBox(height: 10),
//                       buildPriceAndAddProductsToCart(context)
//                     ],
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//
//   Container buildDismissibleBackground() {
//     return Container(
//       alignment: Alignment.centerRight,
//       padding: const EdgeInsets.only(right: 20),
//       decoration: BoxDecoration(
//           color: Colors.red, borderRadius: BorderRadius.circular(12.0)),
//       child: const Icon(
//         IconlyLight.delete,
//         color: Colors.white,
//       ),
//     );
//   }
//
//   Widget buildPriceAndAddProductsToCart(BuildContext context) {
//     return Row(
//       children: [
//         Text(
//           "${widget.product.price}\$",
//           style: Theme.of(context).textTheme.titleMedium!.copyWith(
//                 color: Theme.of(context).colorScheme.primary,
//               ),
//         ),
//         const Spacer(),
//         SizedBox(
//           height: 30,
//           child: ToggleButtons(
//               onPressed: (index) {},
//               borderRadius: BorderRadius.circular(100.0),
//               constraints: const BoxConstraints(minWidth: 30, minHeight: 30),
//               selectedColor: Theme.of(context).colorScheme.primary,
//               isSelected: const [
//                 true,
//                 false,
//                 true
//               ],
//               children: const [
//                 Icon(Icons.remove),
//                 Text('2'),
//                 Icon(Icons.add),
//               ]),
//         ),
//       ],
//     );
//   }
//
//   Widget buildProductsDescriptionInCart(BuildContext context) {
//     return Text(
//       widget.product.description,
//       style: Theme.of(context).textTheme.bodySmall,
//       overflow: TextOverflow.ellipsis,
//       maxLines: 2,
//     );
//   }
//
//   Widget buildProductTitleInCart(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 5),
//       child: Text(
//         widget.product.name,
//         style: Theme.of(context).textTheme.titleMedium!.copyWith(
//               fontWeight: FontWeight.bold,
//             ),
//       ),
//     );
//   }
//
//   Widget buildProductImage() {
//     return Container(
//       height: double.infinity,
//       width: 90,
//       decoration: BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage(widget.product.image),
//           fit: BoxFit.cover,
//         ),
//       ),
//     );
//   }
// }
