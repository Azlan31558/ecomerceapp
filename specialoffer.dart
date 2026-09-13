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

class SpecialOfferScreen extends StatefulWidget {
  const SpecialOfferScreen({super.key});

  @override
  State<SpecialOfferScreen> createState() =>
      _SpecialOfferScreenState();
}

class _SpecialOfferScreenState extends State<SpecialOfferScreen> {
  String selectedCategory = 'All';

  final List<Map<String, dynamic>> specialProducts = [
    {
      'name': 'Premium Street Hoodie',
      'category': 'Men',
      'price': 1999,
      'oldPrice': 3499,
      'discount': '43% OFF',
      'rating': 4.9,
      'reviews': 218,
      'icon': Icons.checkroom_rounded,
      'color1': AppTheme.primary,
      'color2': AppTheme.accent,
    },
    {
      'name': 'Elegant Summer Dress',
      'category': 'Women',
      'price': 2499,
      'oldPrice': 4499,
      'discount': '44% OFF',
      'rating': 4.8,
      'reviews': 186,
      'icon': Icons.woman_rounded,
      'color1': AppTheme.primary,
      'color2': AppTheme.accent,
    },
    {
      'name': 'Classic Sneakers',
      'category': 'Men',
      'price': 2299,
      'oldPrice': 3999,
      'discount': '42% OFF',
      'rating': 4.8,
      'reviews': 154,
      'icon': Icons.directions_run_rounded,
      'color1': AppTheme.primary,
      'color2': AppTheme.accent,
    },
    {
      'name': 'Luxury Handbag',
      'category': 'Women',
      'price': 2999,
      'oldPrice': 4999,
      'discount': '40% OFF',
      'rating': 4.9,
      'reviews': 127,
      'icon': Icons.shopping_bag_rounded,
      'color1': AppTheme.primary,
      'color2': AppTheme.accent,
    },
    {
      'name': 'Kids Fashion Set',
      'category': 'Kids',
      'price': 1299,
      'oldPrice': 2199,
      'discount': '41% OFF',
      'rating': 4.7,
      'reviews': 98,
      'icon': Icons.child_care_rounded,
      'color1': AppTheme.primary,
      'color2': AppTheme.accent,
    },
    {
      'name': 'Premium Denim Jacket',
      'category': 'Men',
      'price': 2699,
      'oldPrice': 4499,
      'discount': '40% OFF',
      'rating': 4.8,
      'reviews': 143,
      'icon': Icons.checkroom_outlined,
      'color1': AppTheme.primary,
      'color2': AppTheme.accent,
    },
  ];

  List<Map<String, dynamic>> get filteredProducts {
    if (selectedCategory == 'All') {
      return specialProducts;
    }

    return specialProducts
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
          // ==================================================
          // HEADER
          // ==================================================

          SliverAppBar(
            expandedHeight: 285,
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
                      Icons.more_horiz_rounded,
                      color: Colors.white,
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
                      right: -80,
                      top: 30,
                      child: Container(
                        width: 240,
                        height: 240,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(.05),
                        ),
                      ),
                    ),

                    Positioned(
                      left: -80,
                      bottom: -100,
                      child: Container(
                        width: 230,
                        height: 230,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(.04),
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
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 7,
                            ),
                            decoration: BoxDecoration(
                              color: AppTheme.accent
                                  .withOpacity(.16),
                              borderRadius:
                                  BorderRadius.circular(20),
                              border: Border.all(
                                color: AppTheme.accent
                                    .withOpacity(.25),
                              ),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.bolt_rounded,
                                  color: AppTheme.accent,
                                  size: 15,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'EXCLUSIVE DEAL',
                                  style: TextStyle(
                                    color: AppTheme.accent,
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
                            'SPECIAL',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 39,
                              height: .9,
                              fontWeight: FontWeight.w900,
                              letterSpacing: -1.5,
                            ),
                          ),

                          const Text(
                            'OFFER',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 21,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 4,
                            ),
                          ),

                          const SizedBox(height: 7),

