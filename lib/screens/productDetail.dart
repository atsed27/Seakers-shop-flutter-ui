// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:uiler/Widget/size_button.dart';
import 'package:uiler/models/product.dart';

class ProductDetail extends StatelessWidget {
  final Product product;
  const ProductDetail({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _appBar(),
      body: _buildUI(context),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      scrolledUnderElevation: 1,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.favorite_outline),
        ),
      ],
    );
  }

  Widget _buildUI(BuildContext context) {
    return Column(
      children: [
        _productImage(context),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.03,
        ),
        _productDetail(context),
      ],
    );
  }

  Widget _productImage(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.45,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          fit: BoxFit.contain,
          image: NetworkImage(product.image),
        ),
      ),
    );
  }

  Widget _productDetail(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.sizeOf(context).height * 0.02,
            horizontal: MediaQuery.sizeOf(context).width * 0.05,
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 2,
                blurRadius: 10,
              ),
            ],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                25,
              ),
              topRight: Radius.circular(
                25,
              ),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              _productTitleAndR(context),
              _productPrice(context),
              _productDescription(context),
              _sizeSelector(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _productTitleAndR(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          product.name,
          textScaler: TextScaler.linear(1.4),
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "${product.rating.toString()}",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        )
      ],
    );
  }

  Widget _productPrice(BuildContext context) {
    return Text(
      "\$${product.price.toString()}",
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w700,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }

  Widget _productDescription(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.sizeOf(context).height * 0.05,
      ),
      child: Text(product.description),
    );
  }

  Widget _sizeSelector(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(
            bottom: 15,
          ),
          child: const Text("Select a size"),
        ),
        const Row(
          children: [
            SizeButton(
              size: 8,
            ),
            SizeButton(
              size: 12,
            ),
            SizeButton(
              size: 14,
            ),
            SizeButton(
              size: 9,
            ),
          ],
        )
      ],
    );
  }
}
