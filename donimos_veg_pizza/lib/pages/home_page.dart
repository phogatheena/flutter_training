import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../utils/data.dart';
import '../models/menu_item.dart';
import '../widgets/menu_card.dart';
import 'cart_page.dart';
import 'about_us.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int section = 0;
  String search = '';
  final List<Map<String, dynamic>> cart = [];

  List<MenuItem> shown() {
    List<MenuItem> list;
    if (section == 0) {
      list = [...pizzas, ...garlics, ...bevs];
    } else if (section == 1) {
      list = pizzas;
    } else if (section == 2) {
      list = garlics;
    } else {
      list = bevs;
    }

    if (search.trim().isEmpty) return list;
    return list
        .where((m) => m.name.toLowerCase().contains(search.toLowerCase()))
        .toList();
  }

  void openCart() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => CartPage(cart: cart),
      ),
    ).then((_) {
      setState(() {});
    });
  }

  bool _customizationEquals(Map? a, Map? b) {
    a ??= {};
    b ??= {};
    if (a.length != b.length) return false;
    for (final key in a.keys) {
      if (!b.containsKey(key)) return false;
      final va = a[key];
      final vb = b[key];
      if (va is Map && vb is Map) {
        if (!_customizationEquals(va, vb)) return false;
      } else if (va is List && vb is List) {
        if (!listEquals(va, vb)) return false;
      } else {
        if (va != vb) return false;
      }
    }
    return true;
  }

  void addToCart(Map<String, dynamic> payload) {
    final MenuItem item = payload['item'];
    final int qty = (payload['quantity'] ?? 1) as int;
    final double unitPrice =
    (payload['totalPrice'] != null && payload['quantity'] != null)
        ? (payload['totalPrice'] as num) /
        (payload['quantity'] as num)
        : payload['price'] != null
        ? (payload['price'] as num).toDouble()
        : item.price;

    final Map<String, dynamic> customization = {};
    if (payload['size'] != null) customization['Size'] = payload['size'];
    if (payload['crust'] != null) customization['Crust'] = payload['crust'];
    if (payload['temperature'] != null) {
      customization['Temperature'] = payload['temperature'];
    }
    if (payload['options'] != null) customization['Options'] = payload['options'];

    setState(() {
      final existingIndex = cart.indexWhere((c) =>
      c['name'] == item.name &&
          _customizationEquals(c['customization'] as Map?, customization));

      if (existingIndex != -1) {
        cart[existingIndex]['quantity'] =
            (cart[existingIndex]['quantity'] ?? 0) + qty;
      } else {
        cart.add({
          'name': item.name,
          'image': item.imagePath,
          'price': unitPrice,
          'quantity': qty,
          'customization': customization,
        });
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Added ${item.name} x$qty to cart')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donimos Veg Pizza'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: openCart,
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.red),
              child: Text(
                'Donimos Veg Pizza',
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
            ListTile(
              title: const Text('About Us'),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) =>  AboutPage()),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search...',
              ),
              onChanged: (v) => setState(() => search = v),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ChoiceChip(
                label: const Text('All'),
                selected: section == 0,
                onSelected: (_) => setState(() => section = 0),
              ),
              ChoiceChip(
                label: const Text('Pizza'),
                selected: section == 1,
                onSelected: (_) => setState(() => section = 1),
              ),
              ChoiceChip(
                label: const Text('Garlic Bread'),
                selected: section == 2,
                onSelected: (_) => setState(() => section = 2),
              ),
              ChoiceChip(
                label: const Text('Beverages'),
                selected: section == 3,
                onSelected: (_) => setState(() => section = 3),
              ),
            ],
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: MediaQuery.of(context).size.width > 900 ? 3 : 1,
              childAspectRatio: 1.6,
              padding: const EdgeInsets.all(12),
              children: shown()
                  .map(
                    (m) => MenuCard(
                  item: m,
                  onAdd: (map) => addToCart(map),
                ),
              )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
