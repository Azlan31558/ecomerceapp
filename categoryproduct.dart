import 'package:flutter/material.dart';
import 'package:newecommapp/apptheme.dart';
import 'package:newecommapp/cart.dart';
import 'package:newecommapp/searchscreen.dart';
import 'package:newecommapp/wishlist.dart';

class CategoryProductsScreen extends StatefulWidget {
  final String category;

  const CategoryProductsScreen({
    super.key,
    required this.category,
  });

  @override
  State<CategoryProductsScreen> createState() =>
      _CategoryProductsScreenState();
}

class _CategoryProductsScreenState extends State<CategoryProductsScreen> {
  String selectedFilter = 'Default';

  // ============================================================
  // PRODUCTS
  // ============================================================

  List<Map<String, dynamic>> get products {
    if (widget.category == 'Men') {
      return [
        {
          'name': 'Classic Black Shirt',
          'price': 2499,
          'icon': Icons.checkroom_rounded,
          'color1': AppColors.primary,
          'color2': AppColors.accentss,
          'tag': 'POPULAR',
          'rating': 4.8,
        },
        {
          'name': 'Premium Denim Jacket',
          'price': 4299,
          'icon': Icons.dry_cleaning_rounded,
          'color1': AppColors.primary,
          'color2': AppColors.accentss,
          'tag': 'TRENDING',
          'rating': 4.7,
        },
        {
          'name': 'Casual White T-Shirt',
          'price': 1799,
          'icon': Icons.checkroom_outlined,
          'color1': AppColors.primary,
          'color2': AppColors.accentss,
          'tag': 'NEW',
          'rating': 4.6,
        },
        {
          'name': 'Urban Hoodie',
          'price': 3299,
          'icon': Icons.hiking_rounded,
          'color1': AppColors.primary,
          'color2': AppColors.accentss,
          'tag': 'HOT',
          'rating': 4.9,
        },
        {
          'name': 'Premium Polo',
          'price': 2899,
          'icon': Icons.dry_cleaning_outlined,
          'color1': AppColors.primary,
          'color2': AppColors.accentss,
          'tag': 'POPULAR',
          'rating': 4.5,
        },
        {
          'name': 'Slim Fit Trousers',
          'price': 3499,
          'icon': Icons.straighten_rounded,
          'color1': AppColors.primary,
          'color2': AppColors.accentss,
          'tag': 'LUXURY',
          'rating': 4.8,
        },
        {
          'name': 'Casual Sneakers',
          'price': 4999,
          'icon': Icons.directions_run_rounded,
          'color1': AppColors.primary,
          'color2': AppColors.accentss,
          'tag': 'TRENDING',
          'rating': 4.9,
        },
        {
          'name': 'Leather Wallet',
          'price': 1999,
          'icon': Icons.account_balance_wallet_rounded,
          'color1': AppColors.primary,
          'color2': AppColors.accentss,
          'tag': 'HOT',
          'rating': 4.6,
        },
        {
          'name': 'Classic Watch',
          'price': 5999,
          'icon': Icons.watch_rounded,
          'color1': AppColors.primary,
          'color2': AppColors.accentss,
          'tag': 'LUXURY',
          'rating': 4.9,
        },
        {
          'name': 'Formal Blazer',
          'price': 6999,
          'icon': Icons.business_center_rounded,
          'color1': AppColors.primary,
          'color2': AppColors.accentss,
          'tag': 'POPULAR',
          'rating': 4.8,
        },
        {
          'name': 'Summer Shorts',
          'price': 2199,
          'icon': Icons.short_text_rounded,
          'color1': AppColors.primary,
          'color2': AppColors.accentss,
          'tag': 'NEW',
          'rating': 4.5,
        },
        {
          'name': 'Sport Sneakers',
          'price': 4499,
          'icon': Icons.sports_rounded,
          'color1': AppColors.primary,
          'color2': AppColors.accentss,
          'tag': 'HOT',
          'rating': 4.7,
        },
      ];
    }

    if (widget.category == 'Women') {
      return [
        {
          'name': 'Elegant Summer Dress',
          'price': 3999,
          'icon': Icons.checkroom_rounded,
          'color1': AppColors.primary,
          'color2': AppColors.accentss,
          'tag': 'POPULAR',
          'rating': 4.9,
        },
        {
          'name': 'Luxury Handbag',
          'price': 5499,
          'icon': Icons.shopping_bag_rounded,
          'color1': AppColors.primary,
          'color2': AppColors.accentss,
          'tag': 'LUXURY',
          'rating': 4.8,
        },
        {
          'name': 'Classic Heels',
          'price': 4299,
          'icon': Icons.shopping_bag_outlined,
          'color1': AppColors.primary,
          'color2': AppColors.accentss,
          'tag': 'HOT',
          'rating': 4.7,
        },
        {
          'name': 'Silk Scarf',
          'price': 1999,
          'icon': Icons.layers_rounded,
          'color1': AppColors.primary,
          'color2': AppColors.accentss,
          'tag': 'NEW',
          'rating': 4.5,
        },
        {
          'name': 'Premium Kurti',
          'price': 3299,
          'icon': Icons.checkroom_outlined,
          'color1': AppColors.primary,
          'color2': AppColors.accentss,
          'tag': 'TRENDING',
          'rating': 4.8,
        },
        {
          'name': 'Designer Earrings',
          'price': 2499,
          'icon': Icons.circle_outlined,
          'color1': AppColors.primary,
          'color2': AppColors.accentss,
          'tag': 'LUXURY',
          'rating': 4.6,
        },
        {
          'name': 'Casual Sneakers',
          'price': 4599,
          'icon': Icons.directions_run_rounded,
          'color1': AppColors.primary,
          'color2': AppColors.accentss,
          'tag': 'POPULAR',
          'rating': 4.8,
        },
        {
          'name': 'Winter Coat',
          'price': 6499,
          'icon': Icons.ac_unit_rounded,
          'color1': AppColors.primary,
          'color2': AppColors.accentss,
          'tag': 'TRENDING',
          'rating': 4.9,
        },
      ];
    }

    if (widget.category == 'Kids') {
      return [
        {
          'name': 'Kids Casual T-Shirt',
          'price': 1299,
          'icon': Icons.checkroom_rounded,
          'color1': AppColors.primary,
          'color2': AppColors.accentss,
          'tag': 'POPULAR',
          'rating': 4.7,
        },
        {
          'name': 'Kids Hoodie',
          'price': 1999,
          'icon': Icons.hiking_rounded,
          'color1': AppColors.primary,
          'color2': AppColors.accentss,
          'tag': 'HOT',
          'rating': 4.8,
        },
        {
          'name': 'Kids Sneakers',
          'price': 2499,
          'icon': Icons.directions_run_rounded,
          'color1': AppColors.primary,
          'color2': AppColors.accentss,
          'tag': 'TRENDING',
          'rating': 4.9,
        },
        {
          'name': 'Kids Denim Jacket',
          'price': 2999,
          'icon': Icons.dry_cleaning_rounded,
          'color1': AppColors.primary,
          'color2': AppColors.accentss,
          'tag': 'NEW',
          'rating': 4.6,
        },
        {
          'name': 'Kids Summer Dress',
          'price': 2299,
          'icon': Icons.checkroom_outlined,
          'color1': AppColors.primary,
          'color2': AppColors.accentss,
          'tag': 'POPULAR',
          'rating': 4.8,
        },
        {
          'name': 'School Backpack',
          'price': 2799,
          'icon': Icons.backpack_rounded,
          'color1': AppColors.primary,
          'color2': AppColors.accentss,
          'tag': 'HOT',
          'rating': 4.7,
        },
        {
          'name': 'Kids Cap',
          'price': 899,
          'icon': Icons.sports_baseball_rounded,
          'color1': AppColors.primary,
          'color2': AppColors.accentss,
          'tag': 'NEW',
          'rating': 4.4,
        },
        {
          'name': 'Kids Sports Set',
          'price': 3199,
          'icon': Icons.sports_rounded,
          'color1': AppColors.primary,
          'color2': AppColors.accentss,
          'tag': 'TRENDING',
          'rating': 4.8,
        },
      ];
    }

    return productsForAll;
  }

