import 'package:flutter/material.dart';
import 'product.dart';



class BottomSheetWidget extends StatefulWidget {
  final Product product;
  final Function(Product) addToCart;

  const BottomSheetWidget({Key? key, required this.product, required this.addToCart}) : super(key: key);

  @override
  _BottomSheetWidgetState createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  int quantity = 1;

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decrementQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            widget.product.imagePath,
            fit: BoxFit.cover,
            height: 150.0,
          ),
          const SizedBox(height: 16.0),
          Text(
            widget.product.name,
            style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8.0),
          Text(
            '\$${widget.product.price.toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 18.0, color: Colors.green),
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: decrementQuantity,
              ),
              Text(
                quantity.toString(),
                style: const TextStyle(fontSize: 20.0),
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: incrementQuantity,
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
               widget.addToCart(widget.product);
            },
            child: const Text('Add to Cart'),
          ),
        ],
      ),
    );
  }
}
