class MenuItem {
  final String name;
  final String category;
  final String description;
  final double price;
  final String imagePath;
  final List<String> allowedCustomizations;

  MenuItem({
    required this.name,
    required this.category,
    required this.description,
    required this.price,
    required this.imagePath,
    this.allowedCustomizations = const [],
  });
}