  // ============================================================
  // ALL PRODUCTS
  // ============================================================

  List<Map<String, dynamic>> get productsForAll {
    return [
      {
        'name': 'Classic Black Shirt',
        'price': 2499,
        'icon': Icons.checkroom_rounded,
        'color1': AppColors.primary,
        'color2': AppColors.accentss,
        'tag': 'POPULAR',
        'rating': 4.8,
      },
      {
        'name': 'Elegant Summer Dress',
        'price': 3999,
        'icon': Icons.checkroom_rounded,
        'color1': AppColors.primary,
        'color2': AppColors.accentss,
        'tag': 'POPULAR',
        'rating': 4.9,
      },
      {
        'name': 'Premium Denim Jacket',
        'price': 4299,
        'icon': Icons.dry_cleaning_rounded,
        'color1': AppColors.primary,
        'color2': AppColors.accentss,
        'tag': 'TRENDING',
        'rating': 4.7,
      },
      {
        'name': 'Luxury Handbag',
        'price': 5499,
        'icon': Icons.shopping_bag_rounded,
        'color1': AppColors.primary,
        'color2': AppColors.accentss,
        'tag': 'LUXURY',
        'rating': 4.8,
      },
      {
        'name': 'Urban Hoodie',
        'price': 3299,
        'icon': Icons.hiking_rounded,
        'color1': AppColors.primary,
        'color2': AppColors.accentss,
        'tag': 'HOT',
        'rating': 4.9,
      },
      {
        'name': 'Kids Sneakers',
        'price': 2499,
        'icon': Icons.directions_run_rounded,
        'color1': AppColors.primary,
        'color2': AppColors.accentss,
        'tag': 'TRENDING',
        'rating': 4.9,
      },
    ];
  }

