import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hive/hive.dart';
import 'package:mad_app/components/bottom_nav_bar_other_pgs.dart';

import '../components/cards/review_card.dart';
import 'cart_screen.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen(
      {super.key,
      this.name = '',
      this.price = 0.0,
      this.rating = 0.0,
      this.description = '',
      this.image = 'lib/images/product_imgs/nike.png',
      this.noInStock = 0});

  final name;
  final price;
  final rating;
  final description;
  final image;
  final noInStock;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

int quantity = 0;

class _ProductScreenState extends State<ProductScreen> {
  @override
  initState() {
    super.initState();
    quantity = 0;
    print('werfghjtyhj ${widget.name} ${widget.description} ${widget.price} ');
  }

  _addToCart() async {
    final cartBox = await Hive.box('cart');

    if (quantity == 0) {
      return;
    }
    cartBox.add(CartItem(
      productName: widget.name,
      unitPrice: widget.price,
      quantity: quantity,
      image: widget.image,
    ));
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Added to cart'),
          content: Text('Added ${widget.name} to cart'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );

    print('added to cart');
  }

  _incrementQuantity() {
    setState(() {
      if (quantity < widget.noInStock) {
        quantity++;
      }
    });
  }

  _decrementQuantity() {
    setState(() {
      if (quantity > 0) {
        quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text(widget.name),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                widget.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? 20
                        : 10,
              ),
              GridView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? 1
                          : 2,
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 10,
                ),
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        height: 100,
                        child: Image.asset(
                          widget.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // align left

                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                        child: Text(
                          'LKR ${widget.price}',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      // rating stars
                      RatingBarIndicator(
                        rating: 3,
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 26,
                        direction: Axis.horizontal,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                        child: Text(
                          '${widget.noInStock} in stock',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),

                      // row with add to cart btn and icrease item count
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // add to cart btn
                          SizedBox(
                            width: 200,
                            child: FilledButton(
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              )),
                              onPressed: () {
                                _addToCart();
                              },
                              child: const Text(
                                'Add to cart',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          // increase item count
                          Row(
                            children: [
                              IconButton(
                                onPressed: _decrementQuantity,
                                icon: const Icon(Icons.remove),
                              ),
                              Text(
                                quantity.toString(),
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              IconButton(
                                onPressed: _incrementQuantity,
                                icon: const Icon(Icons.add),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                        child: Text(
                          'Description',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                        child: Text(
                          widget.description,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                child: Text(
                  'Reviews',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),

              // review card
              ReviewCard(
                reviewerName: "Jake Doe",
                rating: 4,
                review: "This is a really good product would 100% recommend",
                imgPath: "lib/images/product_imgs/nike.png",
              ),
              ReviewCard(
                reviewerName: "Mike Roberts",
                rating: 4,
                review: "This is a really good product would 100% recommend",
                imgPath: "lib/images/product_imgs/nike.png",
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBarOtherPgs(),
    );
  }
}
