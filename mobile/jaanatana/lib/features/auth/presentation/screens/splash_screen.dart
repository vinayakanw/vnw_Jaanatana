import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jaanatana/features/auth/presentation/providers/auth_provider.dart';


class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  Timer? _navigationTimer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();

    _initializeApp();
  }

  Future<void> _initializeApp() async {
    // Check user session
    await ref.read(authProvider.notifier).checkSession();

    _navigationTimer = Timer(const Duration(milliseconds: 1800), () {
      if (!mounted) return;
      final authState = ref.read(authProvider);
      if (authState.status == AuthStatus.authenticated) {
        context.go('/app/home');
      } else {
        context.go('/login');
      }
    });
  }

  @override
  void dispose() {
    _navigationTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 3),

            // Official Jaanatana Logo
            Center(
              child: Container(
                width: 96,
                height: 96,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x332563EB),
                      blurRadius: 26,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.asset(
                    'assets/images/Jaanatana_logo.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Brand wordmark
            Center(
              child: Text(
                'Jaanatana',
                style: const TextStyle(
                  color: Color(0xFF0F172A),
                  fontSize: 34,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -0.8,
                ),
              ),
            ),
            const SizedBox(height: 6),

            // Tagline
            const Text(
              'Your Business Partner',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF64748B),
                fontWeight: FontWeight.w500,
                letterSpacing: 0.3,
              ),
            ),

            const SizedBox(height: 32),

            // Animated 3-dot loading indicator
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) {
                    final progress = (_controller.value - (index * 0.25)) % 1.0;
                    final opacity = (progress < 0.5 ? progress * 2 : (1.0 - progress) * 2).clamp(0.25, 1.0);
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: const Color(0xFF2563EB).withValues(alpha: opacity),
                        shape: BoxShape.circle,
                      ),
                    );
                  }),
                );
              },
            ),

            const Spacer(flex: 2),

            // Bottom Tagline
            const Padding(
              padding: EdgeInsets.only(bottom: 32),
              child: Text(
                'Smarter Business · Brighter Tomorrow',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF94A3B8),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
