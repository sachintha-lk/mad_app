import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    super.key,
    required this.reviewerName,
    required this.rating,
    required this.review,
    required this.imgPath,
  });

  final String reviewerName;
  final double rating;
  final String review;
  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
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
                    reviewerName,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  // rating stars
                  RatingBarIndicator(
                    rating: rating,
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
                  // "This is the best product I've ever bought from this store. I'm really happy with the quality of the product. I would recommend this product to anyone who's looking for a good quality product.",
                  review,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(
                // height: Orientation.portrait == Orientation.portrait
                //     ? 100
                //     : 200,

                // width: Orientation.portrait == Orientation.portrait
                //     ? 100
                //     : 200,

                height: 200,
                width: 10,
                child: Image.asset(
                  imgPath,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
