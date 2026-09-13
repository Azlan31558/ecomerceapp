import 'package:flutter/material.dart';
 import 'package:newecommapp/apptheme.dart';
import 'package:newecommapp/cart.dart';
import 'package:newecommapp/wishlist.dart';
import 'package:newecommapp/categoryproduct.dart';

import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFF111827);
  static const Color accent = Color.fromARGB(255, 23, 212, 155);
  static const Color background = Color(0xFFF8F7F3);
}

class TrendingScreen extends StatefulWidget {
  const TrendingScreen({super.key});

  @override
  State<TrendingScreen> createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  String selectedCategory = 'All';

  final List<Map<String, dynamic>> trendingProducts = [
    {
      'rank': 1,
      'name': 'Premium Oversized',
      'category': 'Men',
      'price': 2499,
      'rating': 4.9,
      'reviews': 328,
      'sold': '2.4k+ sold',
      'tag': 'MOST LOVED',
      'icon': Icons.checkroom_rounded,
      'color1': AppTheme.primary,
      'color2': AppTheme.accent,
    },
    {
      'rank': 2,
      'name': 'Elegant Women Dress',
      'category': 'Women',
      'price': 3299,
      'rating': 4.9,
      'reviews': 286,
      'sold': '1.9k+ sold',
      'tag': 'TRENDING',
      'icon': Icons.woman_rounded,
      'color1': AppTheme.primary,
      'color2': AppTheme.accent,
    },
    {
      'rank': 3,
      'name': 'Urban Street Sneakers',
      'category': 'Men',
      'price': 2899,
      'rating': 4.8,
      'reviews': 241,
      'sold': '1.7k+ sold',
      'tag': 'HOT PICK',
      'icon': Icons.directions_run_rounded,
      'color1': AppTheme.primary,
      'color2': AppTheme.accent,
    },
    {
      'rank': 4,
      'name': 'Classic Leather Handbag',
      'category': 'Women',
      'price': 3799,
      'rating': 4.8,
      'reviews': 198,
      'sold': '1.4k+ sold',
      'tag': 'POPULAR',
      'icon': Icons.shopping_bag_rounded,
      'color1': AppTheme.primary,
      'color2': AppTheme.accent,
    },
    {
      'rank': 5,
      'name': 'Classic Denim Jacket',
      'category': 'Men',
      'price': 2999,
      'rating': 4.7,
      'reviews': 176,
      'sold': '1.2k+ sold',
      'tag': 'HOT NOW',
      'icon': Icons.checkroom_outlined,
      'color1': AppTheme.primary,
      'color2': AppTheme.accent,
    },
    {
      'rank': 6,
      'name': 'Girls Fashion Outfit',
      'category': 'Kids',
      'price': 1899,
      'rating': 4.8,
      'reviews': 154,
      'sold': '980+ sold',
      'tag': 'FAVORITE',
      'icon': Icons.child_care_rounded,
      'color1': AppTheme.primary,
      'color2': AppTheme.accent,
    },
    {
      'rank': 7,
      'name': 'Minimal White Sneakers',
      'category': 'Women',
      'price': 2699,
      'rating': 4.7,
      'reviews': 142,
      'sold': '870+ sold',
      'tag': 'TRENDING',
      'icon': Icons.shopping_bag_outlined,
      'color1': AppTheme.primary,
      'color2': AppTheme.accent,
    },
    {
      'rank': 8,
      'name': 'Premium Casual Shirt',
      'category': 'Men',
      'price': 1999,
      'rating': 4.6,
      'reviews': 129,
      'sold': '760+ sold',
      'tag': 'POPULAR',
      'icon': Icons.dry_cleaning_rounded,
      'color1': AppTheme.primary,
      'color2': AppTheme.accent,
    },
  ];

  List<Map<String, dynamic>> get filteredProducts {
    if (selectedCategory == 'All') {
      return trendingProducts;
    }

    return trendingProducts
        .where(
          (product) => product['category'] == selectedCategory,
        )
        .toList();
  }

