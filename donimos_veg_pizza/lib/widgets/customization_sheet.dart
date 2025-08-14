import 'package:flutter/material.dart';
import '../models/menu_item.dart';

class CustomizationSheet extends StatefulWidget {
  final MenuItem item;
  final void Function(Map<String, dynamic>) onAdd;
  const CustomizationSheet({
    required this.item,
    required this.onAdd,
    super.key,
  });

  @override
  State<CustomizationSheet> createState() => _CustomizationSheetState();
}

class _CustomizationSheetState extends State<CustomizationSheet> {
  String? size;
  String? crust;
  bool extraCheese = false;
  Map<String, bool> toppings = {};
  Map<String, bool> sauces = {};
  String? temperature;
  bool garlicExtra = false;
  int quantity = 1;
  String? errorMessage;

  final List<String> pizzaToppings = [
    'Onions',
    'Tomatoes',
    'Capsicum',
    'Olives',
    'Jalapeños',
    'Paneer',
    'Corn',
    'Mushrooms',
    'Chicken',
    'Pepperoni',
  ];

  final List<String> spicySauces = [
    'Barbecue',
    'Peri Peri',
    'Hot Sauce',
    'Garlic Sauce',
    'Schezwan Sauce',
  ];

  @override
  void initState() {
    super.initState();
    for (var t in pizzaToppings) {
      toppings[t] = false;
    }
    for (var s in spicySauces) {
      sauces[s] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isPizza = widget.item.category == 'Pizza';
    bool isGarlic = widget.item.category == 'Garlic';
    bool isBev = widget.item.category == 'Beverage';

    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.85,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Customize',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () => Navigator.pop(context),
                )
              ],
            ),
            const SizedBox(height: 6),
            Text(widget.item.name, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 6),

            if (errorMessage != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Text(
                  errorMessage!,
                  style: const TextStyle(color: Colors.red, fontSize: 14),
                ),
              ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (isPizza) ...[
                      SwitchListTile(
                        contentPadding: EdgeInsets.zero,
                        dense: true,
                        title: const Text('Extra Cheese (+₹40)', style: TextStyle(fontSize: 14)),
                        value: extraCheese,
                        onChanged: (v) => setState(() => extraCheese = v),
                      ),
                      const SizedBox(height: 6),

                      const Text('Crust (required)', style: TextStyle(fontSize: 14)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: ['Pan Tossed', 'Hand Tossed', 'Thin Crust'].map((c) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: ChoiceChip(
                              label: Text(c, style: const TextStyle(fontSize: 13)),
                              selected: crust == c,
                              onSelected: (_) {
                                setState(() => crust = c);
                              },
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 10),

                      const Text('Size (required)', style: TextStyle(fontSize: 14)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: ['Regular', 'Medium', 'Large'].map((s) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: ChoiceChip(
                              label: Text(s, style: const TextStyle(fontSize: 13)),
                              selected: size == s,
                              onSelected: (_) {
                                setState(() => size = s);
                              },
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 10),

                      // Toppings (multi-select with price shown)
                      const Text('Toppings (₹20 each)', style: TextStyle(fontSize: 14)),
                      Wrap(
                        spacing: 8,
                        runSpacing: 6,
                        children: pizzaToppings.map((t) {
                          return FilterChip(
                            label: Text(t, style: const TextStyle(fontSize: 13)),
                            selected: toppings[t] ?? false,
                            onSelected: (v) {
                              setState(() => toppings[t] = v);
                            },
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 10),

                      const Text('Spicy Sauces (+₹20 each)', style: TextStyle(fontSize: 14)),
                      Wrap(
                        spacing: 8,
                        runSpacing: 6,
                        children: spicySauces.map((s) {
                          return FilterChip(
                            label: Text(s, style: const TextStyle(fontSize: 13)),
                            selected: sauces[s] ?? false,
                            onSelected: (v) {
                              setState(() => sauces[s] = v);
                            },
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 12),
                    ],

                    if (isGarlic) ...[
                      SwitchListTile(
                        contentPadding: EdgeInsets.zero,
                        dense: true,
                        title: const Text('Extra Cheese (+₹40)', style: TextStyle(fontSize: 14)),
                        value: garlicExtra,
                        onChanged: (v) => setState(() => garlicExtra = v),
                      ),
                      const SizedBox(height: 12),
                    ],

                    if (isBev) ...[
                      const Text('Temperature', style: TextStyle(fontSize: 14)),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: ['Normal', 'Cold', 'Very Cold']
                            .map((t) => RadioListTile<String>(
                          contentPadding: EdgeInsets.zero,
                          dense: true,
                          title: Text(t, style: const TextStyle(fontSize: 14)),
                          value: t,
                          groupValue: temperature,
                          onChanged: (val) {
                            setState(() => temperature = val);
                          },
                        ))
                            .toList(),
                      ),
                      const SizedBox(height: 12),
                    ],
                  ],
                ),
              ),
            ),

            // Quantity selector
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  iconSize: 20,
                  onPressed: quantity > 1 ? () => setState(() => quantity--) : null,
                  icon: const Icon(Icons.remove_circle_outline),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    quantity.toString(),
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  iconSize: 20,
                  onPressed: () => setState(() => quantity++),
                  icon: const Icon(Icons.add_circle_outline),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Total price and Add button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total: ₹${(_calcTotal() * quantity).toStringAsFixed(0)}',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (isPizza && (size == null || crust == null)) {
                      setState(() {
                        errorMessage = 'Please select size and crust';
                      });
                      return;
                    }
                    if (isBev && temperature == null) {
                      setState(() => errorMessage = 'Please select temperature');
                      return;
                    }
                    setState(() => errorMessage = null);

                    // Calculate options with prices
                    final opts = <String, double>{};
                    if (isPizza) {
                      if (extraCheese) opts['Extra Cheese'] = 40;
                      sauces.forEach((key, value) {
                        if (value) opts[key] = 20;
                      });
                      toppings.forEach((key, value) {
                        if (value) opts[key] = 20;
                      });
                    }
                    if (isGarlic && garlicExtra) opts['Extra Cheese'] = 40;
                    if (isBev && temperature != null) opts[temperature!] = 0;

                    widget.onAdd({
                      'item': widget.item,
                      'size': size,
                      'crust': crust,
                      'temperature': temperature,
                      'options': opts,
                      'quantity': quantity,
                      'totalPrice': _calcTotal() * quantity,
                    });
                    Navigator.pop(context);
                  },
                  child: const Text('Add to Cart'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  double _calcTotal() {
    double add = 0;

    if (extraCheese) add += 40;
    if (garlicExtra) add += 40;

    sauces.forEach((key, value) {
      if (value) add += 20;
    });

    toppings.forEach((key, value) {
      if (value) add += 20;
    });

    if (widget.item.category == 'Pizza') {
      if (size == 'Medium') add += 150;
      if (size == 'Large') add += 300;

    }

    return widget.item.price + add;
  }
}
