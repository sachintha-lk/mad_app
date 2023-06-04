import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String categoryId;
  final String categoryName;
  final String categoryImg;
  // final String categoryUrl;

  const CategoryCard({
    super.key,
    required this.categoryId,
    required this.categoryName,
    required this.categoryImg,
    // required this.categoryUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 10,
        width: 10,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "https://images.unsplash.com/photo-1567030849710-a50bbc3e16c9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80"),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          height: 10,
          width: 10,
          child: Text(
            categoryName,
            style: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
          ),
        ),

        // get image from network without CashedNetworkImage handle errors

        // child: CachedNetworkImage(
        //   fit: BoxFit.fill,
        //   imageUrl:
        //       "https://images.unsplash.com/photo-1567030849710-a50bbc3e16c9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80",
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
    );
  }
}
