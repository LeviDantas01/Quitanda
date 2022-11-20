import 'package:flutter/material.dart';
import 'package:quitanda/src/config/custom_colors.dart';

class appNameWidget extends StatelessWidget {
  final Color? greenTileColor;
  final double textSize;
  const appNameWidget({
    Key? key,
    this.greenTileColor,
    this.textSize = 30,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: TextStyle(
          fontSize: textSize,
        ),
        children: [
          TextSpan(
            text: 'Green',
            style: TextStyle(
              color: greenTileColor ?? CustomColors.customSwatchColor,
            ),
          ),
          TextSpan(
            text: 'Grocer',
            style: TextStyle(
              color: CustomColors.customContrastColor,
            ),
          ),
        ],
      ),
    );
  }
}
