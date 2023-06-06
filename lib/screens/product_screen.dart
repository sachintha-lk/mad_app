import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Nike Air Max 270",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                // height: 200,
                // width: 100,
                child: Image.asset(
                  "lib/images/product_imgs/nike.png",
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                child: Text(
                  'LKR 1,500.00',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                child: Text(
                  'Description',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget ultricies ultrices, nunc nisl ultricies nunc, eget ultricies nisl nisl eget nisl. Donec euismod, nisl eget ultricies ultrices, nunc nisl ultricies nunc, eget ultricies nisl nisl eget nisl.',
                  style: TextStyle(fontSize: 16),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                child: Text(
                  '9 in stock',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                        // alert box hello world
                      },
                      child: const Text(
                        'Add to cart',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  // increase item count
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.remove),
                      ),
                      Text(
                        '1',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                child: Text(
                  'Reviews',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),

              // review card
              Card(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // user name
                          Text(
                            'John Doe',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          // rating stars
                          RatingBarIndicator(
                            rating: 3,
                            itemBuilder: (context, index) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            itemCount: 5,
                            itemSize: 20,
                            direction: Axis.horizontal,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget ultricies ultrices, nunc nisl ultricies nunc, eget ultricies nisl nisl eget nisl. Donec euismod, nisl eget ultricies ultrices, nunc nisl ultricies nunc, eget ultricies nisl nisl eget nisl.',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 200,
                        width: 100,
                        child: Image.asset(
                          "lib/images/product_imgs/nike.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // review card
              Card(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // user name
                          Text(
                            'John Doe',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          // rating stars
                          RatingBarIndicator(
                            rating: 3,
                            itemBuilder: (context, index) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            itemCount: 5,
                            itemSize: 20,
                            direction: Axis.horizontal,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget ultricies ultrices, nunc nisl ultricies nunc, eget ultricies nisl nisl eget nisl. Donec euismod, nisl eget ultricies ultrices, nunc nisl ultricies nunc, eget ultricies nisl nisl eget nisl.',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 200,
                        width: 100,
                        child: Image.asset(
                          "lib/images/product_imgs/nike.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
