import 'package:flutter/material.dart';

import '../models/product.dart';
import 'product_details_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> featuredProducts = [
      Product(
        id: '1',
        name: 'Red Ceramic Mug Set',
        description:
            'Beautiful handcrafted ceramic mug set in vibrant red color. Perfect for your morning coffee or tea. Set includes 6 mugs.',
        price: 59.99,
        imageUrl: 'lib/assets/images/red_mug_set.jpg',
        sellerName: 'CeramicArtistry',
        category: 'Home Decor',
        rating: 4.8,
        reviewCount: 156,
        isHandmade: true,
        materials: 'Premium Ceramic, Lead-free Glaze',
        shippingTime: '5-7 days',
      ),
      Product(
        id: '2',
        name: 'Leather Bi-fold Wallet',
        description:
            'Premium handcrafted leather wallet with red interior. Features multiple card slots and bill compartments.',
        price: 45.99,
        imageUrl: 'lib/assets/images/leather_wallet.jpg',
        sellerName: 'LeatherCraftsman',
        category: 'Accessories',
        rating: 4.9,
        reviewCount: 92,
        isHandmade: true,
        materials: 'Genuine Leather, Metal Hardware',
        shippingTime: '3-5 days',
      ),
      Product(
        id: '3',
        name: 'Handwoven Cotton Scarf',
        description:
            'Elegant handwoven cotton scarf with traditional patterns. Perfect for all seasons.',
        price: 35.99,
        imageUrl: 'lib/assets/images/handwoven_cotton_scarf.jpg',
        sellerName: 'WeaveCraft',
        category: 'Accessories',
        rating: 4.7,
        reviewCount: 78,
        isHandmade: true,
        materials: '100% Organic Cotton',
        shippingTime: '3-4 days',
      ),
      Product(
        id: '4',
        name: 'Wooden Cutting Board',
        description:
            'Handcrafted wooden cutting board made from sustainable bamboo. Features juice groove and non-slip feet.',
        price: 49.99,
        imageUrl: 'lib/assets/images/wooden_cutting_board.jpg',
        sellerName: 'WoodWorks',
        category: 'Kitchen',
        rating: 4.9,
        reviewCount: 124,
        isHandmade: true,
        materials: 'Sustainable Bamboo',
        shippingTime: '4-6 days',
      ),
      Product(
        id: '5',
        name: 'Silver Pendant Necklace',
        description:
            'Handcrafted silver pendant necklace with unique geometric design. Comes with adjustable chain.',
        price: 65.99,
        imageUrl: 'lib/assets/images/silver_pendant_necklace.jpg',
        sellerName: 'SilverSmith',
        category: 'Jewelry',
        rating: 4.8,
        reviewCount: 89,
        isHandmade: true,
        materials: '925 Sterling Silver',
        shippingTime: '2-3 days',
      ),
      Product(
        id: '6',
        name: 'Macrame Wall Hanging',
        description:
            'Beautiful hand-knotted macrame wall hanging. Adds a bohemian touch to any room.',
        price: 39.99,
        imageUrl: 'lib/assets/images/marcame_wall_hanging.jpg',
        sellerName: 'KnotCraft',
        category: 'Home Decor',
        rating: 4.6,
        reviewCount: 67,
        isHandmade: true,
        materials: 'Natural Cotton Rope',
        shippingTime: '5-7 days',
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Handmade Market',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {
              Navigator.pushNamed(context, '/search');
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Featured Products Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Featured Handmade Items',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: featuredProducts.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailsPage(
                                product: featuredProducts[index],
                              ),
                            ),
                          );
                        },
                        child: _buildProductCard(featuredProducts[index]),
                      );
                    },
                  ),
                ],
              ),
            ),

            // New Arrivals Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'New Arrivals',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: featuredProducts.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetailsPage(
                                  product: featuredProducts[index],
                                ),
                              ),
                            );
                          },
                          child: _buildNewArrivalCard(featuredProducts[index]),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(Product product) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(
                product.imageUrl,
                fit: BoxFit.contain,
                width: double.infinity,
                height: 150,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[200],
                    child: const Center(
                      child: Icon(Icons.error_outline, color: Colors.grey),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    Text(
                      '${product.rating} (${product.reviewCount})',
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNewArrivalCard(Product product) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 16),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(12)),
                color: Colors.grey[100],
              ),
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.asset(
                  product.imageUrl,
                  fit: BoxFit.contain,
                  width: double.infinity,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[200],
                      child: const Center(
                        child: Icon(Icons.error_outline, color: Colors.grey),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      Text(
                        '${product.rating} (${product.reviewCount})',
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
