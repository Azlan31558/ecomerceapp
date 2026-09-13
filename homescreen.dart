import 'package:flutter/material.dart';
import 'package:newecommapp/apptheme.dart';
import 'package:newecommapp/cart.dart';
import 'package:newecommapp/categoryproduct.dart';
import 'package:newecommapp/newarrival.dart';
import 'package:newecommapp/profile.dart';
import 'package:newecommapp/sale.dart';
import 'package:newecommapp/searchscreen.dart';
import 'package:newecommapp/specialoffer.dart';
import 'package:newecommapp/trending.dart';
import 'package:newecommapp/wishlist.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),

      // ================= APP BAR =================
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9FAFB),
        elevation: 0,
        scrolledUnderElevation: 0,
        titleSpacing: 20,

        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'MY SHOP',
              style: TextStyle(
                color: Color(0xFF111827),
                fontSize: 22,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.5,
              ),
            ),
            SizedBox(height: 2),
            Text(
              'Fashion for everyone',
              style: TextStyle(
                color: Color(0xFF111827),
                fontSize: 11,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),

        actions: [
          // Search
          Container(
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFF9FAFB),
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF111827).withOpacity(0.04),
                  blurRadius: 10,
                ),
              ],
            ),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchScreen(),
                  ),
                );
              },
              icon: const Icon(
                Icons.search_rounded,
                color: Color(0xFF111827),
              ),
            ),
          ),

          // Cart
          Container(
            margin: const EdgeInsets.only(right: 18),
            decoration: BoxDecoration(
              color: const Color(0xFFF9FAFB),
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF111827).withOpacity(0.04),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Stack(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CartScreen(),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.shopping_cart_outlined,
                    color: Color(0xFF111827),
                  ),
                ),

                // Cart Badge
                Positioned(
                  right: 5,
                  top: 5,
                  child: Container(
                    width: 17,
                    height: 17,
                    decoration: const BoxDecoration(
                      color: AppColors.accentss,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        CartManager.count.toString(),
                        style: const TextStyle(
                          color: Color(0xFF111827),
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      // ================= BODY =================
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ================= HERO BANNER =================
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF111827),
                    Color(0xFF111827),
                    AppColors.accentss,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(28),
                boxShadow: [
                  BoxShadow(
                    color:   AppColors.accentss.withOpacity(0.25),
                    blurRadius: 25,
                    offset: const Offset(0, 12),
                  ),
                ],
              ),

              child: Stack(
                children: [
                  // Decorative Circle
                  Positioned(
                    right: -35,
                    top: -40,
                    child: Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFFF9FAFB).withOpacity(0.08),
                      ),
                    ),
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF9FAFB).withOpacity(0.15),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          'NEW COLLECTION',
                          style: TextStyle(
                            color: Color(0xFFF9FAFB),
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),

                      const SizedBox(height: 18),

                      const Text(
                        'Find Your\nPerfect Style',
                        style: TextStyle(
                          color: Color(0xFFF9FAFB),
                          fontSize: 30,
                          height: 1.05,
                          fontWeight: FontWeight.w900,
                        ),
                      ),

                      const SizedBox(height: 12),

                      const Text(
                        'Discover the latest trends\nmade just for you.',
                        style: TextStyle(
                          color: Color(0xFFF9FAFB),
                          fontSize: 14,
                          height: 1.5,
                        ),
                      ),

                      const SizedBox(height: 20),

                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const CategoryProductsScreen(
                                category: 'Men',
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:   AppColors.accentss,
                          foregroundColor: const Color(0xFF111827),
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 13,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Shop Now',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(
                              Icons.arrow_forward_rounded,
                              size: 18,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // ================= CATEGORIES TITLE =================
            const SectionTitle(
              title: 'Shop by Category',
              subtitle: 'Choose your favorite style',
            ),

            const SizedBox(height: 18),

            // ================= CATEGORY CARDS =================

            CategoryCard(
              title: 'Men',
              subtitle: "Explore men's fashion",
              icon: Icons.man_rounded,
              colors: const [
                Color(0xFF111827),
                AppColors.accentss,
              ],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const CategoryProductsScreen(category: 'Men'),
                  ),
                );
              },
            ),

            const SizedBox(height: 15),

            CategoryCard(
              title: 'Women',
              subtitle: "Explore women's fashion",
              icon: Icons.woman_rounded,
              colors: const [
                Color(0xFF111827),
                AppColors.accentss,
              ],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const CategoryProductsScreen(category: 'Women'),
                  ),
                );
              },
            ),

            const SizedBox(height: 15),

            CategoryCard(
              title: 'Kids',
              subtitle: "Explore kids' fashion",
              icon: Icons.child_care_rounded,
              colors: const [
                Color(0xFF111827),
                AppColors.accentss,
              ],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const CategoryProductsScreen(category: 'Kid'),
                  ),
                );
              },
            ),

            const SizedBox(height: 30),

            // ================= QUICK SHOP =================
            const SectionTitle(
              title: 'Quick Shop',
              subtitle: 'Find what you need faster',
            ),

            const SizedBox(height: 18),

            Row(
              children: [
                Expanded(
                  child: SmallCategory(
                    title: 'New Arrivals',
                    subtitle: 'Fresh styles',
                    icon: Icons.auto_awesome_rounded,
                    color:   AppColors.accentss,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewArrivalsScreen(),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(width: 14),

                Expanded(
                  child: SmallCategory(
                    title: 'Sale',
                    subtitle: 'Up to 50% off',
                    icon: Icons.local_offer_rounded,
                    color:   AppColors.accentss,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SaleScreen(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 14),

            Row(
              children: [
                Expanded(
                  child: SmallCategory(
                    title: 'Trending',
                    subtitle: 'Most popular',
                    icon: Icons.trending_up_rounded,
                    color:   AppColors.accentss,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TrendingScreen(),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(width: 14),

                Expanded(
                  child: SmallCategory(
                    title: 'Favorites',
                    subtitle: 'Your wishlist',
                    icon: Icons.favorite_rounded,
                    color:   AppColors.accentss,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const WishlistScreen(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            // ================= SPECIAL OFFER =================
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SpecialOfferScreen(),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFF9FAFB),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: const Color(0xFF111827).withOpacity(0.10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF111827).withOpacity(0.04),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),

                child: Row(
                  children: [

                    Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                        color:   AppColors.accentss.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(17),
                      ),
                      child: const Icon(
                        Icons.local_fire_department_rounded,
                        color: AppColors.accentss,
                        size: 30,
                      ),
                    ),

                    const SizedBox(width: 15),

                    const Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Special Offer',
                            style: TextStyle(
                              color: Color(0xFF111827),
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Get amazing deals today',
                            style: TextStyle(
                              color: Color(0xFF111827),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 16,
                      color: Color(0xFF111827),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // ================= BOTTOM NAVIGATION =================
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF9FAFB),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF111827).withOpacity(0.08),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),

        child: BottomNavigationBar(
          currentIndex: 0,
          backgroundColor: const Color(0xFFF9FAFB),
          elevation: 0,
          selectedItemColor:   AppColors.accentss,
          unselectedItemColor:
              const Color(0xFF111827).withOpacity(0.55),
          type: BottomNavigationBarType.fixed,

          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 11,
          ),

          unselectedLabelStyle: const TextStyle(
            fontSize: 11,
          ),

          onTap: (index) {

            // Categories
            if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartScreen(),
                ),
              );
            }

            // Wishlist
            if (index == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const WishlistScreen(),
                ),
              );
            }

            // Profile
            if (index == 3) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const ProfileScreen(
                    wishlistProducts: [],
                  ),
                ),
              );
            }
          },

          items: const [

            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home_rounded),
              label: 'Home',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.category_outlined),
              activeIcon: Icon(Icons.category_rounded),
              label: 'Categories',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_rounded),
              activeIcon: Icon(Icons.favorite_rounded),
              label: 'Wishlist',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_rounded),
              activeIcon: Icon(Icons.person_rounded),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// SECTION TITLE
