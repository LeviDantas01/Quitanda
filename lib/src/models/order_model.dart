import 'package:quitanda/src/pages/cart/cart_item_model.dart';

class OrderModels {
  String id;
  DateTime createdDateTime;
  DateTime overdueDateTime;
  List<CartItemModel> items;
  String status;
  String copyAndPaste;
  double total;

  OrderModels({
    required this.copyAndPaste,
    required this.createdDateTime,
    required this.id,
    required this.items,
    required this.overdueDateTime,
    required this.status,
    required this.total,
  });
}
