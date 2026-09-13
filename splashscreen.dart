import 'dart:async';
import 'package:flutter/material.dart';
import 'package:newecommapp/onbonding1.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2200),
    );

    // Fade
    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );

    // Scale
    _scaleAnimation = Tween<double>(
      begin: 0.65,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutBack,
      ),
    );

    // Slide
    _slideAnimation = Tween<double>(
      begin: 35,
      end: 0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutCubic,
      ),
    );

    _controller.forward();

    // Go to onboarding
    Timer(const Duration(seconds: 4), () {
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,

        decoration: const BoxDecoration(
          gradient: LinearGradient(
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
        ),

        child: Stack(
          children: [

            // ==========================================
            // DECORATIVE CIRCLES
            // ==========================================

            Positioned(
              top: -100,
              right: -80,
              child: Container(
                width: 260,
                height: 260,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.05),
                ),
              ),
            ),

            Positioned(
              bottom: -120,
              left: -100,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.04),
                ),
              ),
            ),

            // ==========================================
            // MAIN CONTENT
            // ==========================================

            Center(
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Opacity(
                    opacity: _fadeAnimation.value,
                    child: Transform.translate(
                      offset: Offset(
                        0,
                        _slideAnimation.value,
                      ),
                      child: Transform.scale(
                        scale: _scaleAnimation.value,
                        child: child,
                      ),
                    ),
                  );
                },

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    // ==================================
                    // LOGO
                    // ==================================

                    Container(
                      width: 125,
                      height: 125,

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(35),

                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 23, 212, 155)
                                .withOpacity(0.35),
                            blurRadius: 35,
                            spreadRadius: 5,
                            offset: const Offset(0, 15),
                          ),
                        ],
                      ),

                      child: Stack(
                        alignment: Alignment.center,
                        children: [

                          Container(
                            width: 90,
                            height: 90,

                            decoration: BoxDecoration(
                              color: const Color(0xFFF9FAFB),
                              borderRadius:
                                  BorderRadius.circular(28),
                            ),
                          ),

                          const Icon(
                            Icons.shopping_bag_rounded,
                            size: 55,
                            color: Color.fromARGB(255, 23, 212, 155),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // ==================================
                    // APP NAME
                    // ==================================

                    const Text(
                      'MY SHOP',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 34,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 4,
                      ),
                    ),

                    const SizedBox(height: 10),

                    // ==================================
                    // TAGLINE
                    // ==================================

                    const Text(
                      'FASHION • STYLE • YOU',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 2,
                      ),
                    ),

                    const SizedBox(height: 45),

                    // ==================================
                    // LOADING BAR
                    // ==================================

                    SizedBox(
                      width: 150,
                      child: Column(
                        children: [

                          ClipRRect(
                            borderRadius:
                                BorderRadius.circular(20),

                            child: const LinearProgressIndicator(
                              minHeight: 4,
                              backgroundColor: Colors.white24,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(
                                Color.fromARGB(255, 23, 212, 155),
                              ),
                            ),
                          ),

                          const SizedBox(height: 12),

                          const Text(
                            'Loading your style...',
                            style: TextStyle(
                              color: Colors.white60,
                              fontSize: 11,
                              letterSpacing: 0.8,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ==========================================
            // BOTTOM TEXT
            // ==========================================

            Positioned(
              bottom: 30,
              left: 0,
              right: 0,

              child: Column(
                children: const [

                  Text(
                    'YOUR STYLE, YOUR WAY',
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 9,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.5,
                    ),
                  ),

                  SizedBox(height: 6),

                  Text(
                    '© MY SHOP',
                    style: TextStyle(
                      color: Colors.white38,
                      fontSize: 9,
                    ),
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

