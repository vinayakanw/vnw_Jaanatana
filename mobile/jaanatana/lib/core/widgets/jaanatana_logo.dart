import 'package:flutter/material.dart';

class JaanatanaLogo extends StatelessWidget {
  const JaanatanaLogo({
    super.key,
    this.size = 38.0,
    this.fontSize = 20.0,
    this.showWordmark = true,
    this.showTagline = false,
  });

  final double size;
  final double fontSize;
  final bool showWordmark;
  final bool showTagline;

  @override
  Widget build(BuildContext context) {
    final logoWidget = ClipRRect(
      borderRadius: BorderRadius.circular(size * 0.22),
      child: Image.asset(
        'assets/images/Jaanatana_logo.png',
        width: size,
        height: size,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF2563EB), Color(0xFF7C3AED)],
              ),
              borderRadius: BorderRadius.circular(size * 0.22),
            ),
            child: const Center(
              child: Text(
                'J',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          );
        },
      ),
    );

    if (!showWordmark) {
      return logoWidget;
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        logoWidget,
        const SizedBox(width: 10),
        // Wordmark
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Jaanatana',
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w900,
                letterSpacing: -0.5,
                color: const Color(0xFF0F172A),
                height: 1.1,
              ),
            ),
            if (showTagline) ...[
              const SizedBox(height: 2),
              const Text(
                'Your Business Partner',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF64748B),
                  letterSpacing: -0.2,
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }
}