                          const Text(
                            'Exclusive prices picked just for you.',
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
          // OFFER BANNER
          // ==================================================

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                18,
                20,
                18,
                5,
              ),
              child: Container(
                height: 165,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      AppTheme.primary,
                      AppTheme.accent,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(27),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.primary.withOpacity(.20),
                      blurRadius: 25,
                      offset: const Offset(0, 12),
                    ),
                  ],
                ),

                child: Stack(
                  children: [
                    Positioned(
                      right: -35,
                      top: -35,
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(.08),
                        ),
                      ),
                    ),

                    Positioned(
                      right: 18,
                      bottom: 16,
                      child: Transform.rotate(
                        angle: -.15,
                        child: const Icon(
                          Icons.local_offer_rounded,
                          color: Colors.white24,
                          size: 92,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'TODAY ONLY',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 9,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 1.5,
                            ),
                          ),

                          const SizedBox(height: 5),

                          const Text(
                            'UP TO 45% OFF',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 27,
                              fontWeight: FontWeight.w900,
                            ),
                          ),

                          const SizedBox(height: 4),

                          const Text(
                            'On selected fashion essentials',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 10,
                            ),
                          ),

                          const Spacer(),

                          Container(
                            padding:
                                const EdgeInsets.symmetric(
                              horizontal: 13,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: AppTheme.primary,
                              borderRadius:
                                  BorderRadius.circular(12),
                            ),
                            child: const Text(
                              'SPECIAL45',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 1,
                              ),
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
          // COUNTDOWN
          // ==================================================

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                18,
                18,
                18,
                5,
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          'HURRY!',
                          style: TextStyle(
                            color: AppTheme.primary,
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          'Offer ends soon',
                          style: TextStyle(
                            color: Color(0xFF6B7280),
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),

                  _TimeBox(
                    value: '08',
                    label: 'HRS',
                  ),

                  const SizedBox(width: 5),

                  _TimeBox(
                    value: '42',
                    label: 'MIN',
                  ),

                  const SizedBox(width: 5),

                  _TimeBox(
                    value: '19',
                    label: 'SEC',
                  ),
                ],
              ),
            ),
          ),

          // ==================================================
          // CATEGORY FILTER
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
                  _OfferChip(
                    title: 'All',
                    selected: selectedCategory == 'All',
                    onTap: () {
                      setState(() {
                        selectedCategory = 'All';
                      });
                    },
                  ),

                  _OfferChip(
                    title: 'Men',
                    selected: selectedCategory == 'Men',
                    onTap: () {
                      setState(() {
                        selectedCategory = 'Men';
                      });
                    },
                  ),

                  _OfferChip(
                    title: 'Women',
                    selected: selectedCategory == 'Women',
                    onTap: () {
                      setState(() {
                        selectedCategory = 'Women';
                      });
                    },
                  ),

                  _OfferChip(
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
          // PRODUCTS
          // ==================================================

          SliverPadding(
            padding: const EdgeInsets.fromLTRB(
              18,
              4,
              18,
              35,
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

                return _SpecialOfferCard(
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

// ==========================================================
// TIME BOX
// ==========================================================

class _TimeBox extends StatelessWidget {
  final String value;
  final String label;

  const _TimeBox({
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 53,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
        border: Border.all(
          color: AppTheme.accent.withOpacity(.20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: const TextStyle(
              color: AppTheme.primary,
              fontSize: 16,
              fontWeight: FontWeight.w900,
            ),
          ),
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFF6B7280),
              fontSize: 7,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================================================
// FILTER CHIP
// ==========================================================

class _OfferChip extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onTap;

  const _OfferChip({
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

// ==========================================================
// SPECIAL OFFER PRODUCT CARD
// ==========================================================

class _SpecialOfferCard extends StatelessWidget {
  final Map<String, dynamic> product;
  final VoidCallback onFavorite;
  final VoidCallback onAddToCart;

  const _SpecialOfferCard({
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
            // ==================================================
            // PRODUCT VISUAL
            // ==================================================

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

                    // Product Icon
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

                    // ==================================================
                    // OFFER BADGE
                    // ==================================================

                    Positioned(
                      left: 11,
                      top: 11,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 9,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppTheme.accent.withOpacity(.18),
                          borderRadius:
                              BorderRadius.circular(11),
                          border: Border.all(
                            color: AppTheme.accent
                                .withOpacity(.30),
                          ),
                        ),
                        child: Text(
                          product['discount'],
                          style: const TextStyle(
                            color: AppTheme.accent,
                            fontSize: 8,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),

                    // ==================================================
                    // FAVORITE
                    // ==================================================

                    Positioned(
                      right: 11,
                      top: 11,
                      child: GestureDetector(
                        onTap: onFavorite,
                        child: Container(
                          width: 37,
                          height: 37,
                          decoration: BoxDecoration(
                            color: AppTheme.primary
                                .withOpacity(.20),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color:
                                  Colors.white.withOpacity(.13),
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

                    // ==================================================
                    // LIMITED
                    // ==================================================

                    Positioned(
                      left: 11,
                      bottom: 11,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 9,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppTheme.primary.withOpacity(.86),
                          borderRadius:
                              BorderRadius.circular(10),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.bolt_rounded,
                              color: AppTheme.accent,
                              size: 11,
                            ),
                            SizedBox(width: 3),
                            Text(
                              'LIMITED',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 7,
                                fontWeight: FontWeight.w900,
                                letterSpacing: .5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // ==================================================
                    // ARROW
                    // ==================================================

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

            // ==================================================
            // DETAILS
            // ==================================================

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

                    // ==================================================
                    // RATING
                    // ==================================================

                    Row(
                      children: [
                        Container(
                          padding:
                              const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color:
                                AppTheme.accent.withOpacity(.12),
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

                        Text(
                          '${product['reviews']} reviews',
                          style: const TextStyle(
                            color: Color(0xFF9CA3AF),
                            fontSize: 8,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    // ==================================================
                    // PRICE
                    // ==================================================

                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Rs. ${product['price']}',
                                style: const TextStyle(
                                  color: AppTheme.accent,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),

                              const SizedBox(height: 1),

                              Text(
                                'Rs. ${product['oldPrice']}',
                                style: const TextStyle(
                                  color: Color(0xFF9CA3AF),
                                  fontSize: 9,
                                  decoration:
                                      TextDecoration.lineThrough,
                                ),
                              ),
                            ],
                          ),
                        ),

                        GestureDetector(
                          onTap: onAddToCart,
                          child: Container(
                            width: 39,
                            height: 39,
                            decoration: BoxDecoration(
                              gradient:
                                  const LinearGradient(
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