  // ============================================================
  // FILTERED PRODUCTS
  // ============================================================

  List<Map<String, dynamic>> get filteredProducts {
    final items = List<Map<String, dynamic>>.from(products);

    switch (selectedFilter) {
      case 'Price Low to High':
        items.sort(
          (a, b) => (a['price'] as int).compareTo(b['price'] as int),
        );
        break;

      case 'Price High to Low':
        items.sort(
          (a, b) => (b['price'] as int).compareTo(a['price'] as int),
        );
        break;

      case 'Name A to Z':
        items.sort(
          (a, b) => a['name']
              .toString()
              .toLowerCase()
              .compareTo(b['name'].toString().toLowerCase()),
        );
        break;

      case 'Popular':
        final popularOrder = {
          'POPULAR': 0,
          'TRENDING': 1,
          'HOT': 2,
          'LUXURY': 3,
          'NEW': 4,
        };

        items.sort(
          (a, b) => (popularOrder[a['tag']] ?? 99)
              .compareTo(popularOrder[b['tag']] ?? 99),
        );
        break;

      case 'Default':
      default:
        break;
    }

    return items;
  }

  // ============================================================
  // FILTER BOTTOM SHEET
  // ============================================================

  void showFilterSheet() {
    String temporaryFilter = selectedFilter;

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setSheetState) {
            return Container(
              padding: const EdgeInsets.fromLTRB(22, 14, 22, 25),
              decoration: const BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              child: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 45,
                      height: 5,
                      decoration: BoxDecoration(
                        color: AppColors.lightGrey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),

                    const SizedBox(height: 20),

                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'Filter & Sort',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w900,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(
                            Icons.close_rounded,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    _FilterOption(
                      title: 'Default',
                      subtitle: 'Recommended products',
                      icon: Icons.auto_awesome_rounded,
                      selected: temporaryFilter == 'Default',
                      onTap: () {
                        setSheetState(() {
                          temporaryFilter = 'Default';
                        });
                      },
                    ),

                    _FilterOption(
                      title: 'Price Low to High',
                      subtitle: 'Cheapest products first',
                      icon: Icons.arrow_upward_rounded,
                      selected: temporaryFilter == 'Price Low to High',
                      onTap: () {
                        setSheetState(() {
                          temporaryFilter = 'Price Low to High';
                        });
                      },
                    ),

                    _FilterOption(
                      title: 'Price High to Low',
                      subtitle: 'Most expensive products first',
                      icon: Icons.arrow_downward_rounded,
                      selected: temporaryFilter == 'Price High to Low',
                      onTap: () {
                        setSheetState(() {
                          temporaryFilter = 'Price High to Low';
                        });
                      },
                    ),

                    _FilterOption(
                      title: 'Name A to Z',
                      subtitle: 'Alphabetical order',
                      icon: Icons.sort_by_alpha_rounded,
                      selected: temporaryFilter == 'Name A to Z',
                      onTap: () {
                        setSheetState(() {
                          temporaryFilter = 'Name A to Z';
                        });
                      },
                    ),

                    _FilterOption(
                      title: 'Popular',
                      subtitle: 'Most popular products first',
                      icon: Icons.local_fire_department_rounded,
                      selected: temporaryFilter == 'Popular',
                      onTap: () {
                        setSheetState(() {
                          temporaryFilter = 'Popular';
                        });
                      },
                    ),

                    const SizedBox(height: 15),

                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            selectedFilter = temporaryFilter;
                          });

                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.accentss,
                          foregroundColor: AppColors.primary,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        child: const Text(
                          'Apply Filter',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    final items = filteredProducts;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          // ======================================================
          // HEADER
          // ======================================================

          SliverAppBar(
            expandedHeight: 245,
            pinned: true,
            elevation: 0,
            backgroundColor: AppColors.primary,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primary,
                      AppColors.accentss,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      right: -55,
                      top: -45,
                      child: Container(
                        width: 180,
                        height: 180,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.08),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),

                    Positioned(
                      left: -70,
                      bottom: -80,
                      child: Container(
                        width: 190,
                        height: 190,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.06),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),

                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(
                          20,
                          15,
                          20,
                          20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                _HeaderButton(
                                  icon: Icons.arrow_back_rounded,
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                ),

                                const Spacer(),

                                _HeaderButton(
                                  icon: Icons.search_rounded,
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const SearchScreen(),
                                      ),
                                    );
                                  },
                                ),

