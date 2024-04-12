import 'package:flutter/material.dart';

class SizeButton extends StatelessWidget {
  final int size;
  final bool isSelected;
  const SizeButton({
    super.key,
    required this.size,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.sizeOf(context).width * 0.05,
      ),
      decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).colorScheme.primary
              : Colors.transparent),
      child: Text(
        size.toString(),
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black38,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
