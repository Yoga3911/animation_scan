import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyScanAnimation(),
    );
  }
}

class MyScanAnimation extends StatefulWidget {
  const MyScanAnimation({super.key});

  @override
  State<MyScanAnimation> createState() => _MyScanAnimationState();
}

class _MyScanAnimationState extends State<MyScanAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<Alignment>(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Container(
              height: 400,
              width: 200,
              color: Colors.red,
            ),
          ),
          Center(
            child: SizedBox(
              height: 400,
              width: 200,
              child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Align(
                    alignment: _animation.value,
                    child: Container(
                      width: 200,
                      height: 10,
                      color: Colors.black,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
