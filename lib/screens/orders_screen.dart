import 'package:flutter/material.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
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
                Icon(Icons.directions_car),
                Icon(Icons.directions_transit),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