  void addToCart(Map<String, dynamic> product) {
    CartManager.addToCart(
      CartItem(
        name: product['name'],
        price: product['price'],
        icon: product['icon'],
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(
              Icons.shopping_bag_rounded,
              color: AppTheme.accent,
              size: 20,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                '${product['name']} added to cart',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: AppTheme.primary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        duration: const Duration(seconds: 1),
      ),
    );

    setState(() {});
  }

  void toggleWishlist(Map<String, dynamic> product) {
    final name = product['name'];

    if (WishlistManager.isInWishlist(name)) {
      WishlistManager.removeFromWishlist(name);
    } else {
      WishlistManager.addToWishlist(
        WishlistItem(
          name: product['name'],
          price: product['price'],
          icon: product['icon'],
          color1: product['color1'],
          color2: product['color2'],
        ),
      );
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final products = filteredProducts;

    return Scaffold(
      backgroundColor: AppTheme.background,
      body: CustomScrollView(
        slivers: [
          // =================================================
          // PREMIUM HEADER
          // =================================================
          SliverAppBar(
            expandedHeight: 275,
            pinned: true,
            elevation: 0,
            backgroundColor: AppTheme.primary,

            leading: Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.10),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
            ),

            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 14),
                child: Container(
                  width: 43,
                  height: 43,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.10),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.tune_rounded,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],

            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppTheme.primary,
                      Color(0xFF172334),
                      AppTheme.accent,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      right: -75,
                      top: 25,
                      child: Container(
                        width: 230,
                        height: 230,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(.05),
                        ),
                      ),
                    ),

                    Positioned(
                      left: -90,
                      bottom: -90,
                      child: Container(
                        width: 240,
                        height: 240,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(.04),
                        ),
                      ),
                    ),

