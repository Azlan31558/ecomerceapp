import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notifications = true;
  bool darkMode = false;
  bool biometric = false;
  bool emailUpdates = true;

  @override
  Widget build(BuildContext context) {
    const purple = Color.fromARGB(255, 23, 212, 155);
    const navy = Color(0xFF17152D);
    const background = Color(0xFFF6F7FB);

    return Scaffold(
      backgroundColor: background,
      body: CustomScrollView(
        slivers: [
          // ================= HEADER =================
          SliverAppBar(
            expandedHeight: 205,
            pinned: true,
            elevation: 0,
            backgroundColor: navy,
            leading: Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.12),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF17152D),
                      // Color(0xFF34246D),
                      Color.fromARGB(255, 23, 212, 155),
                    ],
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      right: -50,
                      top: -40,
                      child: Container(
                        width: 170,
                        height: 170,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.06),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Positioned(
                      left: -60,
                      bottom: -70,
                      child: Container(
                        width: 190,
                        height: 190,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.05),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    const Positioned(
                      left: 24,
                      bottom: 25,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Settings',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Manage your preferences',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
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

          // ================= CONTENT =================
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(18, 22, 18, 35),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                // ================= ACCOUNT =================
                _sectionTitle('ACCOUNT'),

                _SettingsCard(
                  children: [
                    _SettingsTile(
                      icon: Icons.person_outline_rounded,
                      iconColor: purple,
                      title: 'Edit Profile',
                      subtitle: 'Update your personal information',
                      onTap: () {
                        // Navigate to EditProfileScreen
                      },
                    ),
                    _divider(),
                    _SettingsTile(
                      icon: Icons.lock_outline_rounded,
                      iconColor: const Color(0xFF0EA5E9),
                      title: 'Change Password',
                      subtitle: 'Update your account password',
                      onTap: () {
                        _showMessage(
                          context,
                          'Change Password selected',
                        );
                      },
                    ),
                    _divider(),
                    _SettingsTile(
                      icon: Icons.location_on_outlined,
                      iconColor: const Color(0xFF10B981),
                      title: 'Addresses',
                      subtitle: 'Manage your delivery addresses',
                      onTap: () {
                        _showMessage(
                          context,
                          'Addresses selected',
                        );
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // ================= PREFERENCES =================
                _sectionTitle('PREFERENCES'),

                _SettingsCard(
                  children: [
                    _SwitchTile(
                      icon: Icons.notifications_none_rounded,
                      iconColor: purple,
                      title: 'Notifications',
                      subtitle: 'Receive order and promotional alerts',
                      value: notifications,
                      onChanged: (value) {
                        setState(() {
                          notifications = value;
                        });
                      },
                    ),
                    _divider(),
                    _SwitchTile(
                      icon: Icons.email_outlined,
                      iconColor: const Color(0xFFEC4899),
                      title: 'Email Updates',
                      subtitle: 'Receive offers and updates by email',
                      value: emailUpdates,
                      onChanged: (value) {
                        setState(() {
                          emailUpdates = value;
                        });
                      },
                    ),
                    _divider(),
                    _SwitchTile(
                      icon: Icons.dark_mode_outlined,
                      iconColor: Color.fromARGB(255, 23, 212, 155),
                      title: 'Dark Mode',
                      subtitle: 'Use dark appearance throughout the app',
                      value: darkMode,
                      onChanged: (value) {
                        setState(() {
                          darkMode = value;
                        });

                        _showMessage(
                          context,
                          value
                              ? 'Dark Mode enabled'
                              : 'Dark Mode disabled',
                        );
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // ================= SECURITY =================
                _sectionTitle('SECURITY'),

                _SettingsCard(
                  children: [
                    _SwitchTile(
                      icon: Icons.fingerprint_rounded,
                      iconColor: const Color(0xFF14B8A6),
                      title: 'Biometric Login',
                      subtitle: 'Use fingerprint or Face ID to login',
                      value: biometric,
                      onChanged: (value) {
                        setState(() {
                          biometric = value;
                        });
                      },
                    ),
                    _divider(),
                    _SettingsTile(
                      icon: Icons.privacy_tip_outlined,
                      iconColor: Color.fromARGB(255, 23, 212, 155),
                      title: 'Privacy',
                      subtitle: 'Manage privacy and data settings',
                      onTap: () {
                        _showMessage(
                          context,
                          'Privacy settings selected',
                        );
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // ================= SUPPORT =================
                _sectionTitle('SUPPORT'),

                _SettingsCard(
                  children: [
                    _SettingsTile(
                      icon: Icons.help_outline_rounded,
                      iconColor: const Color(0xFF0EA5E9),
                      title: 'Help Center',
                      subtitle: 'Find answers to common questions',
                      onTap: () {
                        _showMessage(
                          context,
                          'Help Center selected',
                        );
                      },
                    ),
                    _divider(),
                    _SettingsTile(
                      icon: Icons.chat_bubble_outline_rounded,
                      iconColor: const Color(0xFF10B981),
                      title: 'Contact Support',
                      subtitle: 'Get help from our support team',
                      onTap: () {
                        _showMessage(
                          context,
                          'Contact Support selected',
                        );
                      },
                    ),
                    _divider(),
                    _SettingsTile(
                      icon: Icons.info_outline_rounded,
                      iconColor: const Color(0xFF8B5CF6),
                      title: 'About MY SHOP',
                      subtitle: 'Version 1.0.0',
                      onTap: () {
                        _showAboutDialog(context);
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // ================= LOGOUT =================
                GestureDetector(
                  onTap: () {
                    _showLogoutDialog(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 17,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: const Color(0xFFFFE0E0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.04),
                          blurRadius: 18,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFE8EC),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Icon(
                            Icons.logout_rounded,
                            color: Color(0xFFEF4444),
                          ),
                        ),
                        const SizedBox(width: 14),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Logout',
                                style: TextStyle(
                                  color: Color(0xFFEF4444),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              SizedBox(height: 3),
                              Text(
                                'Sign out from your account',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 16,
                          color: Color(0xFFEF4444),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                const Center(
                  child: Text(
                    'MY SHOP • FASHION • STYLE • YOU',
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w800,
          letterSpacing: 1.5,
          color: Colors.black45,
        ),
      ),
    );
  }

  Widget _divider() {
    return const Divider(
      height: 1,
      indent: 76,
      endIndent: 18,
      color: Color(0xFFF0F0F3),
    );
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        backgroundColor: const Color(0xFF17152D),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  void _showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          title: const Text(
            'MY SHOP',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Color(0xFF17152D),
            ),
          ),
          content: const Text(
            'MY SHOP is a modern fashion shopping app designed '
            'to provide a simple and beautiful shopping experience.\n\n'
            'Version 1.0.0',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Close',
                style: TextStyle(
                  color: Color(0xFF6C4CF1),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          title: const Row(
            children: [
              Icon(
                Icons.logout_rounded,
                color: Color(0xFFEF4444),
              ),
              SizedBox(width: 10),
              Text(
                'Logout',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          content: const Text(
            'Are you sure you want to logout from your account?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFEF4444),
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);

                _showMessage(
                  context,
                  'Logged out successfully',
                );
              },
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
  }
}

// =====================================================
// SETTINGS CARD
// =====================================================

class _SettingsCard extends StatelessWidget {
  final List<Widget> children;

  const _SettingsCard({
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.035),
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

// =====================================================
// SETTINGS TILE
// =====================================================

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _SettingsTile({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(22),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 15,
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: iconColor.withOpacity(.10),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(
                icon,
                color: iconColor,
                size: 23,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF17152D),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 11.5,
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 15,
              color: Colors.black26,
            ),
          ],
        ),
      ),
    );
  }
}

// =====================================================
// SWITCH TILE
// =====================================================

class _SwitchTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _SwitchTile({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 13,
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: iconColor.withOpacity(.10),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 23,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF17152D),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 11.5,
                    color: Colors.black45,
                  ),
                ),
              ],
            ),
          ),
          Switch.adaptive(
            value: value,
            activeColor: Color.fromARGB(255, 23, 212, 155),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}