import 'package:flutter/material.dart';
import '../widgets/cart_item_tile.dart';

class CartPage extends StatefulWidget {
  final List<Map<String, dynamic>> cart;
  const CartPage({super.key, required this.cart});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double get totalPrice {
    double sum = 0;
    for (final c in widget.cart) {
      final price = (c['price'] ?? 0).toDouble();
      final qty = (c['quantity'] ?? 0) as int;
      sum += price * qty;
    }
    return sum;
  }

  void _changeQuantity(int index, int delta) {
    setState(() {
      final current = (widget.cart[index]['quantity'] ?? 0) as int;
      final updated = current + delta;
      if (updated <= 0) {
        widget.cart.removeAt(index);
      } else {
        widget.cart[index]['quantity'] = updated;
      }
    });
  }

  void _removeItem(int index) {
    setState(() {
      widget.cart.removeAt(index);
    });
  }

  void _placeOrder() {
    if (widget.cart.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Your cart is empty!')),
      );
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Order placed successfully!')),
    );
    setState(() {
      widget.cart.clear();
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Expanded(
              child: widget.cart.isEmpty
                  ? const Center(child: Text('No items in cart'))
                  : ListView.separated(
                itemCount: widget.cart.length,
                separatorBuilder: (_, __) => const Divider(height: 8),
                itemBuilder: (context, index) {
                  final item = widget.cart[index];
                  final qty = (item['quantity'] ?? 0) as int;
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: CartItemTile(
                          entry: item,
                          onRemove: () => _removeItem(index),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            icon: const Icon(Icons.add_circle_outline, size: 22),
                            onPressed: () => _changeQuantity(index, 1),
                          ),
                          Text('$qty', style: const TextStyle(fontSize: 14)),
                          IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            icon: const Icon(Icons.remove_circle_outline, size: 22),
                            onPressed: () => _changeQuantity(index, -1),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total: ₹${totalPrice.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  ),
                  onPressed: _placeOrder,
                  child: const Text('Place Order', style: TextStyle(fontSize: 14)),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              'Tip: Long-press any item to remove it.',
              style: TextStyle(fontSize: 11, color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }
}