                                const SizedBox(width: 10),

                                Stack(
                                  children: [
                                    _HeaderButton(
                                      icon: Icons.shopping_cart_outlined,
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const CartScreen(),
                                          ),
                                        );
                                      },
                                    ),

                                    if (CartManager.count > 0)
                                      Positioned(
                                        right: 0,
                                        top: 0,
                                        child: Container(
                                          width: 18,
                                          height: 18,
                                          decoration: const BoxDecoration(
                                            color: AppColors.accentss,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                            child: Text(
                                              CartManager.count.toString(),
                                              style: const TextStyle(
                                                color: AppColors.primary,
                                                fontSize: 9,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),

                            const Spacer(),

                            Text(
                              widget.category.toUpperCase(),
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 11,
                                letterSpacing: 2.2,
                                fontWeight: FontWeight.w800,
                              ),
                            ),

                            const SizedBox(height: 6),

                            Text(
                              widget.category,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.w900,
                              ),
                            ),

                            const SizedBox(height: 5),

                            const Text(
                              'Curated pieces. Effortless style.',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ======================================================
          // FILTER BAR
          // ======================================================

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 22, 20, 12),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Curated for you',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w900,
                            color: AppColors.primary,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          '${items.length} products',
                          style: const TextStyle(
                            fontSize: 11,
                            color: AppColors.grey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),

                  GestureDetector(
                    onTap: showFilterSheet,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: AppColors.lightGrey,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.04),
                            blurRadius: 15,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.tune_rounded,
                            size: 16,
                            color: AppColors.accentss,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            selectedFilter == 'Default'
                                ? 'Filter'
                                : selectedFilter,
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w800,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ======================================================
          // PRODUCT GRID
          // ======================================================

          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 30),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final product = items[index];

                  return EditorialProductCard(
                    product: product,
                  );
                },
                childCount: items.length,
              ),
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 18,
                childAspectRatio: .67,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ================================================================
// HEADER BUTTON
// ================================================================

class _HeaderButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _HeaderButton({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.12),
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white.withOpacity(.15),
          ),
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

// ================================================================
// FILTER OPTION
// ================================================================

class _FilterOption extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  const _FilterOption({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 9),
        padding: const EdgeInsets.all(13),
        decoration: BoxDecoration(
          color: selected
              ? AppColors.accentss.withOpacity(.10)
              : AppColors.white,
          borderRadius: BorderRadius.circular(17),
          border: Border.all(
            color: selected
                ? AppColors.accentss
                : Colors.transparent,
            width: 1.2,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: selected
                    ? AppColors.accentss
                    : AppColors.background,
                borderRadius: BorderRadius.circular(13),
              ),
              child: Icon(
                icon,
                color: selected
                    ? AppColors.primary
                    : AppColors.accentss,
                size: 20,
              ),
            ),

            const SizedBox(width: 13),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 10,
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
            ),

            Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: selected
                      ? AppColors.accentss
                      : AppColors.lightGrey,
                  width: 2,
                ),
              ),
              child: selected
                  ? Container(
                      margin: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: AppColors.accentss,
                        shape: BoxShape.circle,
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}

