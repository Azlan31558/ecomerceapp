import 'package:flutter/material.dart';
import 'package:newecommapp/cart.dart';
import 'package:newecommapp/categoryproduct.dart';
import 'package:newecommapp/wishlist.dart';

class NewArrivalsScreen extends StatefulWidget {
  const NewArrivalsScreen({super.key});

  @override
  State<NewArrivalsScreen> createState() => _NewArrivalsScreenState();
}

class _NewArrivalsScreenState extends State<NewArrivalsScreen> {
  // ============================================================
  // PREMIUM THEME COLORS
  // ============================================================

  static const Color primary = Color(0xFF111827);
  static const Color accent = Color.fromARGB(255, 23, 212, 155);
  static const Color background = Color(0xFFF8F7F3);

  String selectedCategory = 'All';

  // ============================================================
  // PRODUCTS
  // ============================================================

  final List<Map<String, dynamic>> products = const [
    {
      'name': 'Premium Black Hoodie',
      'price': 3200,
      'oldPrice': 3900,
      'rating': 4.8,
      'reviews': 124,
      'icon': Icons.checkroom_rounded,
      'color1': Color(0xFF111827),
      'color2': Color.fromARGB(255, 23, 212, 155),
      'category': 'Men',
      'discount': '18% OFF',
    },
    {
      'name': 'Classic Denim Jacket',
      'price': 4500,
      'oldPrice': 5200,
      'rating': 4.9,
      'reviews': 89,
      'icon': Icons.shopping_bag_rounded,
      'color1': Color(0xFF111827),
      'color2': Color.fromARGB(255, 23, 212, 155),
      'category': 'Men',
      'discount': '13% OFF',
    },
    {
      'name': 'Elegant Women Dress',
      'price': 5200,
      'oldPrice': 6200,
      'rating': 4.7,
      'reviews': 156,
      'icon': Icons.dry_cleaning_rounded,
      'color1': Color(0xFF111827),
      'color2': Color.fromARGB(255, 23, 212, 155),
      'category': 'Women',
      'discount': '16% OFF',
    },
    {
      'name': 'Luxury Hand Bag',
      'price': 3800,
      'oldPrice': 4500,
      'rating': 4.9,
      'reviews': 201,
      'icon': Icons.shopping_bag_outlined,
      'color1': Color(0xFF111827),
      'color2': Color(0xFFD4A017),
      'category': 'Women',
      'discount': '15% OFF',
    },
    {
      'name': 'Modern Sneakers',
      'price': 6200,
      'oldPrice': 7500,
      'rating': 4.8,
      'reviews': 178,
      'icon': Icons.directions_run_rounded,
      'color1': Color(0xFF111827),
      'color2': Color(0xFFD4A017),
      'category': 'Men',
      'discount': '17% OFF',
    },
    {
      'name': 'Kids Fashion Set',
      'price': 2800,
      'oldPrice': 3400,
      'rating': 4.6,
      'reviews': 72,
      'icon': Icons.child_friendly_rounded,
      'color1': Color(0xFF111827),
      'color2': Color(0xFFD4A017),
      'category': 'Kids',
      'discount': '18% OFF',
    },
    {
      'name': 'Casual White Shirt',
      'price': 2900,
      'oldPrice': 3500,
      'rating': 4.7,
      'reviews': 95,
      'icon': Icons.checkroom_outlined,
      'color1': Color(0xFF111827),
      'color2': Color(0xFFD4A017),
      'category': 'Men',
      'discount': '17% OFF',
    },
    {
      'name': 'Women Summer Top',
      'price': 2600,
      'oldPrice': 3200,
      'rating': 4.8,
      'reviews': 113,
      'icon': Icons.dry_cleaning_outlined,
      'color1': Color(0xFF111827),
      'color2': Color(0xFFD4A017),
      'category': 'Women',
      'discount': '19% OFF',
    },
  ];

  // ============================================================
  // FILTERED PRODUCTS
  // ============================================================

  List<Map<String, dynamic>> get filteredProducts {
    if (selectedCategory == 'All') {
      return products;
    }

    return products
        .where(
          (product) => product['category'] == selectedCategory,
        )
        .toList();
  }

  // ============================================================
  // ADD TO CART
  // ============================================================

