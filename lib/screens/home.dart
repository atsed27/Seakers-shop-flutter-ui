// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uiler/Widget/brand_button.dart';
import 'package:uiler/Widget/product_card.dart';
import 'package:uiler/data.dart';
import 'package:uiler/models/brand.dart';
import 'package:uiler/models/product.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildUI(context),
      bottomNavigationBar: _bottomNavigationBar(context),
    );
  }

  Widget _bottomNavigationBar(BuildContext context) {
    return WaterDropNavBar(
      backgroundColor: Colors.white,
      bottomPadding: MediaQuery.sizeOf(context).height * 0.01,
      waterDropColor: Theme.of(context).colorScheme.primary,
      barItems: [
        BarItem(
          filledIcon: Icons.home,
          outlinedIcon: Icons.home_outlined,
        ),
        BarItem(
          filledIcon: Icons.shop,
          outlinedIcon: Icons.shop_outlined,
        ),
        BarItem(
          filledIcon: Icons.notifications,
          outlinedIcon: Icons.notifications_outlined,
        ),
        BarItem(
          filledIcon: Icons.person,
          outlinedIcon: Icons.person_outlined,
        ),
      ],
      selectedIndex: 0,
      onItemSelected: (index) {},
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
            _products(context)
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
          print(index);
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

  Widget _products(BuildContext context) {
    return Expanded(
      child: Container(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: .75,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            Product product = products[index];
            return ProductCard(
              product: product,
              margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).width * 0.02,
                vertical: MediaQuery.sizeOf(context).width * 0.02,
              ),
              onTop: () {},
            );
          },
        ),
      ),
    );
  }
}