                    Positioned(
                      left: 24,
                      right: 24,
                      bottom: 26,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 7,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(.12),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.white.withOpacity(.12),
                              ),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.local_fire_department_rounded,
                                  color: AppTheme.accent,
                                  size: 15,
                                ),
                                SizedBox(width: 6),
                                Text(
                                  'WHAT EVERYONE LOVES',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 9,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 13),

                          const Text(
                            'TRENDING',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 39,
                              height: .95,
                              fontWeight: FontWeight.w900,
                              letterSpacing: -1.4,
                            ),
                          ),

                          const Text(
                            'MOST POPULAR',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 2,
                            ),
                          ),

                          const SizedBox(height: 7),

                          const Text(
                            'Discover the styles everyone is talking about.',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // =================================================
          // TRENDING INTRO
          // =================================================
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                18,
                22,
                18,
                5,
              ),
              child: Row(
                children: [
                  Container(
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          AppTheme.primary,
                          AppTheme.accent,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(
                      Icons.auto_awesome_rounded,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(width: 12),

                  const Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          'TOP PICKS',
                          style: TextStyle(
                            color: AppTheme.primary,
                            fontSize: 17,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          'The products everyone wants right now',
                          style: TextStyle(
                            color: Color(0xFF6B7280),
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Text(
                    '${products.length} items',
                    style: const TextStyle(
                      color: AppTheme.accent,
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // =================================================
          // CATEGORY FILTER
          // =================================================
          SliverToBoxAdapter(
            child: SizedBox(
              height: 66,
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 12,
                ),
                scrollDirection: Axis.horizontal,
                children: [
                  _TrendingChip(
                    title: 'All',
                    selected: selectedCategory == 'All',
                    onTap: () {
                      setState(() {
                        selectedCategory = 'All';
                      });
                    },
                  ),

                  _TrendingChip(
                    title: 'Men',
                    selected: selectedCategory == 'Men',
                    onTap: () {
                      setState(() {
                        selectedCategory = 'Men';
                      });
                    },
                  ),

                  _TrendingChip(
                    title: 'Women',
                    selected: selectedCategory == 'Women',
                    onTap: () {
                      setState(() {
                        selectedCategory = 'Women';
                      });
                    },
                  ),

                  _TrendingChip(
                    title: 'Kids',
                    selected: selectedCategory == 'Kids',
                    onTap: () {
                      setState(() {
                        selectedCategory = 'Kids';
                      });
                    },
                  ),
                ],
              ),
            ),
          ),

          // =================================================
          // PRODUCT GRID
          // =================================================
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(
              18,
              4,
              18,
              30,
            ),
            sliver: SliverGrid.builder(
              itemCount: products.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 18,
                childAspectRatio: .56,
              ),
              itemBuilder: (context, index) {
                final product = products[index];

                return _TrendingProductCard(
                  product: product,
                  onFavorite: () {
                    toggleWishlist(product);
                  },
                  onAddToCart: () {
                    addToCart(product);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// =========================================================
// CATEGORY CHIP
// =========================================================

class _TrendingChip extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onTap;

  const _TrendingChip({
    required this.title,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        margin: const EdgeInsets.only(right: 9),
        padding: const EdgeInsets.symmetric(
          horizontal: 19,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: selected
              ? AppTheme.primary
              : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: selected
                ? AppTheme.primary
                : const Color(0xFFE5E7EB),
          ),
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: AppTheme.primary.withOpacity(.15),
                    blurRadius: 12,
                    offset: const Offset(0, 5),
                  ),
                ]
              : null,
        ),
        child: Text(
          title,
          style: TextStyle(
            color: selected
                ? Colors.white
                : const Color(0xFF6B7280),
            fontSize: 11,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}

// =========================================================
// TRENDING PRODUCT CARD
// =========================================================

class _TrendingProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  final VoidCallback onFavorite;
  final VoidCallback onAddToCart;

  const _TrendingProductCard({
    required this.product,
    required this.onFavorite,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    final bool favorite =
        WishlistManager.isInWishlist(product['name']);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetailsScreen(
              name: product['name'],
              price: product['price'],
              icon: product['icon'],
              color1: product['color1'],
              color2: product['color2'],
            ),
          ),
        );
      },

      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: AppTheme.primary.withOpacity(.07),
              blurRadius: 25,
              offset: const Offset(0, 10),
            ),
          ],
        ),

        child: Column(
          children: [
            // =================================================
            // PRODUCT IMAGE AREA
            // =================================================
            Expanded(
              flex: 6,
              child: Container(
                margin: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(23),
                  gradient: LinearGradient(
                    colors: [
                      product['color1'],
                      product['color2'],
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),

                child: Stack(
                  children: [
                    // Decorative circles
                    Positioned(
                      right: -32,
                      top: -32,
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(.07),
                        ),
                      ),
                    ),

                    Positioned(
                      left: -25,
                      bottom: -35,
                      child: Container(
                        width: 105,
                        height: 105,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(.05),
                        ),
                      ),
                    ),

                    // Product icon
                    Center(
                      child: Container(
                        width: 105,
                        height: 105,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(.09),
                          border: Border.all(
                            color: Colors.white.withOpacity(.13),
                          ),
                        ),
                        child: Icon(
                          product['icon'],
                          color: Colors.white,
                          size: 56,
                        ),
                      ),
                    ),

                    // =================================================
                    // RANK
                    // =================================================
                    Positioned(
                      left: 11,
                      top: 11,
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: AppTheme.primary.withOpacity(.12),
                              blurRadius: 8,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            '#${product['rank']}',
                            style: const TextStyle(
                              color: AppTheme.primary,
                              fontSize: 11,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                    ),

                    // =================================================
                    // FAVORITE
                    // =================================================
                    Positioned(
                      right: 11,
                      top: 11,
                      child: GestureDetector(
                        onTap: onFavorite,
                        child: Container(
                          width: 37,
                          height: 37,
                          decoration: BoxDecoration(
                            color: AppTheme.primary.withOpacity(.20),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white.withOpacity(.13),
                            ),
                          ),
                          child: Icon(
                            favorite
                                ? Icons.favorite_rounded
                                : Icons.favorite_border_rounded,
                            color: favorite
                                ? AppTheme.accent
                                : Colors.white,
                            size: 19,
                          ),
                        ),
                      ),
                    ),

                    // =================================================
                    // POPULAR BADGE
                    // =================================================
                    Positioned(
                      left: 11,
                      bottom: 11,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 9,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppTheme.primary.withOpacity(.85),
                          borderRadius:
                              BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.local_fire_department_rounded,
                              color: AppTheme.accent,
                              size: 11,
                            ),
                            const SizedBox(width: 3),
                            Text(
                              product['tag'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 7,
                                fontWeight: FontWeight.w900,
                                letterSpacing: .4,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // =================================================
                    // ARROW
                    // =================================================
                    Positioned(
                      right: 11,
                      bottom: 11,
                      child: Container(
                        width: 31,
                        height: 31,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.92),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.arrow_outward_rounded,
                          color: AppTheme.primary,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // =================================================
            // PRODUCT DETAILS
            // =================================================
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  13,
                  4,
                  13,
                  12,
                ),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      product['category']
                          .toString()
                          .toUpperCase(),
                      style: const TextStyle(
                        color: Color(0xFF6B7280),
                        fontSize: 8,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.3,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      product['name'],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppTheme.primary,
                        fontSize: 13,
                        height: 1.2,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    const Spacer(),

                    // =================================================
                    // RATING + SOLD
                    // =================================================
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppTheme.accent.withOpacity(.12),
                            borderRadius:
                                BorderRadius.circular(7),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.star_rounded,
                                color: AppTheme.accent,
                                size: 12,
                              ),
                              const SizedBox(width: 2),
                              Text(
                                '${product['rating']}',
                                style: const TextStyle(
                                  color: AppTheme.primary,
                                  fontSize: 9,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(width: 6),

                        Expanded(
                          child: Text(
                            product['sold'],
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Color(0xFF9CA3AF),
                              fontSize: 8,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    // =================================================
                    // PRICE + CART
                    // =================================================
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Rs. ${product['price']}',
                            style: const TextStyle(
                              color: AppTheme.accent,
                              fontSize: 15,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),

                        GestureDetector(
                          onTap: onAddToCart,
                          child: Container(
                            width: 39,
                            height: 39,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  AppTheme.primary,
                                  AppTheme.accent,
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius:
                                  BorderRadius.circular(13),
                              boxShadow: [
                                BoxShadow(
                                  color: AppTheme.accent
                                      .withOpacity(.28),
                                  blurRadius: 10,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.shopping_bag_outlined,
                              color: Colors.white,
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