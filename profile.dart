import 'package:flutter/material.dart';
import 'package:newecommapp/editprofil.dart';
import 'package:newecommapp/help.dart';
import 'package:newecommapp/notificationscren.dart';
import 'package:newecommapp/setting.dart';
import 'package:newecommapp/wishlist.dart';
import 'package:newecommapp/cart.dart';
 
class ProfileScreen extends StatelessWidget {
  final List<Map<String, dynamic>> wishlistProducts;

  const ProfileScreen({
    super.key,
    required this.wishlistProducts,
  });

  static const Color navy = Color(0xFF17152D);
  static const Color purple = Color.fromARGB(255, 23, 212, 155);
  static const Color background = Color(0xFFF4F3F8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // =====================================================
          // HEADER
          // =====================================================

          SliverAppBar(
            expandedHeight: 310,
            pinned: true,
            elevation: 0,
            backgroundColor: navy,

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
                  icon: Icons.settings_outlined,
                  onTap: () {},
                ),
              ),
            ],

            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF100D22),
                      // Color(0xFF211944),
                      Color.fromARGB(255, 23, 212, 155),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      right: -55,
                      top: 25,
                      child: Container(
                        width: 190,
                        height: 190,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(.06),
                        ),
                      ),
                    ),

                    Positioned(
                      left: -45,
                      bottom: -70,
                      child: Container(
                        width: 180,
                        height: 180,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white.withOpacity(.07),
                            width: 2,
                          ),
                        ),
                      ),
                    ),

                    Positioned(
                      left: 20,
                      right: 20,
                      bottom: 25,
                      child: Column(
                        children: [
                          Container(
                            width: 105,
                            height: 105,
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(.18),
                                  blurRadius: 25,
                                  offset: const Offset(0, 10),
                                ),
                              ],
                            ),
                            child: const CircleAvatar(
                              backgroundColor: Color(0xFFEAE8F2),
                              child: Icon(
                                Icons.person_rounded,
                                size: 55,
                                color: Color(0xFF77738A),
                              ),
                            ),
                          ),

                          const SizedBox(height: 12),

                          const Text(
                            'Muhammad Azlan',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w900,
                            ),
                          ),

                          const SizedBox(height: 4),

                          const Text(
                            'azlan@gmail.com',
                            style: TextStyle(
                              color: Colors.white60,
                              fontSize: 13,
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

          // =====================================================
          // PROFILE STATS
          // =====================================================

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                18,
                20,
                18,
                10,
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 18,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(23),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.045),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
  child: _ProfileStat(
    value: CartManager.count
        .toString()
        .padLeft(2, '0'),
    label: 'Cart',
    icon: Icons.shopping_bag_outlined,
  ),
),

                    const _VerticalDivider(),

                    // ACTUAL WISHLIST COUNT
                    Expanded(
                      child: _ProfileStat(
                        value: WishlistManager.count
                            .toString()
                            .padLeft(2, '0'),
                        label: 'Wishlist',
                        icon: Icons.favorite_border_rounded,
                      ),
                    ),

                    const _VerticalDivider(),

                    const Expanded(
                      child: _ProfileStat(
                        value: '04',
                        label: 'Reviews',
                        icon: Icons.star_border_rounded,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // =====================================================
          // ACCOUNT
          // =====================================================

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                20,
                20,
                20,
                10,
              ),
              child: const Text(
                'ACCOUNT',
                style: TextStyle(
                  color: purple,
                  fontSize: 10,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2.2,
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: _MenuCard(
              children: [
                _ProfileOption(
                  icon: Icons.person_outline_rounded,
                  title: 'Edit Profile',
                  subtitle: 'Update your personal information',
                  onTap: () {
                    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>  EditProfileScreen(),));
                  },
                ),

                _ProfileOption(
                  icon: Icons.shopping_bag_outlined,
                  title: 'My Orders',
                  subtitle: 'Track and manage your orders',
                  onTap: () {},
                ),

                _ProfileOption(
  icon: Icons.favorite_border_rounded,
  title: 'Wishlist',
  subtitle: '${WishlistManager.count} saved products',
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const WishlistScreen(),
      ),
    );
  },
  badge: WishlistManager.count == 0
      ? null
      : WishlistManager.count.toString(),
),
              ],
            ),
          ),

          // =====================================================
          // PREFERENCES
          // =====================================================

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                20,
                25,
                20,
                10,
              ),
              child: const Text(
                'PREFERENCES',
                style: TextStyle(
                  color: purple,
                  fontSize: 10,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2.2,
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: _MenuCard(
              children: [
                _ProfileOption(
                  icon: Icons.notifications_none_rounded,
                  title: 'Notifications',
                  subtitle: 'Manage your notifications',
                  onTap: () {
                    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NotificationsScreen(),));
                  },
                  badge: '3',
                ),

                _ProfileOption(
                  icon: Icons.settings_outlined,
                  title: 'Settings',
                  subtitle: 'App preferences and privacy',
                  onTap: () {
                    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SettingsScreen(),));
                  },
                ),

                _ProfileOption(
                  icon: Icons.help_outline_rounded,
                  title: 'Help & Support',
                  subtitle: 'Get help with your account',
                  onTap: () {
                    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HelpScreen(),));
                  },
                ),
              ],
            ),
          ),

          // =====================================================
          // LOGOUT
          // =====================================================

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                18,
                25,
                18,
                35,
              ),
              child: GestureDetector(
                onTap: () => _showLogoutDialog(context),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 17,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF1F1),
                    borderRadius: BorderRadius.circular(19),
                    border: Border.all(
                      color: Colors.red.withOpacity(.08),
                    ),
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.logout_rounded,
                        color: Colors.red,
                        size: 21,
                      ),

                      SizedBox(width: 13),

                      Expanded(
                        child: Text(
                          'Logout',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 15,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),

                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.red,
                        size: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ===========================================================
  // LOGOUT DIALOG
  // ===========================================================

  static void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 65,
                  height: 65,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFEEEE),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.logout_rounded,
                    color: Colors.red,
                    size: 30,
                  ),
                ),

                const SizedBox(height: 18),

                const Text(
                  'Ready to leave?',
                  style: TextStyle(
                    color: navy,
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'Are you sure you want to logout '
                  'from your account?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                    height: 1.5,
                  ),
                ),

                const SizedBox(height: 24),

                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pop(dialogContext);
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: navy,
                          side: const BorderSide(
                            color: Color(0xFFE4E2EA),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 14,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: const Text(
                          'CANCEL',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 10),

                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(dialogContext);

                          ScaffoldMessenger.of(context)
                              .showSnackBar(
                            const SnackBar(
                              behavior:
                                  SnackBarBehavior.floating,
                              content: Text(
                                'Logged out successfully',
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: navy,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(
                            vertical: 14,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: const Text(
                          'LOGOUT',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// =============================================================
// PROFILE STAT
// =============================================================

class _ProfileStat extends StatelessWidget {
  final String value;
  final String label;
  final IconData icon;

  const _ProfileStat({
    required this.value,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Color.fromARGB(255, 23, 212, 155),
          size: 20,
        ),

        const SizedBox(height: 7),

        Text(
          value,
          style: const TextStyle(
            color: Color(0xFF17152D),
            fontSize: 19,
            fontWeight: FontWeight.w900,
          ),
        ),

        const SizedBox(height: 2),

        Text(
          label,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 10,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

// =============================================================
// VERTICAL DIVIDER
// =============================================================

class _VerticalDivider extends StatelessWidget {
  const _VerticalDivider();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      width: 1,
      color: const Color(0xFFE9E7EF),
    );
  }
}

// =============================================================
// MENU CARD
// =============================================================

class _MenuCard extends StatelessWidget {
  final List<Widget> children;

  const _MenuCard({
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(23),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.045),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: children,
      ),
    );
  }
}

// =============================================================
// PROFILE OPTION
// =============================================================

class _ProfileOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final String? badge;

  const _ProfileOption({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.badge,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(23),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        child: Row(
          children: [
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                color: const Color(0xFFF1EEFF),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(
                icon,
                color: Color.fromARGB(255, 23, 212, 155),
                size: 21,
              ),
            ),

            const SizedBox(width: 13),

            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Color(0xFF17152D),
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                    ),
                  ),

                  const SizedBox(height: 3),

                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),

            if (badge != null)
              Container(
                constraints: const BoxConstraints(
                  minWidth: 23,
                  minHeight: 23,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 6,
                ),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 23, 212, 155),
                  shape: BoxShape.circle,
                ),
                child: Text(
                  badge!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 9,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),

            const SizedBox(width: 9),

            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 14,
              color: Colors.grey,
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