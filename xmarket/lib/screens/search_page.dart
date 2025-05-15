import 'package:flutter/material.dart';

import '../models/product.dart';
import 'product_details_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedCategory = 'All';
  RangeValues _priceRange = const RangeValues(0, 1000);
  double _minRating = 0;

  final List<Product> _allProducts = [
    // Home Decor Products
    Product(
      id: '1',
      name: 'Red Ceramic Mug Set',
      description:
          'Beautiful handcrafted ceramic mug set in vibrant red color. Perfect for your morning coffee or tea. Set includes 6 mugs.',
      sellerId: 'ceramic_artistry@example.com',
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
      name: 'Macrame Wall Hanging',
      description:
          'Beautiful hand-knotted macrame wall hanging. Adds a bohemian touch to any room.',
      sellerId: 'knot_craft@example.com',
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
    Product(
      id: '3',
      name: 'Handmade Ceramic Vase',
      description:
          'Elegant hand-thrown ceramic vase with unique glaze pattern. Perfect for fresh flowers.',
      sellerId: 'ceramic_artistry@example.com',
      price: 45.99,
      imageUrl: 'lib/assets/images/handmade_ceramic_vase.jpg',
      sellerName: 'CeramicArtistry',
      category: 'Home Decor',
      rating: 4.7,
      reviewCount: 89,
      isHandmade: true,
      materials: 'Premium Ceramic, Lead-free Glaze',
      shippingTime: '4-6 days',
    ),
    Product(
      id: '4',
      name: 'Wooden Photo Frame',
      description:
          'Handcrafted wooden photo frame with natural finish. Perfect for your favorite memories.',
      sellerId: 'wood_works@example.com',
      price: 29.99,
      imageUrl: 'lib/assets/images/wooden_photo_frame.jpg',
      sellerName: 'WoodWorks',
      category: 'Home Decor',
      rating: 4.5,
      reviewCount: 42,
      isHandmade: true,
      materials: 'Sustainable Wood',
      shippingTime: '3-5 days',
    ),

    // Accessories Products
    Product(
      id: '5',
      name: 'Leather Bi-fold Wallet',
      description:
          'Premium handcrafted leather wallet with red interior. Features multiple card slots and bill compartments.',
      sellerId: 'leather_craftsman@example.com',
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
      id: '6',
      name: 'Handwoven Cotton Scarf',
      description:
          'Elegant handwoven cotton scarf with traditional patterns. Perfect for all seasons.',
      sellerId: 'weave_craft@example.com',
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
      id: '7',
      name: 'Leather Crossbody Bag',
      description:
          'Handcrafted leather crossbody bag with adjustable strap. Perfect for everyday use.',
      sellerId: 'leather_craftsman@example.com',
      price: 79.99,
      imageUrl: 'lib/assets/images/leather_crossbody_bag.jpg',
      sellerName: 'LeatherCraftsman',
      category: 'Accessories',
      rating: 4.8,
      reviewCount: 124,
      isHandmade: true,
      materials: 'Genuine Leather, Metal Hardware',
      shippingTime: '4-6 days',
    ),
    Product(
      id: '8',
      name: 'Handmade Silk Scarf',
      description:
          'Luxurious hand-painted silk scarf with unique design. Adds elegance to any outfit.',
      sellerId: 'silk_art@example.com',
      price: 55.99,
      imageUrl: 'lib/assets/images/handmade_silk_scarf.jpg',
      sellerName: 'SilkArt',
      category: 'Accessories',
      rating: 4.9,
      reviewCount: 56,
      isHandmade: true,
      materials: '100% Silk',
      shippingTime: '2-3 days',
    ),

    // Kitchen Products
    Product(
      id: '9',
      name: 'Wooden Cutting Board',
      description:
          'Handcrafted wooden cutting board made from sustainable bamboo. Features juice groove and non-slip feet.',
      sellerId: 'wood_works@example.com',
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
      id: '10',
      name: 'Handmade Ceramic Bowl Set',
      description:
          'Set of 4 hand-thrown ceramic bowls with unique glaze patterns. Perfect for serving.',
      sellerId: 'ceramic_artistry@example.com',
      price: 69.99,
      imageUrl: 'lib/assets/images/handmade_ceramic_bowl_set.jpg',
      sellerName: 'CeramicArtistry',
      category: 'Kitchen',
      rating: 4.8,
      reviewCount: 98,
      isHandmade: true,
      materials: 'Premium Ceramic, Lead-free Glaze',
      shippingTime: '5-7 days',
    ),
    Product(
      id: '11',
      name: 'Wooden Utensil Set',
      description:
          'Set of 5 handcrafted wooden cooking utensils. Made from sustainable wood.',
      sellerId: 'wood_works@example.com',
      price: 39.99,
      imageUrl: 'lib/assets/images/wooden_utensils_set.jpg',
      sellerName: 'WoodWorks',
      category: 'Kitchen',
      rating: 4.7,
      reviewCount: 76,
      isHandmade: true,
      materials: 'Sustainable Wood',
      shippingTime: '3-5 days',
    ),
    Product(
      id: '12',
      name: 'Handmade Ceramic Plates',
      description:
          'Set of 6 hand-thrown ceramic dinner plates with unique designs.',
      sellerId: 'ceramic_artistry@example.com',
      price: 89.99,
      imageUrl: 'lib/assets/images/handmade_ceramic_plates.jpg',
      sellerName: 'CeramicArtistry',
      category: 'Kitchen',
      rating: 4.9,
      reviewCount: 112,
      isHandmade: true,
      materials: 'Premium Ceramic, Lead-free Glaze',
      shippingTime: '5-7 days',
    ),

    // Jewelry Products
    Product(
      id: '13',
      name: 'Silver Pendant Necklace',
      description:
          'Handcrafted silver pendant necklace with unique geometric design. Comes with adjustable chain.',
      sellerId: 'silver_smith@example.com',
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
      id: '14',
      name: 'Handmade Beaded Bracelet',
      description:
          'Beautiful beaded bracelet with semi-precious stones. Adjustable size.',
      sellerId: 'bead_craft@example.com',
      price: 29.99,
      imageUrl: 'lib/assets/images/handmade_beaded_bracelet.jpg',
      sellerName: 'BeadCraft',
      category: 'Jewelry',
      rating: 4.6,
      reviewCount: 45,
      isHandmade: true,
      materials: 'Semi-precious Stones, Sterling Silver',
      shippingTime: '2-3 days',
    ),
    Product(
      id: '15',
      name: 'Gold-plated Hoop Earrings',
      description: 'Handcrafted gold-plated hoop earrings with unique texture.',
      sellerId: 'gold_craft@example.com',
      price: 39.99,
      imageUrl: 'lib/assets/images/gold-plated_hoop_earrings.jpg',
      sellerName: 'GoldCraft',
      category: 'Jewelry',
      rating: 4.7,
      reviewCount: 67,
      isHandmade: true,
      materials: 'Gold-plated Brass',
      shippingTime: '2-3 days',
    ),
    Product(
      id: '16',
      name: 'Handmade Gemstone Ring',
      description:
          'Unique handcrafted ring featuring natural gemstone. Available in various sizes.',
      sellerId: 'ceramic_artistry@example.com',
      price: 49.99,
      imageUrl: 'lib/assets/images/handmade_gemstone_ring.jpg',
      sellerName: 'GemCraft',
      category: 'Jewelry',
      rating: 4.8,
      reviewCount: 78,
      isHandmade: true,
      materials: 'Natural Gemstone, Sterling Silver',
      shippingTime: '2-3 days',
    ),

    // Crafts Products
    Product(
      id: '17',
      name: 'Handmade Leather Journal',
      description:
          'Beautiful handcrafted leather journal with handmade paper. Perfect for writing and sketching.',
      sellerId: 'leather_craftsman@example.com',
      price: 34.99,
      imageUrl: 'lib/assets/images/handmade_leather_journal.jpg',
      sellerName: 'LeatherCraftsman',
      category: 'Crafts',
      rating: 4.7,
      reviewCount: 56,
      isHandmade: true,
      materials: 'Leather, Paper',
      shippingTime: '3-4 days',
    ),
    Product(
      id: '18',
      name: 'Handmade Wooden Box',
      description:
          'Elegant handcrafted wooden box with brass hardware. Perfect for storing jewelry or keepsakes.',
      sellerId: 'wood_works@example.com',
      price: 49.99,
      imageUrl: 'lib/assets/images/handmade_wooden_box.jpg',
      sellerName: 'WoodWorks',
      category: 'Crafts',
      rating: 4.6,
      reviewCount: 42,
      isHandmade: true,
      materials: 'Wood, Brass',
      shippingTime: '3-4 days',
    ),
    Product(
      id: '19',
      name: 'Handmade Ceramic Planter',
      description:
          'Beautiful hand-thrown ceramic planter with drainage hole. Perfect for your plants.',
      sellerId: 'ceramic_artistry@example.com',
      price: 39.99,
      imageUrl: 'lib/assets/images/handmade_ceramic_planter.jpg',
      sellerName: 'CeramicArtistry',
      category: 'Crafts',
      rating: 4.5,
      reviewCount: 34,
      isHandmade: true,
      materials: 'Ceramic, Drainage Hole',
      shippingTime: '3-4 days',
    ),
    Product(
      id: '20',
      name: 'Handmade Leather Belt',
      description:
          'Premium handcrafted leather belt with brass buckle. Adjustable size.',
      sellerId: 'leather_craftsman@example.com',
      price: 45.99,
      imageUrl: 'lib/assets/images/handmade_leather_belt.jpg',
      sellerName: 'LeatherCraftsman',
      category: 'Crafts',
      rating: 4.6,
      reviewCount: 38,
      isHandmade: true,
      materials: 'Leather, Brass',
      shippingTime: '2-3 days',
    ),
  ];

  List<Product> get _filteredProducts {
    var filtered = _allProducts;

    // Apply category filter
    if (_selectedCategory != 'All') {
      filtered = filtered
          .where((product) => product.category == _selectedCategory)
          .toList();
    }

    // Apply search text filter
    if (_searchController.text.isNotEmpty) {
      final searchText = _searchController.text.toLowerCase();
      filtered = filtered.where((product) {
        return product.name.toLowerCase().contains(searchText) ||
            product.description.toLowerCase().contains(searchText) ||
            product.category.toLowerCase().contains(searchText);
      }).toList();
    }

    return filtered;
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {}); // Trigger rebuild when search text changes
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: TextField(
          controller: _searchController,
          onChanged: (value) {
            setState(() {}); // Trigger rebuild when text changes
          },
          decoration: InputDecoration(
            hintText: 'Search handmade items...',
            border: InputBorder.none,
            suffixIcon: IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                _searchController.clear();
                setState(() {}); // Trigger rebuild when cleared
              },
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list, color: Colors.black),
            onPressed: _showFilterBottomSheet,
          ),
        ],
      ),
      body: Column(
        children: [
          // Categories
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildCategoryChip('All'),
                _buildCategoryChip('Home Decor'),
                _buildCategoryChip('Accessories'),
                _buildCategoryChip('Kitchen'),
                _buildCategoryChip('Jewelry'),
                _buildCategoryChip('Crafts'),
              ],
            ),
          ),

          // Search Results
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: _filteredProducts.length,
              itemBuilder: (context, index) {
                final product = _filteredProducts[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailsPage(
                          product: product,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(12),
                            ),
                            child: Image.asset(
                              product.imageUrl,
                              fit: BoxFit.contain,
                              width: double.infinity,
                              height: 150,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: Colors.grey[200],
                                  child: const Center(
                                    child: Icon(Icons.error_outline,
                                        color: Colors.grey),
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
                                  const Icon(Icons.star,
                                      color: Colors.amber, size: 16),
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
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(String category) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: FilterChip(
        label: Text(category),
        selected: _selectedCategory == category,
        onSelected: (selected) {
          setState(() {
            _selectedCategory = selected ? category : 'All';
          });
        },
        backgroundColor: Colors.white,
        selectedColor: Colors.green.withOpacity(0.2),
        checkmarkColor: Colors.green,
      ),
    );
  }

  void _showFilterBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Filters',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Price Range
                  const Text(
                    'Price Range',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  RangeSlider(
                    values: _priceRange,
                    min: 0,
                    max: 1000,
                    divisions: 20,
                    labels: RangeLabels(
                      '\$${_priceRange.start.round()}',
                      '\$${_priceRange.end.round()}',
                    ),
                    onChanged: (values) {
                      setState(() {
                        _priceRange = values;
                      });
                    },
                  ),

                  // Rating Filter
                  const Text(
                    'Minimum Rating',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Slider(
                    value: _minRating,
                    min: 0,
                    max: 5,
                    divisions: 5,
                    label: _minRating.toStringAsFixed(1),
                    onChanged: (value) {
                      setState(() {
                        _minRating = value;
                      });
                    },
                  ),

                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: Apply filters
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text(
                        'Apply Filters',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
