// lib/models/coffee_item.dart
class CoffeeItem {
  final String id;
  final String name;
  final String description;
  final double price;
  final double rating;
  final String category;
  final String imageUrl;

  CoffeeItem({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.rating,
    required this.category,
    required this.imageUrl,
  });

  factory CoffeeItem.fromMap(String id, Map<String, dynamic> map) {
    return CoffeeItem(
      id: id,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      price: (map['price'] ?? 0.0).toDouble(),
      rating: (map['rating'] ?? 0.0).toDouble(),
      category: map['category'] ?? '',
      imageUrl: map['image_url'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'rating': rating,
      'category': category,
      'image_url': imageUrl,
    };
  }
}
