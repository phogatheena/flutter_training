import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class AboutPage extends StatelessWidget {
  AboutPage({super.key});

  final LatLng _restaurantLocation = LatLng(28.794969, 75.870354);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About Us')),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          const Text(
            'Donimos Veg Pizza - Our Journey',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Donimos Veg Pizza started as a small dream in Bhiwani, Haryana. '
                'Built on a passion for vegetarian flavours and a love for classic pizza-making, '
                'we use only fresh ingredients and craft every pizza with care. '
                'Over the years, our loyal customers have made us a beloved name in the city.',
          ),
          const SizedBox(height: 12),
          const Text(
            'Location',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),

          SizedBox(
            height: 250,
            child: FlutterMap(
              options: MapOptions(
                initialCenter: _restaurantLocation,
                initialZoom: 16,
                minZoom: 5,
                maxZoom: 18,
              ),
              children: [
                TileLayer(
                  urlTemplate:
                  'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: const ['a', 'b', 'c'],
                  userAgentPackageName: 'com.example.donimos_pizza',
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: _restaurantLocation,
                      width: 80,
                      height: 80,
                      child: const Icon(
                        Icons.location_on,
                        color: Colors.red,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Back to Menu'),
          ),
        ],
      ),
    );
  }
}
