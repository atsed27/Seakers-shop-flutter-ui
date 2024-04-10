// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uiler/models/brand.dart';

class BrandButton extends StatelessWidget {
  final Brand brand;
  final bool isSelected;

  const BrandButton({
    super.key,
    required this.brand,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.sizeOf(context).width * 0.03,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: isSelected ? Colors.white : Colors.black38,
        ),
        color: isSelected
            ? Theme.of(context).colorScheme.primary
            : Colors.transparent,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: MediaQuery.sizeOf(context).width * 0.07,
            width: MediaQuery.sizeOf(context).width * 0.07,
            margin: EdgeInsets.only(right: 10),
            child: Image.network(
              brand.iconURL,
              color: isSelected ? Colors.white : Colors.black38,
            ),
          ),
          Text(
            brand.name,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black38,
            ),
          ),
        ],
      ),
    );
  }
}
