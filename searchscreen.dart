import 'package:flutter/material.dart';
import 'package:newecommapp/apptheme.dart';
import 'package:newecommapp/cart.dart';
import 'package:newecommapp/categoryproduct.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // ===========================================================
  // APP THEME
  // ===========================================================

  // Deep Navy
  static const Color primary = AppColors.primary;

  // Elegant Gold
  static const Color accent = AppColors.accentss;

  // Warm Off-White
  static const Color background = Color(0xFFF8F7F3);

  final TextEditingController searchController =
      TextEditingController();

  String searchQuery = '';

  // ===========================================================
  // PRODUCTS
  // ===========================================================

  final List<Map<String, dynamic>> allProducts = [
    // ================= MEN =================

    {
      'name': 'Classic T-Shirt',
      'price': 2499,
      'category': 'Men',
      'icon': Icons.checkroom_rounded,
      'tag': 'ESSENTIAL',
      'color1': Color(0xFF111827),
      'color2': AppColors.accentss,
    },
    {
      'name': 'Denim Jacket',
      'price': 4999,
      'category': 'Men',
      'icon': Icons.dry_cleaning_rounded,
      'tag': 'TRENDING',
      'color1': Color(0xFF111827),
      'color2': AppColors.accentss,
    },
    {
      'name': 'Casual Shirt',
      'price': 2999,
      'category': 'Men',
      'icon': Icons.shopping_bag_rounded,
      'tag': 'NEW',
      'color1': Color(0xFF111827),
      'color2': AppColors.accentss,
    },
    {
      'name': 'Men Jeans',
      'price': 3499,
      'category': 'Men',
      'icon': Icons.accessibility_new_rounded,
      'tag': 'POPULAR',
      'color1': Color(0xFF111827),
      'color2': AppColors.accentss,
    },

    // ================= WOMEN =================

    {
      'name': 'Summer Dress',
      'price': 3999,
      'category': 'Women',
      'icon': Icons.checkroom_rounded,
      'tag': 'NEW',
      'color1': Color(0xFF111827),
      'color2': AppColors.accentss,
    },
    {
      'name': 'Women Handbag',
      'price': 2999,
      'category': 'Women',
      'icon': Icons.shopping_bag_rounded,
      'tag': 'LUXURY',
      'color1': Color(0xFF111827),
      'color2': AppColors.accentss,
    },
    {
      'name': 'Casual Top',
      'price': 1999,
      'category': 'Women',
      'icon': Icons.dry_cleaning_rounded,
      'tag': 'FRESH',
      'color1': Color(0xFF111827),
      'color2': AppColors.accentss,
    },
    {
      'name': 'Women Shoes',
      'price': 4499,
      'category': 'Women',
      'icon': Icons.directions_run_rounded,
      'tag': 'HOT',
      'color1': Color(0xFF111827),
      'color2': AppColors.accentss,
    },

    // ================= KIDS =================

    {
      'name': 'Kids T-Shirt',
      'price': 1499,
      'category': 'Kids',
      'icon': Icons.checkroom_rounded,
      'tag': 'NEW',
      'color1': Color(0xFF111827),
      'color2': AppColors.accentss,
    },
    {
      'name': 'Kids Jeans',
      'price': 1999,
      'category': 'Kids',
      'icon': Icons.accessibility_new_rounded,
      'tag': 'COOL',
      'color1': Color(0xFF111827),
      'color2': AppColors.accentss,
    },
    {
      'name': 'Kids Shoes',
      'price': 2499,
      'category': 'Kids',
      'icon': Icons.directions_run_rounded,
      'tag': 'ACTIVE',
      'color1': Color(0xFF111827),
      'color2': AppColors.accentss,
    },
    {
      'name': 'Kids Jacket',
      'price': 2999,
      'category': 'Kids',
      'icon': Icons.dry_cleaning_rounded,
      'tag': 'TRENDING',
      'color1': Color(0xFF111827),
      'color2': AppColors.accentss,
    },
  ];

  // ===========================================================
  // FILTER PRODUCTS
  // ===========================================================

  List<Map<String, dynamic>> get filteredProducts {
    if (searchQuery.trim().isEmpty) {
      return allProducts;
    }

    final query = searchQuery.toLowerCase().trim();

    return allProducts.where((product) {
      final name = product['name'].toString().toLowerCase();
      final category =
          product['category'].toString().toLowerCase();

      return name.contains(query) || category.contains(query);
    }).toList();
  }

  // ===========================================================
  // DISPOSE
  // ===========================================================

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
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
          // HEADER
          // ===================================================

          SliverAppBar(
            expandedHeight: 175,
            pinned: true,
            elevation: 0,
            backgroundColor: primary,

            leading: Padding(
              padding: const EdgeInsets.all(9),
              child: _CircleButton(
                icon: Icons.arrow_back_rounded,
                onTap: () => Navigator.pop(context),
              ),
            ),

            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 14),
                child: _CircleButton(
                  icon: Icons.shopping_bag_outlined,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const CartScreen(),
                      ),
                    );
                  },
                ),
              ),
            ],

            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                padding: const EdgeInsets.fromLTRB(
                  22,
                  90,
                  22,
                  20,
                ),

                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      primary,
                      Color(0xFF1A2434),
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
                      right: -50,
                      top: 5,
                      child: Container(
                        width: 175,
                        height: 175,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(.06),
                        ),
                      ),
                    ),

                    // Second decorative circle
                    Positioned(
                      left: -60,
                      bottom: -80,
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(.04),
                        ),
                      ),
                    ),

                    Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      mainAxisAlignment:
                          MainAxisAlignment.end,

                      children: [
                        const Text(
                          'DISCOVER',
                          style: TextStyle(
                            color: accent,
                            fontSize: 10,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 2.5,
                          ),
                        ),

                        const SizedBox(height: 4),

                        const Text(
                          'Search',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 38,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
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
                18,
                20,
                18,
                12,
              ),

              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),

                  border: Border.all(
                    color: accent.withOpacity(.18),
                  ),

                  boxShadow: [
                    BoxShadow(
                      color: primary.withOpacity(.06),
                      blurRadius: 18,
                      offset: const Offset(0, 7),
                    ),
                  ],
                ),

                child: TextField(
                  controller: searchController,
                  autofocus: true,

                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                    });
                  },

                  decoration: InputDecoration(
                    hintText:
                        'Search products, categories...',

                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                    ),

                    prefixIcon: const Icon(
                      Icons.search_rounded,
                      color: accent,
                    ),

                    suffixIcon: searchQuery.isNotEmpty
                        ? IconButton(
                            onPressed: () {
                              searchController.clear();

                              setState(() {
                                searchQuery = '';
                              });
                            },

                            icon: const Icon(
                              Icons.close_rounded,
                              color: primary,
                            ),
                          )
                        : null,

                    border: InputBorder.none,

                    contentPadding:
                        const EdgeInsets.symmetric(
                      vertical: 17,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // ===================================================
          // RESULT TITLE
          // ===================================================

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                20,
                8,
                20,
                10,
              ),

              child: Row(
                children: [
                  Text(
                    searchQuery.isEmpty
                        ? 'All Products'
                        : 'Search Results',

                    style: const TextStyle(
                      color: primary,
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),

                  const Spacer(),

                  Container(
                    padding:
                        const EdgeInsets.symmetric(
                      horizontal: 11,
                      vertical: 7,
                    ),

                    decoration: BoxDecoration(
                      color: const Color(0xFFF7F0D8),
                      borderRadius:
                          BorderRadius.circular(20),
                    ),

                    child: Text(
                      '${products.length} items',

                      style: const TextStyle(
                        color: accent,
                        fontSize: 10,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ===================================================
          // PRODUCTS
          // ===================================================

          if (products.isNotEmpty)
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(
                18,
                5,
                18,
                35,
              ),

              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final product = products[index];

                    return _SearchProductCard(
                      product: product,

                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                ProductDetailsScreen(
                              name: product['name'],
                              price: product['price'],
                              icon: product['icon'],
                              color1: product['color1'],
                              color2: product['color2'],
                            ),
                          ),
                        );
                      },

                      onAddToCart: () {
                        CartManager.addToCart(
                          CartItem(
                            name: product['name'],
                            price: product['price'],
                            icon: product['icon'],
                          ),
                        );

                        ScaffoldMessenger.of(context)
                            .showSnackBar(
                          SnackBar(
                            behavior:
                                SnackBarBehavior.floating,

                            backgroundColor: primary,

                            shape:
                                RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(15),
                            ),

                            content: Row(
                              children: [
                                const Icon(
                                  Icons.shopping_bag_rounded,
                                  color: accent,
                                ),

                                const SizedBox(width: 10),

                                Expanded(
                                  child: Text(
                                    '${product['name']} added to bag',

                                    style:
                                        const TextStyle(
                                      color: Colors.white,
                                      fontWeight:
                                          FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );

                        setState(() {});
                      },
                    );
                  },

                  childCount: products.length,
                ),

                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 18,
                  childAspectRatio: .64,
                ),
              ),
            )

          // ===================================================
          // EMPTY SEARCH
          // ===================================================

          else
            SliverFillRemaining(
              hasScrollBody: false,

              child: _EmptySearch(
                query: searchQuery,

                onClear: () {
                  searchController.clear();

                  setState(() {
                    searchQuery = '';
                  });
                },
              ),
            ),
        ],
      ),
    );
  }
}

