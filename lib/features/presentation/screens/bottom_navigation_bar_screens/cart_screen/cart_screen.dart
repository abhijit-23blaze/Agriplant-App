import 'package:agriplant/features/data/products.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_iconly/flutter_iconly.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => CartItem(
          index: index,
        ),
        itemCount: 3,
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

class CartItem extends StatelessWidget {
  CartItem({super.key, required this.index});

  int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: 130,
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          elevation: 0.8,
          color: Colors.white,
          child: Row(
            children: [
              buildProductImage(),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildProductTitleInCart(context),
                    buildProductsDescriptionInCart(context),
                    const SizedBox(height: 10),
                    buildPriceAndAddProductsToCart(context)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPriceAndAddProductsToCart(BuildContext context) {
    return Row(
                    children: [
                      Text(
                        "${products[index].price}\$",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                      ),
                      Spacer(),
                      SizedBox(
                        height: 30,
                        child: ToggleButtons(
                          onPressed: (index){},
                          borderRadius: BorderRadius.circular(100.0),
                            constraints: BoxConstraints(
                              minWidth: 30 ,
                              minHeight: 30
                            ),
                            selectedColor: Theme.of(context).colorScheme.primary,
                            children: [
                              Icon(Icons.remove),
                              Text('2'),
                              Icon(Icons.add),
                            ], isSelected: [true, false, true]),
                      ),
                    ],
                  );
  }

  Widget buildProductsDescriptionInCart(BuildContext context) {
    return Text(
                    products[index].description,
                    style: Theme.of(context).textTheme.bodySmall,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  );
  }

  Widget buildProductTitleInCart(BuildContext context) {
    return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      products[index].name,
                      style:
                          Theme.of(context).textTheme.titleMedium!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                  );
  }

  Widget buildProductImage() {
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
