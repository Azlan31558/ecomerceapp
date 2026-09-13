import 'package:flutter/material.dart';
import 'package:newecommapp/checkout.dart';

// ============================================================
// APP COLORS
// ============================================================

const Color primaryColor = Color(0xFF111827);
const Color accentColor = Color.fromARGB(255, 23, 212, 155);
const Color backgroundColor = Color(0xFFF8F7F3);

// ============================================================
// CART ITEM
// ============================================================

class CartItem {
  final String name;
  final int price;
  final IconData icon;

  CartItem({
    required this.name,
    required this.price,
    required this.icon,
  });
}

// ============================================================
// CART MANAGER
// ============================================================

class CartManager {
  static final List<CartItem> items = [];

  static void addToCart(CartItem item) {
    items.add(item);
  }

  static void removeFromCart(int index) {
    items.removeAt(index);
  }

  static int get count => items.length;

  static int get total {
    int total = 0;

    for (final item in items) {
      total += item.price;
    }

    return total;
  }
}

// ============================================================
// CART SCREEN
// ============================================================

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final bool isEmpty = CartManager.items.isEmpty;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: isEmpty
          ? _buildEmptyCart(context)
          : _buildCart(context),
    );
  }

  // ==========================================================
  // EMPTY CART
  // ==========================================================

  Widget _buildEmptyCart(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          pinned: true,
          elevation: 0,
          backgroundColor: primaryColor,

          leading: Padding(
            padding: const EdgeInsets.all(9),
            child: _CircleButton(
              icon: Icons.arrow_back_rounded,
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),

          title: const Text(
            'My Bag',
            style: TextStyle(
              color: Colors.white,
              fontSize: 21,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),

        SliverFillRemaining(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 35,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ==================================================
                  // BAG ICON
                  // ==================================================

                  Container(
                    width: 135,
                    height: 135,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      shape: BoxShape.circle,

                      border: Border.all(
                        color: accentColor.withOpacity(.25),
                        width: 2,
                      ),

                      boxShadow: [
                        BoxShadow(
                          color: accentColor.withOpacity(.20),
                          blurRadius: 30,
                          offset: const Offset(0, 12),
                        ),
                      ],
                    ),

                    child: const Icon(
                      Icons.shopping_bag_outlined,
                      size: 58,
                      color: accentColor,
                    ),
                  ),

                  const SizedBox(height: 28),

                  const Text(
                    'YOUR BAG IS WAITING',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 2,
                      color: accentColor,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    'Nothing here... yet.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.w900,
                      color: primaryColor,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    'Discover something you love and add it '
                    'to your bag to continue shopping.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 28),

                  // ==================================================
                  // START SHOPPING
                  // ==================================================

                  SizedBox(
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },

                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        foregroundColor: Colors.white,
                        elevation: 0,

                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                        ),

                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(17),

                          side: const BorderSide(
                            color: accentColor,
                            width: 1,
                          ),
                        ),
                      ),

                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'START SHOPPING',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 1,
                            ),
                          ),

                          SizedBox(width: 10),

                          Icon(
                            Icons.arrow_forward_rounded,
                            size: 18,
                            color: accentColor,
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
      ],
    );
  }

  // ==========================================================
  // CART
  // ==========================================================

  Widget _buildCart(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),

      slivers: [
        // ======================================================
        // HEADER
        // ======================================================

        SliverAppBar(
          expandedHeight: 180,
          pinned: true,
          elevation: 0,
          backgroundColor: primaryColor,

          leading: Padding(
            padding: const EdgeInsets.all(9),
            child: _CircleButton(
              icon: Icons.arrow_back_rounded,
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),

          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 11,
                    vertical: 6,
                  ),

                  decoration: BoxDecoration(
                    color: accentColor.withOpacity(.15),
                    borderRadius: BorderRadius.circular(20),

                    border: Border.all(
                      color: accentColor.withOpacity(.35),
                    ),
                  ),

                  child: Text(
                    '${CartManager.count} ITEMS',
                    style: const TextStyle(
                      color: accentColor,
                      fontSize: 9,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
            ),
          ],

          // ====================================================
          // HEADER BACKGROUND
          // ====================================================

          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              padding: const EdgeInsets.fromLTRB(
                22,
                90,
                22,
                22,
              ),

              decoration: const BoxDecoration(
                color: primaryColor,
              ),

              child: Stack(
                children: [
                  // Decorative gold circle
                  Positioned(
                    right: -50,
                    top: 10,

                    child: Container(
                      width: 180,
                      height: 180,

                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: accentColor.withOpacity(.15),
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    right: 20,
                    top: 70,

                    child: Container(
                      width: 55,
                      height: 55,

                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: accentColor.withOpacity(.08),
                      ),
                    ),
                  ),

                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,

                    mainAxisAlignment:
                        MainAxisAlignment.end,

                    children: [
                      const Text(
                        'YOUR SELECTION',
                        style: TextStyle(
                          color: accentColor,
                          fontSize: 10,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 2.5,
                        ),
                      ),

                      const SizedBox(height: 5),

                      const Text(
                        'My Bag',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 38,
                          fontWeight: FontWeight.w900,
                          letterSpacing: -1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),

        // ======================================================
        // CART PRODUCTS
        // ======================================================

        SliverPadding(
          padding: const EdgeInsets.fromLTRB(
            18,
            20,
            18,
            10,
          ),

          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final item = CartManager.items[index];

                return _CartProductCard(
                  item: item,
                  index: index,
                  onDelete: () {
                    _deleteItem(context, index);
                  },
                );
              },

              childCount: CartManager.items.length,
            ),
          ),
        ),

        // ======================================================
        // ORDER SUMMARY
        // ======================================================

        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              18,
              5,
              18,
              35,
            ),

            child: _OrderSummary(
              onCheckout: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const CheckoutScreen(),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  // ==========================================================
  // DELETE
  // ==========================================================

  void _deleteItem(
    BuildContext context,
    int index,
  ) {
    final String name =
        CartManager.items[index].name;

    showDialog(
      context: context,

      builder: (dialogContext) {
        return AlertDialog(
          backgroundColor: backgroundColor,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),

          title: const Text(
            'Remove item?',
            style: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.w900,
            ),
          ),

          content: Text(
            'Remove "$name" from your bag?',
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },

              child: const Text(
                'CANCEL',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),

            TextButton(
              onPressed: () {
                setState(() {
                  CartManager.removeFromCart(index);
                });

                Navigator.pop(dialogContext);
              },

              child: const Text(
                'REMOVE',
                style: TextStyle(
                  color: accentColor,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

// ============================================================
// CART PRODUCT CARD
// ============================================================

class _CartProductCard extends StatelessWidget {
  final CartItem item;
  final int index;
  final VoidCallback onDelete;

  const _CartProductCard({
    required this.item,
    required this.index,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),

      padding: const EdgeInsets.all(10),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(23),

        border: Border.all(
          color: primaryColor.withOpacity(.05),
        ),

        boxShadow: [
          BoxShadow(
            color: primaryColor.withOpacity(.045),
            blurRadius: 18,
            offset: const Offset(0, 7),
          ),
        ],
      ),

      child: Row(
        children: [
          // ==================================================
          // PRODUCT VISUAL
          // ==================================================

          Container(
            width: 94,
            height: 105,

            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(18),

              border: Border.all(
                color: accentColor.withOpacity(.30),
              ),
            ),

            child: Stack(
              children: [
                Positioned(
                  right: -20,
                  bottom: -20,

                  child: Container(
                    width: 75,
                    height: 75,

                    decoration: BoxDecoration(
                      color: accentColor.withOpacity(.08),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),

                Center(
                  child: Icon(
                    item.icon,
                    size: 46,
                    color: accentColor,
                  ),
                ),

                Positioned(
                  left: 8,
                  top: 8,

                  child: Text(
                    '0${index + 1}',
                    style: TextStyle(
                      color: Colors.white.withOpacity(.55),
                      fontSize: 9,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 13),

          // ==================================================
          // PRODUCT INFO
          // ==================================================

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [
                Text(
                  item.name,

                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,

                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                    color: primaryColor,
                  ),
                ),

                const SizedBox(height: 7),

                const Row(
                  children: [
                    Icon(
                      Icons.star_rounded,
                      size: 14,
                      color: accentColor,
                    ),

                    SizedBox(width: 3),

                    Text(
                      '4.8',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 9),

                Text(
                  'Rs. ${item.price}',

                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    color: accentColor,
                  ),
                ),

                const SizedBox(height: 10),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),

                  decoration: BoxDecoration(
                    color: accentColor.withOpacity(.10),
                    borderRadius:
                        BorderRadius.circular(8),

                    border: Border.all(
                      color: accentColor.withOpacity(.20),
                    ),
                  ),

                  child: const Text(
                    'IN STOCK',
                    style: TextStyle(
                      color: accentColor,
                      fontSize: 8,
                      fontWeight: FontWeight.w900,
                      letterSpacing: .7,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ==================================================
          // DELETE
          // ==================================================

          Align(
            alignment: Alignment.topRight,

            child: GestureDetector(
              onTap: onDelete,

              child: Container(
                width: 34,
                height: 34,

                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(.06),
                  borderRadius:
                      BorderRadius.circular(11),

                  border: Border.all(
                    color: primaryColor.withOpacity(.08),
                  ),
                ),

                child: const Icon(
                  Icons.delete_outline_rounded,
                  size: 18,
                  color: primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// ORDER SUMMARY
// ============================================================

class _OrderSummary extends StatelessWidget {
  final VoidCallback onCheckout;

  const _OrderSummary({
    required this.onCheckout,
  });

  @override
  Widget build(BuildContext context) {
    final int subtotal = CartManager.total;

    const int delivery = 0;

    final int total = subtotal + delivery;

    return Container(
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(27),

        border: Border.all(
          color: accentColor.withOpacity(.25),
        ),

        boxShadow: [
          BoxShadow(
            color: primaryColor.withOpacity(.20),
            blurRadius: 25,
            offset: const Offset(0, 12),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [
          const Text(
            'ORDER SUMMARY',
            style: TextStyle(
              color: accentColor,
              fontSize: 10,
              fontWeight: FontWeight.w900,
              letterSpacing: 2,
            ),
          ),

          const SizedBox(height: 17),

          _SummaryRow(
            title: 'Subtotal',
            value: 'Rs. $subtotal',
          ),

          const SizedBox(height: 11),

          const _SummaryRow(
            title: 'Delivery',
            value: 'FREE',
            valueColor: accentColor,
          ),

          const SizedBox(height: 17),

          Divider(
            color: Colors.white.withOpacity(.12),
          ),

          const SizedBox(height: 15),

          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,

            children: [
              const Text(
                'TOTAL',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  letterSpacing: .8,
                ),
              ),

              Text(
                'Rs. $total',
                style: const TextStyle(
                  color: accentColor,
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // ==================================================
          // CHECKOUT BUTTON
          // ==================================================

          SizedBox(
            width: double.infinity,
            height: 58,

            child: ElevatedButton(
              onPressed: onCheckout,

              style: ElevatedButton.styleFrom(
                backgroundColor: accentColor,
                foregroundColor: primaryColor,
                elevation: 0,

                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(17),
                ),
              ),

              child: const Row(
                mainAxisAlignment:
                    MainAxisAlignment.center,

                children: [
                  Text(
                    'PROCEED TO CHECKOUT',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1,
                    ),
                  ),

                  SizedBox(width: 10),

                  Icon(
                    Icons.arrow_forward_rounded,
                    size: 19,
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

// ============================================================
// SUMMARY ROW
// ============================================================

class _SummaryRow extends StatelessWidget {
  final String title;
  final String value;
  final Color? valueColor;

  const _SummaryRow({
    required this.title,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.spaceBetween,

      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white60,
            fontSize: 12,
          ),
        ),

        Text(
          value,
          style: TextStyle(
            color: valueColor ?? Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}

// ============================================================
// CIRCLE BUTTON
// ============================================================

class _CircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _CircleButton({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 43,
      height: 43,

      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.10),
        shape: BoxShape.circle,

        border: Border.all(
          color: accentColor.withOpacity(.30),
        ),
      ),

      child: IconButton(
        onPressed: onTap,
        padding: EdgeInsets.zero,

        icon: const Icon(
          Icons.arrow_back_rounded,
          color: Colors.white,
          size: 19,
        ),
      ),
    );
  }
}