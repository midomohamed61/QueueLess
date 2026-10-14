import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
  with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _fadeanimation;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animationController?.forward();
    _fadeanimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_animationController!);
  }
  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D507F),

      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,

            children: [
              FadeTransition(
                opacity: _fadeanimation!,
                 child: Image.asset('assets/logo/QueueLess Ticket Logo.png')),
              const SizedBox(height: 20),
              const Text(
                'QueueLess Ticket',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
