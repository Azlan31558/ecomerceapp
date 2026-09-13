
import 'package:flutter/material.dart';
import 'package:newecommapp/homescreen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  int currentPage = 0;

  final List<Map<String, dynamic>> pages = [
    {
      'icon': Icons.shopping_bag_rounded,
      'smallIcon': Icons.auto_awesome_rounded,
      'title': 'Discover Your Style',
      'description':
          'Explore the latest fashion trends and discover products that perfectly match your unique style.',
    },
    {
      'icon': Icons.local_shipping_rounded,
      'smallIcon': Icons.flash_on_rounded,
      'title': 'Fast & Easy Delivery',
      'description':
          'Order your favorite products and enjoy fast, safe and reliable delivery right to your doorstep.',
    },
    {
      'icon': Icons.favorite_rounded,
      'smallIcon': Icons.star_rounded,
      'title': 'Shop With Confidence',
      'description':
          'Save your favorite products, build your wishlist and enjoy a smooth shopping experience.',
    },
  ];

  void nextPage() {
    if (currentPage < pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOutCubic,
      );
    } else {
      goToHome();
    }
  }

  void goToHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),

      body: SafeArea(
        child: Column(
          children: [

            // =================================================
            // TOP BAR
            // =================================================

            Padding(
              padding: const EdgeInsets.fromLTRB(
                20,
                12,
                20,
                0,
              ),

              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,

                children: [

                  // Logo
                  Row(
                    children: [

                      Container(
                        width: 38,
                        height: 38,

                        decoration: BoxDecoration(
                          color: const Color(0xFF111827),
                          borderRadius:
                              BorderRadius.circular(12),
                        ),

                        child: const Icon(
                          Icons.shopping_bag_rounded,
                          color: Color(0xFFF9FAFB),
                          size: 20,
                        ),
                      ),

                      const SizedBox(width: 10),

                      const Text(
                        'MY SHOP',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.2,
                          color: Color(0xFF111827),
                        ),
                      ),
                    ],
                  ),

                  // Skip
                  TextButton(
                    onPressed: goToHome,

                    style: TextButton.styleFrom(
                      foregroundColor:
                          Color.fromARGB(255, 23, 212, 155),
                    ),

                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // =================================================
            // PAGE VIEW
            // =================================================

            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: pages.length,

                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },

                itemBuilder: (context, index) {
                  final page = pages[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),

                    child: Column(
                      mainAxisAlignment:
                          MainAxisAlignment.center,

                      children: [

                        // =====================================
                        // MAIN ILLUSTRATION
                        // =====================================

                        Container(
                          width: 270,
                          height: 270,

                          decoration: BoxDecoration(
                            gradient:
                                const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFF111827),
                                Color(0xFF111827),
                                Color.fromARGB(255, 23, 212, 155),
                              ],
                              stops: [
                                0.0,
                                0.55,
                                1.0,
                              ],
                            ),

                            borderRadius:
                                BorderRadius.circular(80),

                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 23, 212, 155).withOpacity(0.22),

                                blurRadius: 30,

                                offset:
                                    const Offset(0, 15),
                              ),
                            ],
                          ),

                          child: Stack(
                            children: [

                              // Decorative circle
                              Positioned(
                                right: -35,
                                top: -35,

                                child: Container(
                                  width: 130,
                                  height: 130,

                                  decoration:
                                      BoxDecoration(
                                    shape:
                                        BoxShape.circle,
                                    color: const Color(
                                      0xFFF9FAFB,
                                    ).withOpacity(
                                      0.07,
                                    ),
                                  ),
                                ),
                              ),

                              // Decorative circle
                              Positioned(
                                left: -45,
                                bottom: -45,

                                child: Container(
                                  width: 150,
                                  height: 150,

                                  decoration:
                                      BoxDecoration(
                                    shape:
                                        BoxShape.circle,
                                    color: const Color(
                                      0xFFF9FAFB,
                                    ).withOpacity(
                                      0.05,
                                    ),
                                  ),
                                ),
                              ),

                              Center(
                                child: Container(
                                  width: 145,
                                  height: 145,

                                  decoration:
                                      BoxDecoration(
                                    color: const Color(
                                      0xFFF9FAFB,
                                    ).withOpacity(
                                      0.12,
                                    ),

                                    borderRadius:
                                        BorderRadius
                                            .circular(
                                      45,
                                    ),

                                    border: Border.all(
                                      color: const Color(
                                        0xFFF9FAFB,
                                      ).withOpacity(
                                        0.12,
                                      ),
                                    ),
                                  ),

                                  child: Icon(
                                    page['icon'],
                                    size: 75,
                                    color: const Color(
                                      0xFFF9FAFB,
                                    ),
                                  ),
                                ),
                              ),

                              // Small floating icon
                              Positioned(
                                right: 28,
                                bottom: 35,

                                child: Container(
                                  width: 48,
                                  height: 48,

                                  decoration:
                                      BoxDecoration(
                                    color: const Color(
                                      0xFFF9FAFB,
                                    ),
                                    shape:
                                        BoxShape.circle,

                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color(
                                          0xFF111827,
                                        ).withOpacity(
                                          0.15,
                                        ),
                                        blurRadius: 15,
                                      ),
                                    ],
                                  ),

                                  child: Icon(
                                    page['smallIcon'],
                                    color:
                                        Color.fromARGB(255, 23, 212, 155),
                                    size: 23,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 45),

                        // =====================================
                        // TITLE
                        // =====================================

                        Text(
                          page['title'],
                          textAlign: TextAlign.center,

                          style: const TextStyle(
                            fontSize: 29,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF111827),
                          ),
                        ),

                        const SizedBox(height: 15),

                        // =====================================
                        // DESCRIPTION
                        // =====================================

                        Text(
                          page['description'],
                          textAlign: TextAlign.center,

                          style: const TextStyle(
                            fontSize: 14,
                            height: 1.7,
                            color: Color(0xFF111827),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // =================================================
            // PAGE INDICATORS
            // =================================================

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                pages.length,
                (index) {
                  final isActive =
                      currentPage == index;

                  return AnimatedContainer(
                    duration:
                        const Duration(milliseconds: 350),

                    curve: Curves.easeOut,

                    margin:
                        const EdgeInsets.symmetric(
                      horizontal: 4,
                    ),

                    width: isActive ? 32 : 8,
                    height: 8,

                    decoration: BoxDecoration(
                      color: isActive
                          ? Color.fromARGB(255, 23, 212, 155)
                          : const Color(0xFF111827)
                              .withOpacity(0.18),

                      borderRadius:
                          BorderRadius.circular(20),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 25),

            // =================================================
            // NEXT BUTTON
            // =================================================

            Padding(
              padding: const EdgeInsets.fromLTRB(
                22,
                0,
                22,
                25,
              ),

              child: SizedBox(
                width: double.infinity,
                height: 58,

                child: ElevatedButton(
                  onPressed: nextPage,

                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color(0xFF111827),

                    foregroundColor:
                        const Color(0xFFF9FAFB),

                    elevation: 8,

                    shadowColor: Color.fromARGB(255, 23, 212, 155).withOpacity(0.3),

                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(18),
                    ),
                  ),

                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center,

                    children: [

                      Text(
                        currentPage ==
                                pages.length - 1
                            ? 'Get Started'
                            : 'Continue',

                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                        ),
                      ),

                      const SizedBox(width: 10),

                      Container(
                        width: 30,
                        height: 30,

                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 23, 212, 155).withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),

                        child: Icon(
                          currentPage ==
                                  pages.length - 1
                              ? Icons.check_rounded
                              : Icons
                                  .arrow_forward_rounded,
                          size: 17,
                          color: const Color(
                            0xFFF9FAFB,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}