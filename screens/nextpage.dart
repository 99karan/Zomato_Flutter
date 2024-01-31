import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

import 'cartprovider.dart';
import 'product.dart';
import 'package:provider/provider.dart';

import 'shimmercard.dart';




class NextPage extends StatefulWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  final databaseReference = FirebaseDatabase.instance.reference();

  List<Product> cartItems = [];
  List<Product> products = [
    Product(name: "P 01", price: 140, imagePath: "assets/images/1image.jpeg"),
    Product(name: "P 02", price: 150, imagePath: "assets/images/2image.jpeg"),
    Product(name: "P 03", price: 82, imagePath: "assets/images/category/ic_frame2.jpg"),
    Product(name: "P 04", price: 68, imagePath: "assets/images/category/ic_frame9.jpg"),
    Product(name: "P 05", price: 80, imagePath: "assets/images/img2.jpeg"),
  ];

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    initializeFirebase();
    // Simulate loading for a few seconds
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      body: ListView.builder(
        itemCount: isLoading ? 5 : products.length,
        itemBuilder: (BuildContext context, int index) {
          return isLoading
              ? buildShimmerCard()
              : GestureDetector(
                  onTap: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return BottomSheetWidget(product: products[index], addToCart: addToCart);
                      },
                    );
                  },
                  child: buildCard(products[index]),
                );
        },
      ),
    );
  }

  Widget buildCard(Product product) {
    return Card(
      child: Column(
        children: [
          Image.asset(
            product.imagePath,
            fit: BoxFit.cover,
            height: 150.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Rs${product.price.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 16.0, color: Colors.green),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildShimmerCard() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Card(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150.0,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 150.0,
                    height: 20.0,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 8.0),
                  Container(
                    width: 100.0,
                    height: 16.0,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addToCart(Product product) {
  context.read<CartProvider>().addToCart(product);
}

  

  void initializeFirebase() async {
    await Firebase.initializeApp();
  }
}
