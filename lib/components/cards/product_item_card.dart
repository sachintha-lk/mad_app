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
    return formatter.format(price);
  }

  @override
  Widget build(BuildContext context) {
    final formattedProductPrice = formatPrice(productPrice);

    return Card(
      child: SizedBox(
        height: 200,
        width: 135,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
              child: Image.asset(
                productImg,
                fit: BoxFit.cover,
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
                height: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: 40,
                      child: Text(
                        productName,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 14,
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
                      itemSize: 17,
                      direction: Axis.horizontal,
                    ),
                    Text(
                      'LKR $formattedProductPrice',
                      style: const TextStyle(
                        fontSize: 14,
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
