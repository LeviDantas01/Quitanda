import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:quitanda/src/config/custom_colors.dart';

class OrderStatusWidget extends StatelessWidget {
  final String status;
  final bool isOrverdue;

  const OrderStatusWidget({
    super.key,
    required this.status,
    required this.isOrverdue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _StatusDot(
          titile: "Teste de pagamento",
          isActive: true,
        ),
      ],
    );
  }
}

class _StatusDot extends StatelessWidget {
  const _StatusDot({
    super.key,
    required this.isActive,
    required this.titile,
  });

  final bool isActive;
  final String titile;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: CustomColors.customSwatchColor,
            ),
            color:
                isActive ? CustomColors.customSwatchColor : Colors.transparent,
          ),
          child: isActive
              ? const Icon(
                  Icons.check,
                  size: 13,
                  color: Colors.white,
                )
              : const SizedBox.shrink(),
        ),
        SizedBox(
          height: 30,
        ),
        Expanded(
          child: Text(titile),
        ),
      ],
    );
  }
}
