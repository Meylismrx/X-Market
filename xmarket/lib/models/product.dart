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
  final String sellerId;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.sellerName,
    required this.category,
    this.rating = 0.0,
    this.reviewCount = 0,
    this.isHandmade = true,
    this.materials = '',
    this.shippingTime = '3-5 days',
    required this.sellerId,
  });
}
