import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';

// import 'package:cached_network_image/cached_network_image.dart';

class ProductItemCard extends StatelessWidget {
  final String productName;
  final double productRating;
  final double productPrice;
  final String productImg;

  const ProductItemCard(
      {super.key,
      required this.productName,
      required this.productImg,
      required this.productRating,
      required this.productPrice});

  String formatPrice(double price) {
    final formatter = NumberFormat.currency(decimalDigits: 2, symbol: '');
    // if type of price is int, convert to double
    if (price is int) {
      price = price.toDouble();
    }
    return formatter.format(price);
  }

  @override
  Widget build(BuildContext context) {
    final formattedProductPrice = formatPrice(productPrice);

    return Card(
      child: SizedBox(
        height: 250,
        width: 155,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
              child: SizedBox(
                height: 100,
                width: 180,
                child: Image.asset(
                  productImg,
                  fit: BoxFit.cover,
                ),
              ),
              // child: Image.network(
              //     height: 100,
              //     width: 135,
              //     fit: BoxFit.cover,
              //     'https://images.unsplash.com/photo-1572635196237-14b3f281503f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80'),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(13, 10, 13, 2),
              child: SizedBox(
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: 70,
                      child: Text(
                        productName,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    RatingBarIndicator(
                      rating: productRating,
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 19,
                      direction: Axis.horizontal,
                    ),
                    Text(
                      'LKR $formattedProductPrice',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
