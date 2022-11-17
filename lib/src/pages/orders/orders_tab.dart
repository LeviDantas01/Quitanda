import 'package:flutter/material.dart';
import 'package:quitanda/src/config/app_data.dart' as appData;
import 'package:quitanda/src/pages/orders/componets/order_tile.dart';

class OrderTab extends StatelessWidget {
  const OrderTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pedidos"),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        physics: BouncingScrollPhysics(),
        separatorBuilder: (_, index) => SizedBox(height: 10),
        itemBuilder: (_, index) => OrderTile(
          order: appData.orders[index],
        ),
        itemCount: appData.orders.length,
      ),
    );
  }
}
