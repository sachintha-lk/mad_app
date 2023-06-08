import 'package:flutter/material.dart';
import 'package:mad_app/components/cards/order_list_item_card.dart';
import 'dart:convert';

class ShippedOrders extends StatefulWidget {
  const ShippedOrders({super.key});

  @override
  State<ShippedOrders> createState() => _ShippedOrdersState();
}

class _ShippedOrdersState extends State<ShippedOrders> {
  List<Map<String, dynamic>> orders = [];
  bool loadingError = false;

  String jsonFile = 'lib/json/shipped_orders_list.json';

  @override
  void initState() {
    super.initState();
    loadOrders();
  }

  Future<void> loadOrders() async {
    try {
      final String jsonString =
          await DefaultAssetBundle.of(context).loadString(jsonFile);
      final List<dynamic> jsonList = json.decode(jsonString);
      if (mounted) {
        setState(() {
          orders = List<Map<String, dynamic>>.from(jsonList);
          loadingError = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          loadingError = true;
        });
      }

      print('Error loading orders: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    loadOrders(); // Load the data every time the build method is called
    if (loadingError) {
      return Center(
        child: Text(
          'Error loading orders',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      );
    }
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  final order = orders[index];
                  return OrderListItemCard(
                    orderNo: 'Order No: ${order['orderNo']}',
                    productName: order['productName'],
                    shopName: order['shopName'],
                    price: order['price'].toDouble(),
                    shippedStatus: order['shippedStatus'],
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
