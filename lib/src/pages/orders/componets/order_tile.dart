import 'package:flutter/material.dart';
import 'package:quitanda/src/models/order_model.dart';
import 'package:quitanda/src/pages/cart/cart_item_model.dart';
import 'package:quitanda/src/pages/comuns_widgets/payment_dialog.dart';
import 'package:quitanda/src/pages/orders/componets/order_status_widget.dart';
import 'package:quitanda/src/services/utils_services.dart';

class OrderTile extends StatelessWidget {
  final OrderModels order;

  OrderTile({
    super.key,
    required this.order,
  });

  final UtilServices utilServices = UtilServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
          initiallyExpanded: order.status == 'pending_payment',
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Pedido: ${order.id}"),
              Text(
                utilServices.formatDateTime(order.createdDateTime),
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          children: [
            IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      height: 150,
                      child: ListView(
                        children: order.items.map((orderItem) {
                          return _orderItemWidget(
                            utilServices: utilServices,
                            orderItem: orderItem,
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  VerticalDivider(
                    color: Colors.grey.shade300,
                    thickness: 2,
                    width: 8,
                  ),
                  Expanded(
                    flex: 2,
                    child: OrderStatusWidget(
                      status: order.status,
                      isOrverdue:
                          order.overdueDateTime.isBefore(DateTime.now()),
                    ),
                  ),
                ],
              ),
            ),
            Text.rich(
              TextSpan(
                style: const TextStyle(
                  fontSize: 20,
                ),
                children: [
                  TextSpan(
                    text: 'Total ',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: utilServices.priceToCourence(order.total),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: order.status == 'pending_payment',
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) {
                      return PaymantDialog(
                        order: order,
                      );
                    },
                  );
                },
                icon: Image.asset(
                  'assets/app_images/pix.png',
                  height: 18,
                ),
                label: const Text('Ver QR code Pix'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _orderItemWidget extends StatelessWidget {
  const _orderItemWidget({
    Key? key,
    required this.utilServices,
    required this.orderItem,
  }) : super(key: key);

  final UtilServices utilServices;
  final CartItemModel orderItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(
            '${orderItem.quantity} ${orderItem.item.unit} ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(child: Text(orderItem.item.itemName)),
          Text(utilServices.priceToCourence(orderItem.totalPrice()))
        ],
      ),
    );
  }
}