// ================================================================
// PRODUCT CARD
// ================================================================

class EditorialProductCard extends StatefulWidget {
  final Map<String, dynamic> product;

  const EditorialProductCard({
    super.key,
    required this.product,
  });

  @override
  State<EditorialProductCard> createState() =>
      _EditorialProductCardState();
}

class _EditorialProductCardState
    extends State<EditorialProductCard> {
  late bool favorite;

  @override
  void initState() {
    super.initState();

    favorite = WishlistManager.isInWishlist(
      widget.product['name'],
    );
  }

  void toggleWishlist() {
    setState(() {
      favorite = !favorite;
    });

    final item = WishlistItem(
      name: widget.product['name'],
      price: widget.product['price'],
      icon: widget.product['icon'],
      color1: widget.product['color1'],
      color2: widget.product['color2'],
    );

    if (favorite) {
      WishlistManager.addToWishlist(item);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: AppColors.primary,
          content: Text(
            'Added to wishlist',
            style: TextStyle(color: Colors.white),
          ),
          duration: Duration(seconds: 1),
        ),
      );
    } else {
      WishlistManager.removeFromWishlist(
        widget.product['name'],
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: AppColors.primary,
          content: Text(
            'Removed from wishlist',
            style: TextStyle(color: Colors.white),
          ),
          duration: Duration(seconds: 1),
        ),
      );
    }
  }

  void openDetails() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailsScreen(
          name: widget.product['name'],
          price: widget.product['price'],
          icon: widget.product['icon'],
          color1: widget.product['color1'],
          color2: widget.product['color2'],
        ),
      ),
    ).then((_) {
      setState(() {
        favorite = WishlistManager.isInWishlist(
          widget.product['name'],
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return GestureDetector(
      onTap: openDetails,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: AppColors.lightGrey.withOpacity(.7),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.05),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ====================================================
            // PRODUCT VISUAL
            // ====================================================

            Expanded(
              flex: 7,
              child: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(19),
                  gradient: const LinearGradient(
                    colors: [
                      AppColors.primary,
                      AppColors.accentss,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      right: -25,
                      top: -25,
                      child: Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.08),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),

                    Positioned(
                      left: -25,
                      bottom: -30,
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.06),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),

                    Center(
                      child: Icon(
                        product['icon'],
                        size: 65,
                        color: Colors.white.withOpacity(.9),
                      ),
                    ),

                    // TAG
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.accentss,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          product['tag'],
                          style: const TextStyle(
                            color: AppColors.primary,
                            fontSize: 8,
                            fontWeight: FontWeight.w900,
                            letterSpacing: .7,
                          ),
                        ),
                      ),
                    ),

                    // WISHLIST
                    Positioned(
                      top: 8,
                      right: 8,
                      child: GestureDetector(
                        onTap: toggleWishlist,
                        child: Container(
                          width: 34,
                          height: 34,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            favorite
                                ? Icons.favorite_rounded
                                : Icons.favorite_border_rounded,
                            color: favorite
                                ? AppColors.accentss
                                : AppColors.primary,
                            size: 17,
                          ),
                        ),
                      ),
                    ),

                    // ARROW
                    Positioned(
                      right: 10,
                      bottom: 10,
                      child: Container(
                        width: 31,
                        height: 31,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.arrow_forward_rounded,
                          color: AppColors.primary,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ====================================================
            // PRODUCT INFO
            // ====================================================

            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  12,
                  1,
                  12,
                  8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product['name'],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w900,
                        color: AppColors.primary,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Row(
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          color: AppColors.accentss,
                          size: 13,
                        ),

                        const SizedBox(width: 3),

                        Text(
                          product['rating'].toString(),
                          style: const TextStyle(
                            fontSize: 10,
                            color: AppColors.grey,
                            fontWeight: FontWeight.w700,
                          ),
                        ),

                        const Spacer(),

                        Text(
                          'PKR ${product['price']}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.accentss,
                            fontWeight: FontWeight.w900,
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

// ================================================================
// PRODUCT DETAILS SCREEN
// ================================================================

class ProductDetailsScreen extends StatefulWidget {
  final String name;
  final int price;
  final IconData icon;
  final Color color1;
  final Color color2;

  const ProductDetailsScreen({
    super.key,
    required this.name,
    required this.price,
    required this.icon,
    required this.color1,
    required this.color2,
  });

  @override
  State<ProductDetailsScreen> createState() =>
      _ProductDetailsScreenState();
}

class _ProductDetailsScreenState
    extends State<ProductDetailsScreen> {
  late bool favorite;

  @override
  void initState() {
    super.initState();

    favorite = WishlistManager.isInWishlist(
      widget.name,
    );
  }

  void toggleFavorite() {
    setState(() {
      favorite = !favorite;
    });

    final item = WishlistItem(
      name: widget.name,
      price: widget.price,
      icon: widget.icon,
      color1: widget.color1,
      color2: widget.color2,
    );

    if (favorite) {
      WishlistManager.addToWishlist(item);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: AppColors.primary,
          content: Text(
            'Added to wishlist',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    } else {
      WishlistManager.removeFromWishlist(
        widget.name,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: AppColors.primary,
          content: Text(
            'Removed from wishlist',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }
  }

  void addToCart() {
    CartManager.addToCart(
      CartItem(
        name: widget.name,
        price: widget.price,
        icon: widget.icon,
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: AppColors.primary,
        content: Text(
          'Added to cart',
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(seconds: 1),
      ),
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          // ======================================================
          // PRODUCT HERO
          // ======================================================

          SliverAppBar(
            expandedHeight: 430,
            pinned: true,
            backgroundColor: AppColors.primary,

            leading: Padding(
              padding: const EdgeInsets.all(8),
              child: CircleAvatar(
                backgroundColor: Colors.white.withOpacity(.92),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_rounded,
                    color: AppColors.primary,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),

            actions: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: CircleAvatar(
                  backgroundColor: Colors.white.withOpacity(.92),
                  child: IconButton(
                    icon: Icon(
                      favorite
                          ? Icons.favorite_rounded
                          : Icons.favorite_border_rounded,
                      color: favorite
                          ? AppColors.accentss
                          : AppColors.primary,
                    ),
                    onPressed: toggleFavorite,
                  ),
                ),
              ),
            ],

            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primary,
                      AppColors.accentss,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      right: -60,
                      top: 70,
                      child: Container(
                        width: 220,
                        height: 220,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.08),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),

                    Positioned(
                      left: -70,
                      bottom: -70,
                      child: Container(
                        width: 240,
                        height: 240,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.06),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),

                    Center(
                      child: Icon(
                        widget.icon,
                        size: 150,
                        color: Colors.white.withOpacity(.9),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ======================================================
          // PRODUCT INFORMATION
          // ======================================================

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.accentss.withOpacity(.12),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          'PREMIUM',
                          style: TextStyle(
                            color: AppColors.accentss,
                            fontSize: 9,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1,
                          ),
                        ),
                      ),

                      const Spacer(),

                      const Icon(
                        Icons.star_rounded,
                        color: AppColors.accentss,
                        size: 18,
                      ),

                      const SizedBox(width: 4),

                      const Text(
                        '4.8',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  Text(
                    widget.name,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                      color: AppColors.primary,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    'PKR ${widget.price}',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      color: AppColors.accentss,
                    ),
                  ),

                  const SizedBox(height: 22),

                  const Text(
                    'Product Description',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: AppColors.primary,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    'A premium fashion piece designed for modern style and everyday comfort. Crafted with attention to detail and a clean contemporary look.',
                    style: TextStyle(
                      fontSize: 13,
                      height: 1.6,
                      color: AppColors.grey,
                    ),
                  ),

                  const SizedBox(height: 25),

                  // ==================================================
                  // ADD TO BAG
                  // ==================================================

                  SizedBox(
                    width: double.infinity,
                    height: 58,
                    child: ElevatedButton.icon(
                      onPressed: addToCart,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.accentss,
                        foregroundColor: AppColors.primary,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      icon: const Icon(
                        Icons.shopping_cart_outlined,
                      ),
                      label: const Text(
                        'Add to Bag',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  // ==================================================
                  // VIEW CART
                  // ==================================================

                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const CartScreen(),
                          ),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.primary,
                        side: const BorderSide(
                          color: AppColors.primary,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      icon: const Icon(
                        Icons.shopping_cart_outlined,
                      ),
                      label: const Text(
                        'View Cart',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}