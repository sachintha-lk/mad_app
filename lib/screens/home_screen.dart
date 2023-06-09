import 'package:flutter/material.dart';
import 'package:mad_app/components/cards/category_card.dart';
import 'package:mad_app/components/cards/product_item_card.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.fromLTRB(20, 2, 0, 10),
            child: const Text(
              'Featured Products',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            height: 220.0,
            width: 1000,
            child: Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 10, // Number of products to build
                itemBuilder: (context, index) {
                  return ProductItemCard(
                    productName:
                        "Product ${index + 1}", // Generate a unique product name
                    productImg: 'lib/images/product_imgs/nike.png',
                    productPrice: 2134, // Set the product price
                    productRating: 3.4, // Set the product rating
                  );
                },
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.fromLTRB(20, 10, 0, 5),
            child: const Text(
              'Categories',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          GridView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(10),
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
                  MediaQuery.of(context).orientation == Orientation.portrait
                      ? 3
                      : 6,
              childAspectRatio: 1.0,
            ),
            children: [
              Builder(builder: (context) {
                return SizedBox(
                  width: 135,
                  height: 200,
                  child: CategoryCard(
                    categoryId: '1',
                    categoryName: 'Electronics',
                    categoryImg: 'img1',
                  ),
                );
              }),
            ],
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.fromLTRB(20, 10, 0, 5),
            child: const Text(
              'Browse Products',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10,
                crossAxisSpacing: 1,
                crossAxisCount:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? 2
                        : 4,
                childAspectRatio: 135 / 200,
              ),
              // padding: const EdgeInsets.all(10),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return ProductItemCard(
                  productName:
                      "Products ${index + 1}", // Generate a unique product name
                  productImg: 'lib/images/product_imgs/nike.png',
                  productPrice: 2134, // Set the product price
                  productRating: 3.4, // Set the product rating
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
