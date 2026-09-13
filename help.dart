import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const purple = Color.fromARGB(255, 23, 212, 155);
    const navy = Color(0xFF17152D);

    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 220,
            pinned: true,
            backgroundColor: navy,
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.12),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF17152D),
                      // Color(0xFF34246D),
                      Color.fromARGB(255, 23, 212, 155),
                    ],
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(24, 0, 24, 28),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.support_agent_rounded,
                          color: Colors.white,
                          size: 38,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'How can we help?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Find answers and get support',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.all(18),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                // Search
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(
                        Icons.search_rounded,
                        color: purple,
                      ),
                      hintText: 'Search for help...',
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                const Text(
                  'QUICK HELP',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.5,
                    color: Colors.black45,
                  ),
                ),

                const SizedBox(height: 12),

                _HelpCard(
                  icon: Icons.shopping_bag_outlined,
                  title: 'Orders & Delivery',
                  subtitle: 'Track orders and delivery information',
                  color: purple,
                  onTap: () {
                    _showMessage(
                      context,
                      'Orders & Delivery',
                    );
                  },
                ),

                _HelpCard(
                  icon: Icons.payment_rounded,
                  title: 'Payment',
                  subtitle: 'Payment methods and billing questions',
                  color: const Color(0xFF0EA5E9),
                  onTap: () {
                    _showMessage(
                      context,
                      'Payment Help',
                    );
                  },
                ),

                _HelpCard(
                  icon: Icons.refresh_rounded,
                  title: 'Returns & Refunds',
                  subtitle: 'Learn about returns and refunds',
                  color: const Color(0xFF10B981),
                  onTap: () {
                    _showMessage(
                      context,
                      'Returns & Refunds',
                    );
                  },
                ),

                _HelpCard(
                  icon: Icons.local_shipping_outlined,
                  title: 'Shipping',
                  subtitle: 'Shipping charges and delivery times',
                  color: Color.fromARGB(255, 23, 212, 155),
                  onTap: () {
                    _showMessage(
                      context,
                      'Shipping Help',
                    );
                  },
                ),

                const SizedBox(height: 24),

                const Text(
                  'FREQUENTLY ASKED QUESTIONS',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.5,
                    color: Colors.black45,
                  ),
                ),

                const SizedBox(height: 12),

                _FaqTile(
                  question: 'How can I place an order?',
                  answer:
                      'Browse products, open the product details, '
                      'add the product to your cart and continue to checkout.',
                ),

                _FaqTile(
                  question: 'How can I track my order?',
                  answer:
                      'You can track your order from the Orders section '
                      'of your account.',
                ),

                _FaqTile(
                  question: 'Can I cancel my order?',
                  answer:
                      'Orders can be cancelled before they are shipped. '
                      'Contact our support team for assistance.',
                ),

                _FaqTile(
                  question: 'How can I return a product?',
                  answer:
                      'Contact support with your order details and our '
                      'team will guide you through the return process.',
                ),

                const SizedBox(height: 24),

                // Contact support
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF17152D),
                        Color.fromARGB(255, 23, 212, 155),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.headset_mic_rounded,
                        color: Colors.white,
                        size: 30,
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Still need help?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        'Our support team is here to help you.',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 18),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            _showMessage(
                              context,
                              'Support request started',
                            );
                          },
                          icon: const Icon(Icons.chat_rounded),
                          label: const Text('Contact Support'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: purple,
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(
                              vertical: 14,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  static void _showMessage(
    BuildContext context,
    String message,
  ) {
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
}

// =====================================================
// HELP CARD
// =====================================================

class _HelpCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  const _HelpCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.035),
            blurRadius: 18,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 7,
        ),
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: color.withOpacity(.10),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Icon(
            icon,
            color: color,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            color: Color(0xFF17152D),
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            subtitle,
            style: const TextStyle(
              fontSize: 11.5,
              color: Colors.black45,
            ),
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
          size: 15,
          color: Colors.black26,
        ),
      ),
    );
  }
}

// =====================================================
// FAQ
// =====================================================

class _FaqTile extends StatelessWidget {
  final String question;
  final String answer;

  const _FaqTile({
    required this.question,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(
          horizontal: 18,
        ),
        childrenPadding: const EdgeInsets.fromLTRB(
          18,
          0,
          18,
          18,
        ),
        iconColor: const Color(0xFF6C4CF1),
        collapsedIconColor: Colors.black38,
        title: Text(
          question,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Color(0xFF17152D),
          ),
        ),
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              answer,
              style: const TextStyle(
                height: 1.5,
                fontSize: 12.5,
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }
}