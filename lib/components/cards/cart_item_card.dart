import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class CartItemCard extends StatefulWidget {
  CartItemCard({
    super.key,
    required this.productName,
    this.productImage = 'lib/images/product_imgs/nike.png',
    required this.unitPrice,
    required this.quantity,
    required this.onQuantityUpdated,
  });

  final String productName;
  final String productImage;
  final double unitPrice;
  final Function(int) onQuantityUpdated;
  int quantity;

  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  String formatPrice(double price) {
    final formatter = NumberFormat.currency(decimalDigits: 2, symbol: '');
    return formatter.format(price);
  }

  double totalPrice = 0;

  void _incrementQuantity() {
    setState(() {
      widget.quantity++;

      // THIS IS THE FUNCTION PASSED FROM THE SCREEN
      // void updateCartItemQuantity(int index, int newQuantity) {
      //   setState(() {
      //     cartItems[index].quantity = newQuantity;
      //     cartItems[index].save(); // hive save
      //     calculateCartTotal();
      //   });
      // }

      widget.onQuantityUpdated(widget.quantity);
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (widget.quantity > 1) {
        widget.quantity--;

        // call back function doesnt work :( ???????
        widget.onQuantityUpdated(widget.quantity);
      }
    });
  }

  void updateTotal() {
    setState(() {
      totalPrice = widget.unitPrice * widget.quantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    updateTotal();

    var formattedUnitPrice = formatPrice(widget.unitPrice);

    var formattedTotalPrice = formatPrice(totalPrice);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            SizedBox(
              height: 50,
              width: 50,
              child: Image.asset(
                fit: BoxFit.cover,
                widget.productImage,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.productName,
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          // fontSize: 14,
                          // fontWeight: FontWeight.bold,
                        )),
                    Text(
                      'Price: $formattedUnitPrice x ${widget.quantity} units',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                    Text('LKR $formattedTotalPrice'),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Align(
                  child: InkWell(
                    child: Icon(Icons.close),
                    onTap: () {
                      // remove item from cart
                    },
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        _incrementQuantity();
                      },
                    ),
                    Text(widget.quantity.toString()),
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        _decrementQuantity();
                      },
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
