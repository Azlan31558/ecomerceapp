import 'package:flutter/material.dart';
import 'package:newecommapp/cart.dart';
import 'package:newecommapp/categoryproduct.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // ===========================================================
  // THEME
  // ===========================================================

  static const Color primary = Color(0xFF111827);
  static const Color accent = Color(0xFFD4A017);
  static const Color background = Color(0xFFF8F7F3);

  final TextEditingController searchController =
      TextEditingController();

  String query = '';

  // ===========================================================
  // DEMO PRODUCTS
  // ===========================================================

  final List<Map<String, dynamic>> allProducts = [
    {
      'name': 'Classic Black T-Shirt',
      'price': 2500,
      'category': 'Men',
      'icon': Icons.checkroom_rounded,
      'color1': Color(0xFF111827),
      'color2': Color(0xFFD4A017),
    },
    {
      'name': 'Premium Denim Jacket',
      'price': 4800,
      'category': 'Men',
      'icon': Icons.checkroom_rounded,
      'color1': Color(0xFF111827),
      'color2': Color(0xFFD4A017),
    },
    {
      'name': 'Slim Fit Jeans',
      'price': 3500,
      'category': 'Men',
      'icon': Icons.shopping_bag_rounded,
      'color1': Color(0xFF111827),
      'color2': Color(0xFFD4A017),
    },
    {
      'name': 'Casual Hoodie',
      'price': 4200,
      'category': 'Men',
      'icon': Icons.checkroom_rounded,
      'color1': Color(0xFF111827),
      'color2': Color(0xFFD4A017),
    },
    {
      'name': 'Elegant Women Dress',
      'price': 5500,
      'category': 'Women',
      'icon': Icons.woman_rounded,
      'color1': Color(0xFF111827),
      'color2': Color(0xFFD4A017),
    },
    {
      'name': 'Women Hand Bag',
      'price': 3800,
      'category': 'Women',
      'icon': Icons.shopping_bag_rounded,
      'color1': Color(0xFF111827),
      'color2': Color(0xFFD4A017),
    },
    {
      'name': 'Stylish Heels',
      'price': 4500,
      'category': 'Women',
      'icon': Icons.shopping_bag_rounded,
      'color1': Color(0xFF111827),
      'color2': Color(0xFFD4A017),
    },
    {
      'name': 'Women Summer Top',
      'price': 2800,
      'category': 'Women',
      'icon': Icons.checkroom_rounded,
      'color1': Color(0xFF111827),
      'color2': Color(0xFFD4A017),
    },
    {
      'name': 'Kids Casual Outfit',
      'price': 2200,
      'category': 'Kids',
      'icon': Icons.child_care_rounded,
      'color1': Color(0xFF111827),
      'color2': Color(0xFFD4A017),
    },
    {
      'name': 'Kids Winter Jacket',
      'price': 3200,
      'category': 'Kids',
      'icon': Icons.checkroom_rounded,
      'color1': Color(0xFF111827),
      'color2': Color(0xFFD4A017),
    },
    {
      'name': 'Kids Sneakers',
      'price': 2900,
      'category': 'Kids',
      'icon': Icons.directions_run_rounded,
      'color1': Color(0xFF111827),
      'color2': Color(0xFFD4A017),
    },
    {
      'name': 'Kids Summer T-Shirt',
      'price': 1800,
      'category': 'Kids',
      'icon': Icons.checkroom_rounded,
      'color1': Color(0xFF111827),
      'color2': Color(0xFFD4A017),
    },
  ];

  // ===========================================================
  // FILTERED PRODUCTS
  // ===========================================================

  List<Map<String, dynamic>> get filteredProducts {
    if (query.trim().isEmpty) {
      return [];
    }

    return allProducts.where((product) {
      final name = product['name'].toString().toLowerCase();
      final category =
          product['category'].toString().toLowerCase();
      final search = query.toLowerCase();

      return name.contains(search) ||
          category.contains(search);
    }).toList();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  // ===========================================================
  // CLEAR SEARCH
  // ===========================================================

  void clearSearch() {
    searchController.clear();

    setState(() {
      query = '';
    });
  }

  // ===========================================================
  // BUILD
  // ===========================================================

  @override
  Widget build(BuildContext context) {
    final products = filteredProducts;

    return Scaffold(
      backgroundColor: background,

      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // ===================================================
          // APP BAR
          // ===================================================

          SliverAppBar(
            pinned: true,
            expandedHeight: 150,
            backgroundColor: primary,
            elevation: 0,

            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),

            title: const Text(
              'SEARCH',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.5,
              ),
            ),

            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF0B1220),
                      primary,
                      Color(0xFF273244),
                      accent,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),

                child: Stack(
                  children: [
                    // Decorative circle
                    Positioned(
                      right: -40,
                      top: 20,
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(.06),
                        ),
                      ),
                    ),

                    // Decorative circle
                    Positioned(
                      left: -30,
                      bottom: -60,
                      child: Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white.withOpacity(.06),
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ===================================================
          // SEARCH FIELD
          // ===================================================

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                20,
                20,
                20,
                10,
              ),

              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: accent.withOpacity(.12),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.06),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),

                child: TextField(
                  controller: searchController,

                  onChanged: (value) {
                    setState(() {
                      query = value;
                    });
                  },

                  textInputAction: TextInputAction.search,

                  decoration: InputDecoration(
                    hintText:
                        'Search products or categories...',
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),

                    prefixIcon: const Icon(
                      Icons.search_rounded,
                      color: accent,
                    ),

                    suffixIcon: query.isNotEmpty
                        ? IconButton(
                            onPressed: clearSearch,
                            icon: const Icon(
                              Icons.close_rounded,
                              color: Colors.grey,
                            ),
                          )
                        : null,

                    border: InputBorder.none,

                    contentPadding:
                        const EdgeInsets.symmetric(
                      vertical: 18,
                      horizontal: 10,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // ===================================================
          // SEARCH INFO
          // ===================================================

          if (query.isNotEmpty)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  20,
                  10,
                  20,
                  10,
                ),

                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,

                  children: [
                    Text(
                      '${products.length} Products Found',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: primary,
                      ),
                    ),

                    Flexible(
                      child: Text(
                        query,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 13,
                          color: accent,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

          // ===================================================
          // EMPTY INITIAL STATE
          // ===================================================

          if (query.isEmpty)
            SliverFillRemaining(
              hasScrollBody: false,

              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(30),

                  child: Column(
                    mainAxisAlignment:
                        MainAxisAlignment.center,

                    children: [
                      Container(
                        width: 100,
                        height: 100,

                        decoration: BoxDecoration(
                          shape: BoxShape.circle,

                          gradient:
                              const LinearGradient(
                            colors: [
                              primary,
                              accent,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),

                          boxShadow: [
                            BoxShadow(
                              color: accent.withOpacity(.22),
                              blurRadius: 30,
                              offset: const Offset(0, 12),
                            ),
                          ],
                        ),

                        child: const Icon(
                          Icons.search_rounded,
                          color: Colors.white,
                          size: 45,
                        ),
                      ),

                      const SizedBox(height: 25),

                      const Text(
                        'Find Your Style',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                          color: primary,
                        ),
                      ),

                      const SizedBox(height: 8),

                      const Text(
                        'Search for products, categories\n'
                        'and discover your perfect style.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )

          // ===================================================
          // NO RESULT
          // ===================================================

          else if (products.isEmpty)
            SliverFillRemaining(
              hasScrollBody: false,

              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(30),

                  child: Column(
                    mainAxisAlignment:
                        MainAxisAlignment.center,

                    children: [
                      Container(
                        width: 90,
                        height: 90,

                        decoration: BoxDecoration(
                          color: const Color(0xFFF3EBD7),
                          borderRadius:
                              BorderRadius.circular(28),
                        ),

                        child: const Icon(
                          Icons.search_off_rounded,
                          color: accent,
                          size: 45,
                        ),
                      ),

                      const SizedBox(height: 22),

                      const Text(
                        'No Products Found',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                          color: primary,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Text(
                        'We could not find anything for "$query"',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),

                      const SizedBox(height: 20),

                      ElevatedButton(
                        onPressed: clearSearch,

                        style: ElevatedButton.styleFrom(
                          backgroundColor: accent,
                          foregroundColor: primary,
                          elevation: 0,

                          padding:
                              const EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 14,
                          ),

                          shape:
                              RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(16),
                          ),
                        ),

                        child: const Text(
                          'Clear Search',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )

          // ===================================================
          // PRODUCTS
          // ===================================================

          else
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(
                20,
                10,
                20,
                30,
              ),

              sliver: SliverGrid(
                delegate:
                    SliverChildBuilderDelegate(
                  (context, index) {
                    final product = products[index];

                    return _SearchProductCard(
                      name: product['name'],
                      price: product['price'],
                      category: product['category'],
                      icon: product['icon'],
                      color1: product['color1'],
                      color2: product['color2'],
                    );
                  },

                  childCount: products.length,
                ),

                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 16,
                  childAspectRatio: .68,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// ============================================================
// PRODUCT CARD
// ============================================================

class _SearchProductCard extends StatelessWidget {
  final String name;
  final int price;
  final String category;
  final IconData icon;
  final Color color1;
  final Color color2;

  const _SearchProductCard({
    required this.name,
    required this.price,
    required this.category,
    required this.icon,
    required this.color1,
    required this.color2,
  });

  // Same theme
  static const Color primary = Color(0xFF111827);
  static const Color accent = Color(0xFFD4A017);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(
              name: name,
              price: price,
              icon: icon,
              color1: color1,
              color2: color2,
            ),
          ),
        );
      },

      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.06),
              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
          ],
        ),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [
            // =================================================
            // PRODUCT IMAGE AREA
            // =================================================

            Expanded(
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,

                    decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(
                        top: Radius.circular(24),
                      ),

                      gradient: LinearGradient(
                        colors: [
                          primary,
                          accent,
                        ],

                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),

                    child: Icon(
                      icon,
                      size: 75,
                      color: Colors.white.withOpacity(.92),
                    ),
                  ),

                  // Category badge
                  Positioned(
                    top: 12,
                    left: 12,

                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),

                      decoration: BoxDecoration(
                        color:
                            Colors.white.withOpacity(.94),
                        borderRadius:
                            BorderRadius.circular(12),
                      ),

                      child: Text(
                        category,
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w900,
                          color: primary,
                        ),
                      ),
                    ),
                  ),

                  // Favorite button
                  Positioned(
                    top: 10,
                    right: 10,

                    child: Container(
                      width: 38,
                      height: 38,

                      decoration: BoxDecoration(
                        color:
                            Colors.white.withOpacity(.94),
                        shape: BoxShape.circle,
                      ),

                      child: const Icon(
                        Icons.favorite_border_rounded,
                        size: 20,
                        color: primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // =================================================
            // PRODUCT INFO
            // =================================================

            Padding(
              padding: const EdgeInsets.fromLTRB(
                14,
                12,
                14,
                14,
              ),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [
                  Text(
                    name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,

                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: primary,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Rs. $price',

                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w900,
                            color: accent,
                          ),
                        ),
                      ),

                      // Add to cart
                      GestureDetector(
                        onTap: () {
                          CartManager.addToCart(
                            CartItem(
                              name: name,
                              price: price,
                              icon: icon,
                            ),
                          );

                          ScaffoldMessenger.of(context)
                              .showSnackBar(
                            SnackBar(
                              behavior:
                                  SnackBarBehavior.floating,

                              backgroundColor:
                                  primary,

                              shape:
                                  RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(16),
                              ),

                              content: const Row(
                                children: [
                                  Icon(
                                    Icons
                                        .shopping_bag_rounded,
                                    color: accent,
                                  ),

                                  SizedBox(width: 10),

                                  Text(
                                    'Added to cart',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight:
                                          FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },

                        child: Container(
                          width: 38,
                          height: 38,

                          decoration: BoxDecoration(
                            color: accent,
                            borderRadius:
                                BorderRadius.circular(12),
                          ),

                          child: const Icon(
                            Icons.add_rounded,
                            color: primary,
                            size: 22,
                          ),
                        ),
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