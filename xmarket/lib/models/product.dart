class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String sellerName;
  final String category;
  final double rating;
  final int reviewCount;
  final bool isHandmade;
  final String materials;
  final String shippingTime;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.sellerName,
    required this.category,
    required this.rating,
    required this.reviewCount,
    required this.isHandmade,
    required this.materials,
    required this.shippingTime,
  });
}
