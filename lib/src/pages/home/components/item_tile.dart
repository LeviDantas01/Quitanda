import 'package:flutter/material.dart';
import 'package:quitanda/src/config/custom_colors.dart';
import 'package:quitanda/src/models/item_model.dart';
import 'package:quitanda/src/pages/products/products_screen.dart';
import 'package:quitanda/src/services/utils_services.dart';

class ItemTile extends StatefulWidget {
  const ItemTile({
    super.key,
    required this.item,
    required this.cartAnimationMethod,
  });

  final void Function(GlobalKey) cartAnimationMethod;
  final ItemModel item;

  @override
  State<ItemTile> createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
  final GlobalKey imageGk = GlobalKey();

  final UtilServices utilServices = UtilServices();

  IconData iconTile = Icons.add_shopping_cart_outlined;

  Future<void> switchIcon() async {
    setState(() => iconTile = Icons.check);

    await Future.delayed(const Duration(milliseconds: 1500));
    setState(() => iconTile = Icons.add_shopping_cart_outlined);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (c) {
                  return ProductScreen(
                    item: widget.item,
                  );
                },
              ),
            );
          },
          child: Card(
            elevation: 5,
            shadowColor: Colors.grey.shade300,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // imagem
                  Expanded(
                    child: Hero(
                      tag: widget.item.imgUrl,
                      child: Container(
                        key: imageGk,
                        child: Image.asset(
                          widget.item.imgUrl,
                        ),
                      ),
                    ),
                  ),

                  // nome
                  Text(
                    widget.item.itemName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // preco
                  Row(
                    children: [
                      Text(
                        utilServices.priceToCourence(widget.item.price),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: CustomColors.customSwatchColor,
                        ),
                      ),
                      Text(
                        '/${widget.item.unit}',
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 4,
          right: 4,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(15),
              topRight: Radius.circular(20),
            ),
            child: Material(
              child: InkWell(
                onTap: () {
                  widget.cartAnimationMethod(imageGk);
                  switchIcon();
                },
                child: Ink(
                  height: 40,
                  width: 35,
                  decoration: BoxDecoration(
                    color: CustomColors.customSwatchColor,
                  ),
                  child: Icon(
                    iconTile,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
