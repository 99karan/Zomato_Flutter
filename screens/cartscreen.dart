// ignore_for_file: avoid_print

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'product.dart';
import 'package:uuid/uuid.dart';
import 'cartprovider.dart'; // Import your CartProvider class

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key, required List cartItems}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cartItems = context.watch<CartProvider>().cartItems;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: isLoading
          ? _buildLoadingCart()
          : Column(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      return _buildCartItem(cartItems[index]);
                    },
                  ),
                ),
                Text('Total Amount: Rs${_calculateTotalAmount()}',
                    style: const TextStyle(fontSize: 20.0)),
                ElevatedButton(
                  onPressed: () {
                    _saveCartDataToFirebase();
                  },
                  child: const Text('Save to Firebase'),
                ),
              ],
            ),
    );
  }

  Widget _buildCartItem(Product product) {
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
                  '\$${product.price.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 16.0, color: Colors.green),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingCart() {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return _buildShimmerCard();
      },
    );
  }

  Widget _buildShimmerCard() {
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

  double _calculateTotalAmount() {
    final cartItems = Provider.of<CartProvider>(context, listen: false).cartItems;

    double total = 0.0;
    for (var cartItem in cartItems) {
      total += cartItem.price;
    }
    return total;
  }
void _saveCartDataToFirebase() {
  const uuid = Uuid(); // Create a Uuid object

  try {
    final DatabaseReference cartRef = FirebaseDatabase.instance.reference().child('carts');

    
    final String cartId = uuid.v4(); // Generate a unique identifier
    
   final cartItems = Provider.of<CartProvider>(context, listen: false).cartItems;


    
    final cartData = {
      'cartItems': cartItems.map((item) {
        return {
          'name': item.name,
          'price': item.price,
          'imagePath': item.imagePath,
        };
      }).toList(),
      'totalAmount': _calculateTotalAmount(),
    };

    cartRef.child(cartId).set(cartData);

    // Reset the cart after saving
    Provider.of<CartProvider>(context, listen: false).clearCart();

    print('Cart data saved');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Cart data saved to Firebase')),
    );
  } catch (error) {
    print('Error saving data to Firebase: $error');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Error saving data to Firebase')),
    );
  }
}


}