// ============================================================

class SectionTitle extends StatelessWidget {
  final String title;
  final String subtitle;

  const SectionTitle({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          title,
          style: const TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w900,
            color: Color(0xFF111827),
          ),
        ),

        const SizedBox(height: 4),

        Text(
          subtitle,
          style: TextStyle(
            color: const Color(0xFF111827).withOpacity(0.60),
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}

// ============================================================
// CATEGORY CARD
// ============================================================

class CategoryCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final List<Color> colors;
  final VoidCallback onTap;

  const CategoryCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.colors,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        height: 145,
        width: double.infinity,

        padding: const EdgeInsets.all(20),

        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),

          borderRadius: BorderRadius.circular(25),

          boxShadow: [
            BoxShadow(
              color: colors.first.withOpacity(0.20),
              blurRadius: 15,
              offset: const Offset(0, 7),
            ),
          ],
        ),

        child: Row(
          children: [

            // Icon Container
            Container(
              width: 100,
              height: 105,

              decoration: BoxDecoration(
                color: const Color(0xFFF9FAFB).withOpacity(0.15),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: const Color(0xFFF9FAFB).withOpacity(0.15),
                ),
              ),

              child: Icon(
                icon,
                size: 58,
                color: const Color(0xFFF9FAFB),
              ),
            ),

            const SizedBox(width: 20),

            // Text
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  Text(
                    title,
                    style: const TextStyle(
                      color: Color(0xFFF9FAFB),
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    subtitle,
                    style: TextStyle(
                      color: const Color(0xFFF9FAFB).withOpacity(0.70),
                      fontSize: 12,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Row(
                    children: const [

                      Text(
                        'Explore',
                        style: TextStyle(
                          color: Color(0xFFF9FAFB),
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(width: 6),

                      Icon(
                        Icons.arrow_forward_rounded,
                        color: Color(0xFFF9FAFB),
                        size: 17,
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

// ============================================================
// SMALL CATEGORY
// ============================================================

class SmallCategory extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const SmallCategory({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        height: 125,
        padding: const EdgeInsets.all(16),

        decoration: BoxDecoration(
          color: const Color(0xFFF9FAFB),
          borderRadius: BorderRadius.circular(22),

          border: Border.all(
            color: const Color(0xFF111827).withOpacity(0.10),
          ),

          boxShadow: [
            BoxShadow(
              color: const Color(0xFF111827).withOpacity(0.035),
              blurRadius: 12,
              offset: const Offset(0, 5),
            ),
          ],
        ),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          mainAxisAlignment:
              MainAxisAlignment.center,

          children: [

            Container(
              width: 43,
              height: 43,

              decoration: BoxDecoration(
                color: color.withOpacity(0.10),
                borderRadius: BorderRadius.circular(14),
              ),

              child: Icon(
                icon,
                color: color,
                size: 23,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              title,
              style: const TextStyle(
                color: Color(0xFF111827),
                fontSize: 14,
                fontWeight: FontWeight.w800,
              ),
            ),

            const SizedBox(height: 3),

            Text(
              subtitle,
              style: TextStyle(
                color: const Color(0xFF111827).withOpacity(0.60),
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
