import 'package:flutter/material.dart';

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
          decoration: InputDecoration(
            hintText: 'Search handmade items...',
            border: InputBorder.none,
            suffixIcon: IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () => _searchController.clear(),
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
              itemCount: 0, // Replace with actual search results
              itemBuilder: (context, index) {
                return const Center(
                  child: Text('No results found'),
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
                    label: _minRating.toString(),
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
                        Navigator.pop(context);
                        // Apply filters
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