  void addToCart(Map<String, dynamic> product) {
    CartManager.addToCart(
      CartItem(
        name: product['name'],
        price: product['price'],
        icon: product['icon'],
      ),
    );

    setState(() {});

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(
              Icons.check_circle_rounded,
              color: Colors.white,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                '${product['name']} added to bag',
              ),
            ),
          ],
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        margin: const EdgeInsets.all(16),
      ),
    );
  }

  // ============================================================
  // TOGGLE WISHLIST
  // ============================================================

  void toggleWishlist(Map<String, dynamic> product) {
    final name = product['name'];

    if (WishlistManager.isInWishlist(name)) {
      WishlistManager.removeFromWishlist(name);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Removed from wishlist'),
          behavior: SnackBarBehavior.floating,
          backgroundColor: primary,
        ),
      );
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

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Added to wishlist'),
          behavior: SnackBarBehavior.floating,
          backgroundColor: primary,
        ),
      );
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,

      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [

          // ============================================================
          // PREMIUM HEADER
          // ============================================================

          SliverAppBar(
            expandedHeight: 310,
            pinned: true,
            elevation: 0,
            backgroundColor: primary,

            leading: Padding(
              padding: const EdgeInsets.all(8),
              child: _glassButton(
                icon: Icons.arrow_back_ios_new_rounded,
                onTap: () => Navigator.pop(context),
              ),
            ),

            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 14),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    _glassButton(
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

                    if (CartManager.count > 0)
                      Positioned(
                        right: -2,
                        top: -2,
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: const BoxDecoration(
                            color: accent,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              CartManager.count.toString(),
                              style: const TextStyle(
                                color: primary,
                                fontSize: 9,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],

            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      primary,
                      Color(0xFF1B2433),
                      Color.fromARGB(255, 23, 212, 155),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),

                child: Stack(
                  children: [

                    // Decorative circles
                    Positioned(
                      right: -60,
                      top: 35,
                      child: Container(
                        width: 210,
                        height: 210,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(.045),
                        ),
                      ),
                    ),

                    Positioned(
                      right: 45,
                      top: 85,
                      child: Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white.withOpacity(.12),
                            width: 1,
                          ),
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
                          color: Colors.white.withOpacity(.035),
                        ),
                      ),
                    ),

                    // Main content
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
                              color: Colors.white.withOpacity(.12),
                              borderRadius:
                                  BorderRadius.circular(30),
                              border: Border.all(
                                color:
                                    Colors.white.withOpacity(.12),
                              ),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.auto_awesome_rounded,
                                  color: accent,
                                  size: 14,
                                ),
                                SizedBox(width: 6),
                                Text(
                                  'JUST DROPPED',
                                  style: TextStyle(
                                    color: accent,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 1.6,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 13),

                          const Text(
                            'New Arrivals',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 36,
                              fontWeight: FontWeight.w900,
                              letterSpacing: -.8,
                            ),
                          ),

                          const SizedBox(height: 5),

                          const Text(
                            'Fresh styles. New energy.',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),

                          const SizedBox(height: 17),

                          Row(
                            children: [
                              _headerMiniStat(
                                '${products.length}',
                                'New Pieces',
                              ),
                              const SizedBox(width: 10),
                              _headerMiniStat(
                                '20%',
                                'Up To Off',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ============================================================
          // SECTION HEADER
          // ============================================================

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                20,
                25,
                20,
                17,
              ),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [

                  const Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Latest Collection',
                        style: TextStyle(
                          color: primary,
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Discover what just arrived',
                        style: TextStyle(
                          color: Color(0xFF85818F),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 13,
                      vertical: 9,
                    ),
                    decoration: BoxDecoration(
                      color: accent.withOpacity(.12),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      '${filteredProducts.length} Items',
                      style: const TextStyle(
                        color: accent,
                        fontWeight: FontWeight.w900,
                        fontSize: 11,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ============================================================
          // FILTERS
          // ============================================================

          SliverToBoxAdapter(
            child: SizedBox(
              height: 48,
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20),
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                children: [
                  _categoryChip('All'),
                  _categoryChip('Men'),
                  _categoryChip('Women'),
                  _categoryChip('Kids'),
                ],
              ),
            ),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(height: 22),
          ),

          // ============================================================
          // FEATURED PRODUCT
          // ============================================================

          if (selectedCategory == 'All')
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20),
                child: _featuredProduct(products.first),
              ),
            ),

          if (selectedCategory == 'All')
            const SliverToBoxAdapter(
              child: SizedBox(height: 28),
            ),

          // ============================================================
          // PRODUCT TITLE
          // ============================================================

          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  const Text(
                    'Explore More',
                    style: TextStyle(
                      color: primary,
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${filteredProducts.length} products',
                    style: const TextStyle(
                      color: Color(0xFF8B8795),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(height: 15),
          ),

          // ============================================================
          // PRODUCT GRID
          // ============================================================

          SliverPadding(
            padding:
                const EdgeInsets.symmetric(horizontal: 18),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final product = filteredProducts[index];

                  return _NewArrivalCard(
                    product: product,
                    onFavorite: () =>
                        toggleWishlist(product),
                    onAddToCart: () =>
                        addToCart(product),
                  );
                },
                childCount: filteredProducts.length,
              ),

              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 18,
                childAspectRatio: .61,
              ),
            ),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(height: 45),
          ),
        ],
      ),
    );
  }

  // ================================================================
  // CATEGORY CHIP
  // ================================================================

  Widget _categoryChip(String title) {
    final selected = selectedCategory == title;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = title;
        });
      },

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        margin: const EdgeInsets.only(right: 10),

        padding: const EdgeInsets.symmetric(
          horizontal: 19,
          vertical: 11,
        ),

        decoration: BoxDecoration(
          color: selected
              ? accent
              : Colors.white,

          borderRadius: BorderRadius.circular(30),

          border: Border.all(
            color: selected
                ? accent
                : const Color(0xFFE5E3EA),
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
                : const Color(0xFF55525F),
            fontSize: 12,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }

  // ================================================================
  // FEATURED PRODUCT
  // ================================================================

  Widget _featuredProduct(Map<String, dynamic> product) {
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
        height: 205,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(27),

          gradient: const LinearGradient(
            colors: [
              primary,
              Color(0xFF1B2433),
              accent,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),

          boxShadow: [
            BoxShadow(
              color: accent.withOpacity(.22),
              blurRadius: 25,
              offset: const Offset(0, 12),
            ),
          ],
        ),

        child: Stack(
          children: [

            Positioned(
              right: -35,
              top: -40,
              child: Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.06),
                  shape: BoxShape.circle,
                ),
              ),
            ),

            Positioned(
              right: 25,
              bottom: 15,
              child: Icon(
                product['icon'],
                color: Colors.white.withOpacity(.92),
                size: 120,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(22),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [

                  Container(
                    padding:
                        const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(10),
                    ),

                    child: const Text(
                      'EDITOR\'S PICK',
                      style: TextStyle(
                        color: primary,
                        fontSize: 9,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1,
                      ),
                    ),
                  ),

                  const Spacer(),

                  const Text(
                    'THE NEW DROP',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 10,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.5,
                    ),
                  ),

                  const SizedBox(height: 5),

                  SizedBox(
                    width: 180,
                    child: Text(
                      product['name'],
                      maxLines: 2,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    'Rs. ${product['price']}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),

            Positioned(
              right: 18,
              bottom: 17,

              child: Container(
                width: 42,
                height: 42,

                decoration: BoxDecoration(
                  color: accent,
                  borderRadius:
                      BorderRadius.circular(14),
                ),

                child: const Icon(
                  Icons.arrow_forward_rounded,
                  color: primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ================================================================
  // HEADER MINI STAT
  // ================================================================

  Widget _headerMiniStat(
    String value,
    String label,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),

      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.10),
        borderRadius: BorderRadius.circular(13),
        border: Border.all(
          color: Colors.white.withOpacity(.08),
        ),
      ),

      child: Row(
        children: [
          Text(
            value,
            style: const TextStyle(
              color: accent,
              fontSize: 13,
              fontWeight: FontWeight.w900,
            ),
          ),

          const SizedBox(width: 5),

          Text(
            label,
            style: const TextStyle(
              color: Colors.white60,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  // ================================================================
  // GLASS BUTTON
  // ================================================================

  Widget _glassButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Container(
      width: 43,
      height: 43,

      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.11),
        shape: BoxShape.circle,

        border: Border.all(
          color: Colors.white.withOpacity(.08),
        ),
      ),

      child: IconButton(
        onPressed: onTap,

        icon: Icon(
          icon,
          color: Colors.white,
          size: 18,
        ),
      ),
    );
  }
}

// ====================================================================
// PRODUCT CARD
// ====================================================================

class _NewArrivalCard extends StatelessWidget {
  final Map<String, dynamic> product;
  final VoidCallback onFavorite;
  final VoidCallback onAddToCart;

  const _NewArrivalCard({
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
          borderRadius: BorderRadius.circular(24),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.055),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [

            // --------------------------------------------------------
            // PRODUCT VISUAL
            // --------------------------------------------------------

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
                          primaryColor,
                          Color(0xFF1B2433),
                          accentColor,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),

                    child: Stack(
                      alignment: Alignment.center,
                      children: [

                        Positioned(
                          right: -25,
                          top: -25,

                          child: Container(
                            width: 100,
                            height: 100,

                            decoration:
                                BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white
                                  .withOpacity(.07),
                            ),
                          ),
                        ),

                        Icon(
                          product['icon'],
                          color: Colors.white,
                          size: 70,
                        ),
                      ],
                    ),
                  ),

                  // ------------------------------------------------
                  // NEW BADGE
                  // ------------------------------------------------

                  Positioned(
                    left: 10,
                    top: 10,

                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(
                        horizontal: 9,
                        vertical: 6,
                      ),

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(10),
                      ),

                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          Icon(
                            Icons.auto_awesome,
                            color: accentColor,
                            size: 11,
                          ),

                          SizedBox(width: 4),

                          Text(
                            'NEW',
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 8,
                              fontWeight:
                                  FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // ------------------------------------------------
                  // FAVORITE
                  // ------------------------------------------------

                  Positioned(
                    right: 10,
                    top: 10,

                    child: GestureDetector(
                      onTap: onFavorite,

                      child: Container(
                        width: 36,
                        height: 36,

                        decoration: BoxDecoration(
                          color: Colors.black
                              .withOpacity(.20),
                          shape: BoxShape.circle,
                        ),

                        child: Icon(
                          favorite
                              ? Icons.favorite_rounded
                              : Icons
                                  .favorite_border_rounded,

                          color: favorite
                              ? accentColor
                              : Colors.white,

                          size: 19,
                        ),
                      ),
                    ),
                  ),

                  // ------------------------------------------------
                  // DISCOUNT
                  // ------------------------------------------------

                  Positioned(
                    left: 10,
                    bottom: 10,

                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 5,
                      ),

                      decoration: BoxDecoration(
                        color: primaryColor.withOpacity(.82),
                        borderRadius:
                            BorderRadius.circular(8),
                      ),

                      child: Text(
                        product['discount'],
                        style: const TextStyle(
                          color: accentColor,
                          fontSize: 8,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // --------------------------------------------------------
            // PRODUCT DETAILS
            // --------------------------------------------------------

            Padding(
              padding: const EdgeInsets.fromLTRB(
                12,
                11,
                12,
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
                      color: Color(0xFF918D99),
                      fontSize: 8,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.2,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    product['name'],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,

                    style: const TextStyle(
                      color: primaryColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  const SizedBox(height: 6),

                  // ------------------------------------------------
                  // RATING
                  // ------------------------------------------------

                  Row(
                    children: [

                      const Icon(
                        Icons.star_rounded,
                        color: accentColor,
                        size: 14,
                      ),

                      const SizedBox(width: 3),

                      Text(
                        '${product['rating']}',
                        style: const TextStyle(
                          color: Color(0xFF55525F),
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      const SizedBox(width: 4),

                      Text(
                        '(${product['reviews']})',
                        style: const TextStyle(
                          color: Color(0xFF9A96A2),
                          fontSize: 9,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // ------------------------------------------------
                  // PRICE + ADD BUTTON
                  // ------------------------------------------------

                  Row(
                    crossAxisAlignment:
                        CrossAxisAlignment.end,

                    children: [

                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,

                          children: [

                            Text(
                              'Rs. ${product['price']}',

                              style: const TextStyle(
                                color: accentColor,
                                fontSize: 15,
                                fontWeight:
                                    FontWeight.w900,
                              ),
                            ),

                            const SizedBox(height: 1),

                            Text(
                              'Rs. ${product['oldPrice']}',

                              style: const TextStyle(
                                color:
                                    Color(0xFFAAA6B1),
                                fontSize: 9,
                                decoration:
                                    TextDecoration
                                        .lineThrough,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Add button
                      GestureDetector(
                        onTap: onAddToCart,

                        child: Container(
                          width: 34,
                          height: 34,

                          decoration: BoxDecoration(
                            color: accentColor,

                            borderRadius:
                                BorderRadius.circular(11),

                            boxShadow: [
                              BoxShadow(
                                color: accentColor
                                    .withOpacity(.25),
                                blurRadius: 8,
                                offset:
                                    const Offset(0, 4),
                              ),
                            ],
                          ),

                          child: const Icon(
                            Icons.add_rounded,
                            color: primaryColor,
                            size: 20,
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