import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mad_app/components/cards/category_card.dart';
import 'package:mad_app/components/cards/product_item_card.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> products = [];
  List<Map<String, dynamic>> featuredProducts = [];
  bool loadingError = false;

  String jsonFile = 'lib/json/productItems.json';

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  Future<void> loadProducts() async {
    try {
      final String jsonString =
          await DefaultAssetBundle.of(context).loadString(jsonFile);
      final List<dynamic> jsonList = json.decode(jsonString);
      // print(jsonList);
      if (mounted) {
        setState(() {
          products = List<Map<String, dynamic>>.from(jsonList);

          featuredProducts = products
              .where((product) => product['isFeatured'] == true)
              .toList();

          loadingError = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          loadingError = true;
        });
      }

      print('Error loading products: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Terra Cart"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
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
              height: 250.0,
              width: 1000,
              child: Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: featuredProducts.length,
                    itemBuilder: (context, index) {
                      var featuredProduct = featuredProducts[index];

                      return ProductItemCard(
                        productName: featuredProduct['name'],
                        productImg: 'lib/images/product_imgs/nike.png',
                        // productPrice: product['price'],
                        // if prodct price is int convert to double
                        productPrice: featuredProduct['price'] is int
                            ? (featuredProduct['price'] as int).toDouble()
                            : featuredProduct['price'],

                        productRating:
                            featuredProduct['rating'], // Set the product rating
                      );
                    }),
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
                      categoryImg: 'lib/images/product_imgs/nike.png',
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
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  crossAxisCount:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? 2
                          : 4,
                  childAspectRatio: 135 / 200,
                ),
                // padding: const EdgeInsets.all(10),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  var product = products[index];
                  return ProductItemCard(
                    productName: product['name'],
                    productImg: 'lib/images/product_imgs/nike.png',
                    // productPrice: product['price'],
                    // if prodct price is int convert to double
                    productPrice: product['price'] is int
                        ? (product['price'] as int).toDouble()
                        : product['price'],

                    productRating: product['rating'], // Set the product rating
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
