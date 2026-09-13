import 'package:flutter/material.dart';
import 'package:newecommapp/cart.dart';
import 'package:newecommapp/wishlist.dart';
import 'package:newecommapp/categoryproduct.dart';

class SaleScreen extends StatefulWidget {
  const SaleScreen({super.key});

  @override
  State<SaleScreen> createState() => _SaleScreenState();
}

class _SaleScreenState extends State<SaleScreen> {
  // ==========================================================
  // THEME
  // ==========================================================

  static const Color primary = Color(0xFF111827);
  static const Color accent = Color.fromARGB(255, 23, 212, 155);
  static const Color background = Color(0xFFF8F7F3);

  String selectedCategory = 'All';

  // ==========================================================
  // SALE PRODUCTS
  // ==========================================================

  final List<Map<String, dynamic>> saleProducts = [
    {
      'name': 'Premium Denim Jacket',
      'category': 'Men',
      'price': 2499,
      'oldPrice': 4999,
      'discount': '50% OFF',
      'rating': 4.8,
      'reviews': 124,
      'icon': Icons.checkroom_rounded,
      'color1': primary,
      'color2': accent,
    },
    {
      'name': 'Classic White Shirt',
      'category': 'Men',
      'price': 1799,
      'oldPrice': 2999,
      'discount': '40% OFF',
      'rating': 4.7,
      'reviews': 89,
      'icon': Icons.dry_cleaning_rounded,
      'color1': primary,
      'color2': accent,
    },
    {
      'name': 'Elegant Summer Dress',
      'category': 'Women',
      'price': 2999,
      'oldPrice': 4999,
      'discount': '40% OFF',
      'rating': 4.9,
      'reviews': 156,
      'icon': Icons.woman_rounded,
      'color1': primary,
      'color2': accent,
    },
    {
      'name': 'Luxury Handbag',
      'category': 'Women',
      'price': 3499,
      'oldPrice': 5499,
      'discount': '36% OFF',
      'rating': 4.8,
      'reviews': 73,
      'icon': Icons.shopping_bag_rounded,
      'color1': primary,
      'color2': accent,
    },
    {
      'name': 'Urban Sneakers',
      'category': 'Men',
      'price': 2799,
      'oldPrice': 3999,
      'discount': '30% OFF',
      'rating': 4.6,
      'reviews': 211,
      'icon': Icons.directions_run_rounded,
      'color1': primary,
      'color2': accent,
    },
    {
      'name': 'Kids Casual Outfit',
      'category': 'Kids',
      'price': 1499,
      'oldPrice': 2499,
      'discount': '40% OFF',
      'rating': 4.7,
      'reviews': 64,
      'icon': Icons.child_care_rounded,
      'color1': primary,
      'color2': accent,
    },
    {
      'name': 'Oversized Hoodie',
      'category': 'Men',
      'price': 1999,
      'oldPrice': 3999,
      'discount': '50% OFF',
      'rating': 4.9,
      'reviews': 178,
      'icon': Icons.checkroom_rounded,
      'color1': primary,
      'color2': accent,
    },
    {
      'name': 'Women Casual Shoes',
      'category': 'Women',
      'price': 2299,
      'oldPrice': 3999,
      'discount': '43% OFF',
      'rating': 4.8,
      'reviews': 97,
      'icon': Icons.shopping_bag_outlined,
      'color1': primary,
      'color2': accent,
    },
  ];

  // ==========================================================
  // FILTER PRODUCTS
  // ==========================================================

  List<Map<String, dynamic>> get filteredProducts {
    if (selectedCategory == 'All') {
      return saleProducts;
    }

    return saleProducts
        .where(
          (product) => product['category'] == selectedCategory,
        )
        .toList();
  }

