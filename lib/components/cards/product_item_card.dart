import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:cached_network_image/cached_network_image.dart';

class ProductItemCard extends StatelessWidget {
  final String productName;
  final double productRating;
  final double productPrice;
  // final String productImgUrl;

  const ProductItemCard(
      {super.key,
      required this.productName,
      required this.productRating,
      required this.productPrice});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 200,
        width: 135,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
              child: SizedBox(
                height: 100,
                width: 135,
                child: SizedBox(
                  height: 100,
                  width: 135,
       


                  // child: CachedNetworkImage(
                  //   fit: BoxFit.fill,
                  //   imageUrl:
                  //       "https://images.unsplash.com/photo-1572635196237-14b3f28103f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80",
                  //   placeholder: (context, url) => const SizedBox(
                  //     // height: 7,
                  //     // width: 7,
                  //     child: CircularProgressIndicator(),
                  //   ),
                  //   // errorWidget: (context, url, error) => const Icon(Icons.error),
                  //   errorWidget: (context, url, error) => const SizedBox(
                  //     // height: 7,
                  //     // width: 7,
                  //     child: Icon(Icons.error),
                  //   ),
                  // ),
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
                      itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 17,
                      direction: Axis.horizontal,
                    ),
                    Text(
                      'LKR $productPrice',
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
