import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uiler/models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final EdgeInsets margin;
  final Function onTop;
  const ProductCard({
    super.key,
    required this.product,
    required this.onTop,
    this.margin = const EdgeInsets.only(),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 1,
            blurRadius: 10,
          )
        ],
        image: DecorationImage(
          fit: BoxFit.contain,
          image: NetworkImage(product.image),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          _price(context),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product.name,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _price(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "\$${product.price.toString()}",
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Icon(
          Icons.favorite_outline,
        ),
      ],
    );
  }
}
