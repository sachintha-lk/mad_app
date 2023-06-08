import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderListItemCard extends StatelessWidget {
  // order no, product name, shop name, price, status variables
  final String orderNo;
  final String productName;
  final String shopName;
  final double price;
  final bool shippedStatus;

  const OrderListItemCard({
    super.key,
    required this.orderNo,
    required this.productName,
    required this.shopName,
    required this.price,
    required this.shippedStatus,
  });

  String formatPrice(double price) {
    final formatter = NumberFormat.currency(decimalDigits: 2, symbol: '');
    return formatter.format(price);
  }

  @override
  Widget build(BuildContext context) {
    final formattedPrice = formatPrice(price);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      orderNo,
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 10,
                      ),
                    ),
                    Text(productName,
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(
                      shopName,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      'LKR $formattedPrice',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            // todo make this work for both pending and shipped orders
            Text(
              shippedStatus ? 'Completed' : 'Pending',
              style: TextStyle(
                color: shippedStatus ? Colors.green : Colors.red,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