  // ==========================================================
  // ADD TO CART
  // ==========================================================

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
              color: accent,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                '${product['name']} added to cart',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: primary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        duration: const Duration(seconds: 1),
      ),
    );

    setState(() {});
  }

  // ==========================================================
  // TOGGLE WISHLIST
  // ==========================================================

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

  // ==========================================================
  // BUILD
  // ==========================================================

  @override
  Widget build(BuildContext context) {
    final products = filteredProducts;

    return Scaffold(
      backgroundColor: background,

      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),

        slivers: [
          // ==================================================
          // HEADER
          // ==================================================

          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            backgroundColor: primary,
            elevation: 0,

            leading: Padding(
              padding: const EdgeInsets.all(8),

              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.10),
                  shape: BoxShape.circle,
                ),

                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                    size: 18,
                  ),

                  onPressed: () {
                    Navigator.pop(context);
                  },
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
                      right: -70,
                      top: 25,

                      child: Container(
                        width: 220,
                        height: 220,

                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(.05),
                        ),
                      ),
                    ),

                    // Decorative circle
                    Positioned(
                      left: -80,
                      bottom: -90,

                      child: Container(
                        width: 220,
                        height: 220,

                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white.withOpacity(.06),
                            width: 2,
                          ),
                        ),
                      ),
                    ),

                    Positioned(
                      left: 24,
                      right: 24,
                      bottom: 25,

                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,

                        children: [
                          // Sale badge
                          Container(
                            padding:
                                const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 7,
                            ),

                            decoration: BoxDecoration(
                              color:
                                  Colors.white.withOpacity(.12),

                              borderRadius:
                                  BorderRadius.circular(20),

                              border: Border.all(
                                color:
                                    Colors.white.withOpacity(.12),
                              ),
                            ),

                            child: const Row(
                              mainAxisSize: MainAxisSize.min,

                              children: [
                                Icon(
                                  Icons
                                      .local_fire_department_rounded,
                                  color: accent,
                                  size: 15,
                                ),

                                SizedBox(width: 6),

                                Text(
                                  'LIMITED TIME SALE',

                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 9,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 1.1,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 13),

                          const Text(
                            'UP TO',

                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 2,
                            ),
                          ),

                          const Text(
                            '50% OFF',

                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              height: .95,
                              fontWeight: FontWeight.w900,
                              letterSpacing: -1.5,
                            ),
                          ),

                          const SizedBox(height: 7),

                          const Text(
                            'Your favorite styles. Now at better prices.',

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

          // ==================================================
          // SALE INFO
          // ==================================================

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                18,
                22,
                18,
                4,
              ),

              child: Row(
                children: [
                  Container(
                    width: 45,
                    height: 45,

                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          primary,
                          accent,
                        ],
                      ),

                      borderRadius:
                          BorderRadius.circular(15),
                    ),

                    child: const Icon(
                      Icons.percent_rounded,
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
                          'SALE PICKS',

                          style: TextStyle(
                            color: primary,
                            fontSize: 17,
                            fontWeight: FontWeight.w900,
                          ),
                        ),

                        SizedBox(height: 3),

                        Text(
                          'Fresh deals up to 50% off',

                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Text(
                    '${products.length} items',

                    style: const TextStyle(
                      color: accent,
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ==================================================
          // FILTER
          // ==================================================

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
                  _CategoryChip(
                    title: 'All',
                    selected: selectedCategory == 'All',

                    onTap: () {
                      setState(() {
                        selectedCategory = 'All';
                      });
                    },
                  ),

                  _CategoryChip(
                    title: 'Men',
                    selected: selectedCategory == 'Men',

                    onTap: () {
                      setState(() {
                        selectedCategory = 'Men';
                      });
                    },
                  ),

                  _CategoryChip(
                    title: 'Women',
                    selected: selectedCategory == 'Women',

                    onTap: () {
                      setState(() {
                        selectedCategory = 'Women';
                      });
                    },
                  ),

                  _CategoryChip(
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

          // ==================================================
          // PRODUCT GRID
          // ==================================================

          SliverPadding(
            padding: const EdgeInsets.fromLTRB(
              18,
              4,
              18,
              30,
            ),

            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final product = products[index];

                  return _SaleProductCard(
                    product: product,

                    onFavorite: () {
                      toggleWishlist(product);
                    },

                    onAddToCart: () {
                      addToCart(product);
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
                childAspectRatio: .57,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// CATEGORY CHIP
// ============================================================

class _CategoryChip extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onTap;

  const _CategoryChip({
    required this.title,
    required this.selected,
    required this.onTap,
  });

  static const Color primary = Color(0xFF111827);
  static const Color accent = Color.fromARGB(255, 23, 212, 155);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),

        margin: const EdgeInsets.only(right: 9),

        padding: const EdgeInsets.symmetric(
          horizontal: 19,
          vertical: 10,
        ),

        decoration: BoxDecoration(
          color: selected
              ? accent
              : Colors.white,

          borderRadius:
              BorderRadius.circular(16),

          border: Border.all(
            color: selected
                ? accent
                : const Color(0xFFE5E1D7),
          ),

          boxShadow: selected
              ? [
                  BoxShadow(
                    color: accent.withOpacity(.20),
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
                ? primary
                : const Color(0xFF777381),

            fontSize: 11,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}

// ============================================================
// SALE PRODUCT CARD
// ============================================================

class _SaleProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  final VoidCallback onFavorite;
  final VoidCallback onAddToCart;

  const _SaleProductCard({
    required this.product,
    required this.onFavorite,
    required this.onAddToCart,
  });

  static const Color primary = Color(0xFF111827);
  static const Color accent = Color.fromARGB(255, 23, 212, 155);

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
          borderRadius: BorderRadius.circular(27),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.07),
              blurRadius: 24,
              offset: const Offset(0, 10),
            ),
          ],
        ),

        child: Column(
          children: [
            // =================================================
            // PRODUCT VISUAL
            // =================================================

            Expanded(
              flex: 6,

              child: Container(
                margin: const EdgeInsets.all(7),

                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(22),

                  gradient: LinearGradient(
                    colors: [
                      product['color1'] as Color,
                      product['color2'] as Color,
                    ],

                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),

                child: Stack(
                  children: [
                    // Decorative circle
                    Positioned(
                      right: -35,
                      top: -35,

                      child: Container(
                        width: 125,
                        height: 125,

                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(.07),
                        ),
                      ),
                    ),

                    // Decorative circle
                    Positioned(
                      left: -30,
                      bottom: -40,

                      child: Container(
                        width: 110,
                        height: 110,

                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(.05),
                        ),
                      ),
                    ),

                    // Product Icon
                    Center(
                      child: Container(
                        width: 105,
                        height: 105,

                        decoration: BoxDecoration(
                          shape: BoxShape.circle,

                          color: Colors.white.withOpacity(.09),

                          border: Border.all(
                            color: Colors.white
                                .withOpacity(.13),
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
                    // SALE BADGE
                    // =================================================

                    Positioned(
                      left: 11,
                      top: 11,

                      child: Container(
                        padding:
                            const EdgeInsets.symmetric(
                          horizontal: 9,
                          vertical: 6,
                        ),

                        decoration: BoxDecoration(
                          color: const Color(0xFFF7F0D8),

                          borderRadius:
                              BorderRadius.circular(11),
                        ),

                        child: Text(
                          product['discount'],

                          style: const TextStyle(
                            color: primary,
                            fontSize: 8,
                            fontWeight: FontWeight.w900,
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
                            color:
                                Colors.black.withOpacity(.20),

                            shape: BoxShape.circle,

                            border: Border.all(
                              color: Colors.white
                                  .withOpacity(.13),
                            ),
                          ),

                          child: Icon(
                            favorite
                                ? Icons.favorite_rounded
                                : Icons
                                    .favorite_border_rounded,

                            color: favorite
                                ? accent
                                : Colors.white,

                            size: 19,
                          ),
                        ),
                      ),
                    ),

                    // =================================================
                    // SALE LABEL
                    // =================================================

                    Positioned(
                      left: 11,
                      bottom: 11,

                      child: Container(
                        padding:
                            const EdgeInsets.symmetric(
                          horizontal: 9,
                          vertical: 6,
                        ),

                        decoration: BoxDecoration(
                          color: primary.withOpacity(.88),

                          borderRadius:
                              BorderRadius.circular(10),
                        ),

                        child: const Row(
                          mainAxisSize:
                              MainAxisSize.min,

                          children: [
                            Icon(
                              Icons
                                  .local_fire_department_rounded,
                              color: accent,
                              size: 11,
                            ),

                            SizedBox(width: 3),

                            Text(
                              'SALE',

                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 8,
                                fontWeight: FontWeight.w900,
                                letterSpacing: .6,
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
                          color: primary,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // =================================================
            // DETAILS
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
                    // Category
                    Text(
                      product['category']
                          .toString()
                          .toUpperCase(),

                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 8,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.3,
                      ),
                    ),

                    const SizedBox(height: 5),

                    // Product name
                    Text(
                      product['name'],

                      maxLines: 2,
                      overflow:
                          TextOverflow.ellipsis,

                      style: const TextStyle(
                        color: primary,
                        fontSize: 13,
                        height: 1.2,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    const Spacer(),

                    // =================================================
                    // RATING
                    // =================================================

                    Row(
                      children: [
                        Container(
                          padding:
                              const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 4,
                          ),

                          decoration: BoxDecoration(
                            color: const Color(0xFFF7F0D8),

                            borderRadius:
                                BorderRadius.circular(7),
                          ),

                          child: Row(
                            children: [
                              const Icon(
                                Icons.star_rounded,
                                color: accent,
                                size: 12,
                              ),

                              const SizedBox(width: 2),

                              Text(
                                '${product['rating']}',

                                style:
                                    const TextStyle(
                                  color: primary,
                                  fontSize: 9,
                                  fontWeight:
                                      FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(width: 6),

                        Text(
                          '${product['reviews']}',

                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 8,
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
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,

                            children: [
                              Text(
                                'Rs. ${product['price']}',

                                style:
                                    const TextStyle(
                                  color: accent,
                                  fontSize: 15,
                                  fontWeight:
                                      FontWeight.w900,
                                ),
                              ),

                              const SizedBox(height: 1),

                              Text(
                                'Rs. ${product['oldPrice']}',

                                style:
                                    const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 9,
                                  decoration:
                                      TextDecoration
                                          .lineThrough,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Add to cart
                        GestureDetector(
                          onTap: onAddToCart,

                          child: Container(
                            width: 39,
                            height: 39,

                            decoration: BoxDecoration(
                              color: accent,

                              borderRadius:
                                  BorderRadius.circular(13),

                              boxShadow: [
                                BoxShadow(
                                  color: accent
                                      .withOpacity(.25),

                                  blurRadius: 10,

                                  offset:
                                      const Offset(0, 5),
                                ),
                              ],
                            ),

                            child: const Icon(
                              Icons.shopping_bag_outlined,
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