// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:uiler/Widget/brand_button.dart';
import 'package:uiler/data.dart';
import 'package:uiler/models/brand.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildUI(context),
    );
  }

  Widget _buildUI(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * 0.04,
          vertical: MediaQuery.sizeOf(context).height * 0.04,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _topBar(context),
            _title(context),
            _searchField(context),
            _categoriesList(context),
          ],
        ),
      ),
    );
  }

  Widget _topBar(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.06,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=62"),
          )
        ],
      ),
    );
  }

  Widget _title(BuildContext context) {
    return const Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: "Discover\n",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          TextSpan(
            text: "Get the best sneakers here ... ",
            style: TextStyle(
              color: Colors.black26,
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  Widget _searchField(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.06,
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.sizeOf(context).width * 0.04,
      ),
      width: MediaQuery.sizeOf(context).width * 1.0,
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.sizeOf(context).height * 0.02,
      ),
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(
          15,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 1,
            blurRadius: 10,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Icon(Icons.search),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.75,
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "search your favorite . . .",
                hintStyle: TextStyle(color: Colors.white),
              ),
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _categoriesList(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.05,
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.sizeOf(context).height * 0.01,
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: brands.length,
        itemBuilder: (context, index) {
          Brand brand = brands[index];
          print(index);
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: BrandButton(
              brand: brand,
              isSelected: index == 0,
            ),
          );
        },
      ),
    );
  }
}
