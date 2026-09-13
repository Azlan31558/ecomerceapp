import 'package:flutter/material.dart';
import 'package:newecommapp/cart.dart';

class WishlistItem {
  final String name;
  final int price;
  final IconData icon;
  final Color color1;
  final Color color2;

  WishlistItem({
    required this.name,
    required this.price,
    required this.icon,
    required this.color1,
    required this.color2,
  });
}

// ============================================================
// WISHLIST MANAGER
// ============================================================

class WishlistManager {
  static final List<WishlistItem> items = [];

  static void addToWishlist(WishlistItem item) {
    final alreadyExists = items.any(
      (product) => product.name == item.name,
    );

    if (!alreadyExists) {
      items.add(item);
    }
  }

  static void removeFromWishlist(String name) {
    items.removeWhere(
      (product) => product.name == name,
    );
  }

  static bool isInWishlist(String name) {
    return items.any(
      (product) => product.name == name,
    );
  }

  static int get count => items.length;
}

// ============================================================
// WISHLIST SCREEN
// ============================================================

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  // ==========================================================
  // THEME
  // ==========================================================

  static const Color primary = Color(0xFF111827);
  static const Color accent = Color.fromARGB(255, 23, 212, 155);
  static const Color background = Color(0xFFF8F7F3);

  @override
  Widget build(BuildContext context) {
    final products = WishlistManager.items;

    return Scaffold(
      backgroundColor: background,

      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),

        slivers: [
          // ==================================================
          // APP BAR
          // ==================================================

          SliverAppBar(
            pinned: true,
            expandedHeight: 180,
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
              'WISHLIST',
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
                      top: 10,

                      child: Container(
                        width: 170,
                        height: 170,

                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(.06),
                        ),
                      ),
                    ),

                    // Decorative circle
                    Positioned(
                      left: -40,
                      bottom: -80,

                      child: Container(
                        width: 160,
                        height: 160,

                        decoration: BoxDecoration(
                          shape: BoxShape.circle,

                          border: Border.all(
                            color: Colors.white.withOpacity(.07),
                            width: 2,
                          ),
                        ),
                      ),
                    ),

                    const Positioned(
                      left: 20,
                      bottom: 25,

                      child: Text(
                        'YOUR FAVORITES',
                        style: TextStyle(
                          color: accent,
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ==================================================
          // WISHLIST COUNT
          // ==================================================

          if (products.isNotEmpty)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  20,
                  20,
                  20,
                  5,
                ),

                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,

                  children: [
                    const Text(
                      'Saved Items',

                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w900,
                        color: primary,
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 13,
                        vertical: 8,
                      ),

                      decoration: BoxDecoration(
                        color: const Color(0xFFF7F0D8),
                        borderRadius:
                            BorderRadius.circular(14),
                      ),

                      child: Text(
                        '${products.length} Items',

                        style: const TextStyle(
                          color: accent,
                          fontWeight: FontWeight.w800,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

          // ==================================================
          // EMPTY WISHLIST
          // ==================================================

          if (products.isEmpty)
            SliverFillRemaining(
              hasScrollBody: false,

              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(30),

                  child: Column(
                    mainAxisAlignment:
                        MainAxisAlignment.center,

                    children: [
                      // Empty wishlist icon
                      Container(
                        width: 110,
                        height: 110,

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
                              color: accent.withOpacity(.20),
                              blurRadius: 30,
                              offset: const Offset(0, 12),
                            ),
                          ],
                        ),

                        child: const Icon(
                          Icons.favorite_border_rounded,
                          color: Colors.white,
                          size: 50,
                        ),
                      ),

                      const SizedBox(height: 25),

                      const Text(
                        'Your Wishlist is Empty',

                        textAlign: TextAlign.center,

                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                          color: primary,
                        ),
                      ),

                      const SizedBox(height: 10),

                      const Text(
                        'Save your favorite products here\n'
                        'and find them anytime.',

                        textAlign: TextAlign.center,

                        style: TextStyle(
                          color: Colors.grey,
                          height: 1.5,
                          fontSize: 14,
                        ),
                      ),

                      const SizedBox(height: 25),

                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pop(context);
                        },

                        icon: const Icon(
                          Icons.shopping_bag_outlined,
                        ),

                        label: const Text(
                          'Continue Shopping',
                        ),

                        style: ElevatedButton.styleFrom(
                          backgroundColor: accent,
                          foregroundColor: primary,
                          elevation: 0,

                          padding:
                              const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 15,
                          ),

                          shape:
                              RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )

          // ==================================================
          // WISHLIST PRODUCTS
          // ==================================================

          else
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(
                20,
                15,
                20,
                30,
              ),

              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final product = products[index];

                    return Padding(
                      padding:
                          const EdgeInsets.only(bottom: 15),

                      child: _WishlistProductCard(
                        product: product,

                        onRemove: () {
                          setState(() {
                            WishlistManager
                                .removeFromWishlist(
                              product.name,
                            );
                          });

                          ScaffoldMessenger.of(context)
                              .showSnackBar(
                            SnackBar(
                              behavior:
                                  SnackBarBehavior.floating,

                              backgroundColor: primary,

                              shape:
                                  RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(16),
                              ),

                              content: const Row(
                                children: [
                                  Icon(
                                    Icons
                                        .favorite_border_rounded,
                                    color: accent,
                                  ),

                                  SizedBox(width: 10),

                                  Text(
                                    'Removed from wishlist',

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
                      ),
                    );
                  },

                  childCount: products.length,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// ============================================================
// WISHLIST PRODUCT CARD
// ============================================================

class _WishlistProductCard extends StatelessWidget {
  final WishlistItem product;
  final VoidCallback onRemove;

  const _WishlistProductCard({
    required this.product,
    required this.onRemove,
  });

  static const Color primary = Color(0xFF111827);
  static const Color accent = Color.fromARGB(255, 23, 212, 155);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 145,

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

      child: Row(
        children: [
          // ==================================================
          // PRODUCT IMAGE
          // ==================================================

          Container(
            width: 125,
            height: double.infinity,

            decoration: BoxDecoration(
              borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(24),
              ),

              gradient: LinearGradient(
                colors: [
                  product.color1,
                  product.color2,
                ],

                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),

            child: Stack(
              children: [
                // Decorative circle
                Positioned(
                  right: -20,
                  top: -20,

                  child: Container(
                    width: 80,
                    height: 80,

                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(.08),
                    ),
                  ),
                ),

                Center(
                  child: Icon(
                    product.icon,
                    color: Colors.white,
                    size: 55,
                  ),
                ),
              ],
            ),
          ),

          // ==================================================
          // PRODUCT DETAILS
          // ==================================================

          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                15,
                15,
                12,
                15,
              ),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          product.name,

                          maxLines: 2,
                          overflow:
                              TextOverflow.ellipsis,

                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w900,
                            color: primary,
                          ),
                        ),
                      ),

                      const SizedBox(width: 8),

                      // REMOVE BUTTON
                      GestureDetector(
                        onTap: onRemove,

                        child: Container(
                          width: 34,
                          height: 34,

                          decoration: BoxDecoration(
                            color: const Color(0xFFF7F0D8),

                            borderRadius:
                                BorderRadius.circular(11),
                          ),

                          child: const Icon(
                            Icons.delete_outline_rounded,
                            size: 19,
                            color: accent,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),

                  // PRICE
                  Text(
                    'Rs. ${product.price}',

                    style: const TextStyle(
                      color: accent,
                      fontSize: 17,
                      fontWeight: FontWeight.w900,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // =================================================
                  // ADD TO CART
                  // =================================================

                  SizedBox(
                    height: 38,

                    child: ElevatedButton.icon(
                      onPressed: () {
                        CartManager.addToCart(
                          CartItem(
                            name: product.name,
                            price: product.price,
                            icon: product.icon,
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

                      icon: const Icon(
                        Icons.shopping_bag_outlined,
                        size: 17,
                      ),

                      label: const Text(
                        'Add to Bag',

                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                        ),
                      ),

                      style: ElevatedButton.styleFrom(
                        backgroundColor: accent,
                        foregroundColor: primary,
                        elevation: 0,

                        padding:
                            const EdgeInsets.symmetric(
                          horizontal: 14,
                        ),

                        shape:
                            RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}