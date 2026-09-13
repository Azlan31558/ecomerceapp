import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() =>
      _NotificationsScreenState();
}

class _NotificationsScreenState
    extends State<NotificationsScreen> {
  final List<Map<String, dynamic>> notifications = [
    {
      'title': 'Special Offer 🎉',
      'message':
          'Get up to 50% OFF on selected fashion items. Shop now!',
      'time': '2 min ago',
      'icon': Icons.local_offer_rounded,
      'type': 'Offer',
      'color': Color.fromARGB(255, 23, 212, 155),
      'unread': true,
    },
    {
      'title': 'Order Confirmed',
      'message':
          'Your order #MY10245 has been confirmed successfully.',
      'time': '1 hour ago',
      'icon': Icons.check_circle_rounded,
      'type': 'Order',
      'color': Color(0xFF10B981),
      'unread': true,
    },
    {
      'title': 'New Collection ✨',
      'message':
          'Our latest collection has arrived. Discover your new style.',
      'time': '3 hours ago',
      'icon': Icons.auto_awesome_rounded,
      'type': 'New',
      'color': Color(0xFFEC4899),
      'unread': true,
    },
    {
      'title': 'Flash Sale 🔥',
      'message':
          'Hurry! Flash Sale ends tonight. Save big on trending products.',
      'time': 'Yesterday',
      'icon': Icons.local_fire_department_rounded,
      'type': 'Sale',
      'color': Color(0xFFF97316),
      'unread': false,
    },
    {
      'title': 'Delivery Update',
      'message':
          'Your order is on the way and will arrive soon.',
      'time': 'Yesterday',
      'icon': Icons.local_shipping_rounded,
      'type': 'Order',
      'color': Color(0xFF0EA5E9),
      'unread': false,
    },
    {
      'title': 'Wishlist Reminder ❤️',
      'message':
          'Some items in your wishlist are selling fast.',
      'time': '2 days ago',
      'icon': Icons.favorite_rounded,
      'type': 'Wishlist',
      'color': Color(0xFFFF4D6D),
      'unread': false,
    },
    {
      'title': 'Welcome to MY SHOP',
      'message':
          'Thanks for joining us. Explore premium fashion made for you.',
      'time': '3 days ago',
      'icon': Icons.shopping_bag_rounded,
      'type': 'Welcome',
      'color': Color(0xFF6366F1),
      'unread': false,
    },
  ];

  int get unreadCount {
    return notifications
        .where((item) => item['unread'] == true)
        .length;
  }

  void markAllAsRead() {
    setState(() {
      for (final item in notifications) {
        item['unread'] = false;
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('All notifications marked as read'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  void markAsRead(int index) {
    if (notifications[index]['unread'] == true) {
      setState(() {
        notifications[index]['unread'] = false;
      });
    }
  }

  void deleteNotification(int index) {
    final deletedNotification = notifications[index];

    setState(() {
      notifications.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '${deletedNotification['title']} removed',
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),

      body: CustomScrollView(
        slivers: [

          // ======================================================
          // HEADER
          // ======================================================

          SliverAppBar(
            expandedHeight: 205,
            pinned: true,
            elevation: 0,
            backgroundColor: const Color(0xFF17152D),
            automaticallyImplyLeading: false,

            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF17152D),
                      
                      Color.fromARGB(255, 23, 212, 155),
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
                      top: -50,
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
                      left: -70,
                      bottom: -90,
                      child: Container(
                        width: 190,
                        height: 190,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.05),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),

                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(
                          20,
                          12,
                          20,
                          20,
                        ),

                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,

                          children: [

                            // Top row
                            Row(
                              children: [

                                _HeaderIcon(
                                  icon:
                                      Icons.arrow_back_rounded,
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                ),

                                const Spacer(),

                                if (unreadCount > 0)
                                  GestureDetector(
                                    onTap: markAllAsRead,
                                    child: Container(
                                      padding:
                                          const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 9,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white
                                            .withOpacity(.12),
                                        borderRadius:
                                            BorderRadius.circular(
                                          20,
                                        ),
                                      ),
                                      child: const Text(
                                        'Mark all read',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight:
                                              FontWeight.w800,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),

                            const Spacer(),

                            const Text(
                              'STAY UPDATED',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 10,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 2,
                              ),
                            ),

                            const SizedBox(height: 5),

                            const Text(
                              'Notifications',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w900,
                              ),
                            ),

                            const SizedBox(height: 3),

                            Text(
                              unreadCount == 0
                                  ? 'You are all caught up'
                                  : '$unreadCount unread notifications',
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
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
          // SECTION HEADER
          // ======================================================

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                20,
                22,
                20,
                10,
              ),

              child: Row(
                children: [

                  const Text(
                    'Recent Activity',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF17152D),
                    ),
                  ),

                  const Spacer(),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),

                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 23, 212, 155)
                          .withOpacity(.09),
                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: Text(
                      '$unreadCount NEW',
                      style: const TextStyle(
                        color: Color.fromARGB(255, 23, 212, 155),
                        fontSize: 9,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ======================================================
          // NOTIFICATION LIST
          // ======================================================

          if (notifications.isEmpty)
            SliverFillRemaining(
              child: _EmptyNotifications(),
            )
          else
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(
                20,
                5,
                20,
                30,
              ),

              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {

                    final notification =
                        notifications[index];

                    return _NotificationCard(
                      notification: notification,
                      onTap: () {
                        markAsRead(index);
                      },
                      onDelete: () {
                        deleteNotification(index);
                      },
                    );
                  },

                  childCount: notifications.length,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// ================================================================
// HEADER ICON
// ================================================================

class _HeaderIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _HeaderIcon({
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
// NOTIFICATION CARD
// ================================================================

class _NotificationCard extends StatelessWidget {
  final Map<String, dynamic> notification;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const _NotificationCard({
    required this.notification,
    required this.onTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {

    final bool unread =
        notification['unread'] == true;

    final Color notificationColor =
        notification['color'] as Color;

    return Dismissible(
      key: ValueKey(
        '${notification['title']}_${notification['time']}',
      ),

      direction: DismissDirection.endToStart,

      onDismissed: (_) {
        onDelete();
      },

      background: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.only(right: 20),

        alignment: Alignment.centerRight,

        decoration: BoxDecoration(
          color: const Color(0xFFFF4D6D),
          borderRadius: BorderRadius.circular(22),
        ),

        child: const Icon(
          Icons.delete_outline_rounded,
          color: Colors.white,
          size: 25,
        ),
      ),

      child: GestureDetector(
        onTap: onTap,

        child: Container(
          margin: const EdgeInsets.only(bottom: 12),

          padding: const EdgeInsets.all(14),

          decoration: BoxDecoration(
            color: unread
                ? Colors.white
                : const Color(0xFFFDFDFE),

            borderRadius: BorderRadius.circular(22),

            border: unread
                ? Border.all(
                    color: notificationColor.withOpacity(.12),
                  )
                : null,

            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(
                  unread ? .045 : .025,
                ),
                blurRadius: 18,
                offset: const Offset(0, 7),
              ),
            ],
          ),

          child: Row(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [

              // ==================================================
              // ICON
              // ==================================================

              Container(
                width: 52,
                height: 52,

                decoration: BoxDecoration(
                  color: notificationColor.withOpacity(.10),
                  borderRadius: BorderRadius.circular(17),
                ),

                child: Icon(
                  notification['icon'],
                  color: notificationColor,
                  size: 23,
                ),
              ),

              const SizedBox(width: 13),

              // ==================================================
              // CONTENT
              // ==================================================

              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [

                    Row(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [

                        Expanded(
                          child: Text(
                            notification['title'],
                            maxLines: 1,
                            overflow:
                                TextOverflow.ellipsis,

                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: unread
                                  ? FontWeight.w900
                                  : FontWeight.w800,
                              color:
                                  const Color(0xFF17152D),
                            ),
                          ),
                        ),

                        if (unread)
                          Container(
                            width: 7,
                            height: 7,

                            margin:
                                const EdgeInsets.only(
                              left: 7,
                              top: 5,
                            ),

                            decoration:
                                const BoxDecoration(
                              color: Color.fromARGB(255, 23, 212, 155),
                              shape: BoxShape.circle,
                            ),
                          ),
                      ],
                    ),

                    const SizedBox(height: 5),

                    Text(
                      notification['message'],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,

                      style: const TextStyle(
                        fontSize: 11,
                        height: 1.45,
                        color: Colors.grey,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Row(
                      children: [

                        Text(
                          notification['time'],
                          style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w700,
                            color: unread
                                ? notificationColor
                                : Colors.grey,
                          ),
                        ),

                        const SizedBox(width: 8),

                        Container(
                          width: 3,
                          height: 3,
                          decoration:
                              const BoxDecoration(
                            color: Colors.grey,
                            shape: BoxShape.circle,
                          ),
                        ),

                        const SizedBox(width: 8),

                        Text(
                          notification['type'],
                          style: const TextStyle(
                            fontSize: 9,
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
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
      ),
    );
  }
}

// ================================================================
// EMPTY NOTIFICATIONS
// ================================================================

class _EmptyNotifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            Container(
              width: 110,
              height: 110,

              decoration: BoxDecoration(
                color: const Color(0xFF6C4CF1)
                    .withOpacity(.08),
                shape: BoxShape.circle,
              ),

              child: const Icon(
                Icons.notifications_none_rounded,
                size: 52,
                color: Color(0xFF6C4CF1),
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'All Caught Up!',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w900,
                color: Color(0xFF17152D),
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'You have no new notifications right now.\nWe will let you know when something happens.',
              textAlign: TextAlign.center,

              style: TextStyle(
                fontSize: 12,
                height: 1.5,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}