// =============================================================
// PRODUCT CARD
// =============================================================

class _SearchProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  final VoidCallback onTap;
  final VoidCallback onAddToCart;

  const _SearchProductCard({
    required this.product,
    required this.onTap,
    required this.onAddToCart,
  });

  static const Color primary = Color(0xFF111827);
  static const Color accent = AppColors.accentss;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(23),

          boxShadow: [
            BoxShadow(
              color: primary.withOpacity(.06),
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
            // PRODUCT VISUAL
            // =================================================

            Expanded(
              flex: 6,

              child: Container(
                width: double.infinity,

                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      product['color1'] as Color,
                      product['color2'] as Color,
                    ],

                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),

                  borderRadius:
                      const BorderRadius.vertical(
                    top: Radius.circular(23),
                  ),
                ),

                child: Stack(
                  children: [
                    // Decorative circle
                    Positioned(
                      right: -25,
                      top: -25,

                      child: Container(
                        width: 100,
                        height: 100,

                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              Colors.white.withOpacity(.07),
                        ),
                      ),
                    ),

                    // Product tag
                    Positioned(
                      top: 12,
                      left: 12,

                      child: Container(
                        padding:
                            const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 5,
                        ),

                        decoration: BoxDecoration(
                          color:
                              Colors.white.withOpacity(.15),

                          borderRadius:
                              BorderRadius.circular(8),

                          border: Border.all(
                            color:
                                Colors.white.withOpacity(.10),
                          ),
                        ),

                        child: Text(
                          product['tag'],

                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 7,
                            fontWeight: FontWeight.w900,
                            letterSpacing: .7,
                          ),
                        ),
                      ),
                    ),

                    // Product icon
                    Center(
                      child: Icon(
                        product['icon'],
                        size: 62,
                        color: Colors.white,
                      ),
                    ),

                    // Details button
                    Positioned(
                      right: 10,
                      bottom: 10,

                      child: GestureDetector(
                        onTap: onTap,

                        child: Container(
                          width: 35,
                          height: 35,

                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,

                            boxShadow: [
                              BoxShadow(
                                color:
                                    primary.withOpacity(.15),
                                blurRadius: 8,
                              ),
                            ],
                          ),

                          child: const Icon(
                            Icons.arrow_outward_rounded,
                            color: primary,
                            size: 17,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // =================================================
            // PRODUCT INFORMATION
            // =================================================

            Expanded(
              flex: 4,

              child: Padding(
                padding:
                    const EdgeInsets.fromLTRB(
                  12,
                  10,
                  10,
                  9,
                ),

                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [
                    Text(
                      product['category'],

                      style: const TextStyle(
                        color: accent,
                        fontSize: 8,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      product['name'],

                      maxLines: 1,
                      overflow:
                          TextOverflow.ellipsis,

                      style: const TextStyle(
                        color: primary,
                        fontSize: 13,
                        fontWeight: FontWeight.w900,
                      ),
                    ),

                    const Spacer(),

                    Row(
                      children: [
                        Text(
                          'Rs. ${product['price']}',

                          style: const TextStyle(
                            color: accent,
                            fontSize: 13,
                            fontWeight: FontWeight.w900,
                          ),
                        ),

                        const Spacer(),

                        GestureDetector(
                          onTap: onAddToCart,

                          child: Container(
                            width: 30,
                            height: 30,

                            decoration: BoxDecoration(
                              color: accent,

                              borderRadius:
                                  BorderRadius.circular(9),

                              boxShadow: [
                                BoxShadow(
                                  color:
                                      accent.withOpacity(.20),
                                  blurRadius: 7,
                                  offset:
                                      const Offset(0, 3),
                                ),
                              ],
                            ),

                            child: const Icon(
                              Icons.add_rounded,
                              color: primary,
                              size: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// =============================================================
// EMPTY SEARCH
// =============================================================

class _EmptySearch extends StatelessWidget {
  final String query;
  final VoidCallback onClear;

  const _EmptySearch({
    required this.query,
    required this.onClear,
  });

  static const Color primary = Color(0xFF111827);
  static const Color accent = AppColors.accentss;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 35),

        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,

          children: [
            // Search icon
            Container(
              width: 110,
              height: 110,

              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    primary,
                    accent,
                  ],

                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),

                shape: BoxShape.circle,
              ),

              child: const Icon(
                Icons.search_off_rounded,
                color: Colors.white,
                size: 48,
              ),
            ),

            const SizedBox(height: 22),

            const Text(
              'No products found',

              style: TextStyle(
                color: primary,
                fontSize: 22,
                fontWeight: FontWeight.w900,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              'We could not find anything matching\n'
              '"$query"',

              textAlign: TextAlign.center,

              style: const TextStyle(
                color: Colors.grey,
                fontSize: 13,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 22),

            ElevatedButton(
              onPressed: onClear,

              style: ElevatedButton.styleFrom(
                backgroundColor: accent,
                foregroundColor: primary,
                elevation: 0,

                padding:
                    const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 13,
                ),

                shape:
                    RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(14),
                ),
              ),

              child: const Text(
                'CLEAR SEARCH',

                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// =============================================================
// CIRCLE BUTTON
// =============================================================

class _CircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _CircleButton({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.12),
          shape: BoxShape.circle,
        ),

        child: Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }
}