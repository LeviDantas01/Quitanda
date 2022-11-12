import 'package:flutter/material.dart';
import 'package:quitanda/src/config/custom_colors.dart';
import 'package:quitanda/src/pages/cart/cart_item_model.dart';
import 'package:quitanda/src/pages/comuns_widgets/quantity_widget.dart';
import 'package:quitanda/src/services/utils_services.dart';

class CartTile extends StatelessWidget {
  final CartItemModel cartItem;

  CartTile({
    super.key,
    required this.cartItem,
  });

  final UtilServices utilServices = UtilServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        leading: Image.asset(
          cartItem.item.imgUrl,
          height: 60,
          width: 60,
        ),
        title: Text(
          cartItem.item.itemName,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        // total

        subtitle: Text(
          utilServices.priceToCourence(
            cartItem.totalPrice(),
          ),
          style: TextStyle(
            color: CustomColors.customSwatchColor,
            fontWeight: FontWeight.bold,
          ),
        ),

        trailing: QuantityWidgets(
          suffixText: cartItem.item.unit,
          value: cartItem.quantity,
          resulut: (quantity) {},
        ),
      ),
    );
  }
}
