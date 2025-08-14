import 'package:flutter/material.dart';
import '../models/menu_item.dart';

class CartItemTile extends StatelessWidget {
  final Map<String, dynamic> entry;
  final VoidCallback? onRemove;

  const CartItemTile({
    required this.entry,
    this.onRemove,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dynamic itemObj = entry['item'] ?? (entry.containsKey('name') ? entry : null);

    String? imagePath;
    String title = 'Item';

    if (itemObj is MenuItem) {
      imagePath = itemObj.imagePath;
      title = itemObj.name;
    } else if (itemObj is Map) {
      imagePath = (itemObj['image'] as String?) ?? (entry['image'] as String?);
      title = (itemObj['name'] as String?) ?? (entry['name'] as String?) ?? 'Item';
    } else {
      imagePath = entry['image'] as String?;
      title = entry['name'] as String? ?? 'Item';
    }

    final Map<String, dynamic> customization =
        (entry['customization'] as Map<String, dynamic>?) ??
            (entry['options'] as Map<String, dynamic>?) ??
            {};

    final String size = (customization['Size'] ?? entry['size'] ?? 'Regular').toString();
    final List<String> optionKeys = [];

    final dynamic optsRaw = customization['Options'] ?? entry['options'];
    if (optsRaw is Map) {
      optionKeys.addAll(optsRaw.keys.map((k) => k.toString()));
    } else if (optsRaw is List) {
      optionKeys.addAll(optsRaw.map((e) => e.toString()));
    }

    final int qty = (entry['quantity'] ?? 1) is int
        ? entry['quantity'] as int
        : int.tryParse('${entry['quantity']}') ?? 1;
    final double unitPrice = ((entry['price'] ?? entry['unitPrice']) is num)
        ? (entry['price'] ?? entry['unitPrice']).toDouble()
        : 0.0;
    final double total = unitPrice * qty;

    return GestureDetector(
      onLongPress: () {
        if (onRemove != null) {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text('Remove item?'),
              content: const Text('Do you want to remove this item from the cart?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    onRemove!();
                  },
                  child: const Text('Remove'),
                ),
              ],
            ),
          );
        }
      },
      child: ListTile(
        dense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        leading: (imagePath != null && imagePath.isNotEmpty)
            ? Image.asset(
          imagePath,
          width: 44,
          height: 44,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) =>
          const SizedBox(width: 44, child: Icon(Icons.image_not_supported)),
        )
            : const SizedBox(width: 44, child: Icon(Icons.local_pizza)),
        title: Text(
          '$title x$qty',
          style: const TextStyle(fontSize: 14),
        ),
        subtitle: (optionKeys.isNotEmpty || (size != 'Regular'))
            ? Text(
          [
            if (size != 'Regular') size,
            if (optionKeys.isNotEmpty) optionKeys.join(', ')
          ].join(' · '),
          style: const TextStyle(fontSize: 11, color: Colors.grey),
        )
            : null,
        trailing: Text('₹${total.toStringAsFixed(2)}'),
      ),
    );
  }
}
