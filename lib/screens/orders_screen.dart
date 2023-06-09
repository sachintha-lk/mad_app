import 'package:flutter/material.dart';
import 'package:mad_app/screens/orders/pending_orders_screen.dart';
import 'package:mad_app/screens/orders/shipped_orders_screen.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders"),
        centerTitle: true,
      ),
      body: const DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Text(
              'Orders',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TabBar(
              tabs: [
                Tab(text: 'Pending Shipment'),
                Tab(text: 'Shipped'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  PendingOrders(),
                  ShippedOrders(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
