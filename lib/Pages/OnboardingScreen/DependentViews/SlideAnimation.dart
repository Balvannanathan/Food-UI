import 'package:flutter/material.dart';

class SlideAnimation extends StatefulWidget {
  final Widget child;
  const SlideAnimation({super.key, required this.child});

  @override
  State<SlideAnimation> createState() => _SlideAnimationState();
}

class _SlideAnimationState extends State<SlideAnimation> {
  @override
  void initState() {
    super.initState();

    // Start animation after widget builds
    Future.delayed(Duration.zero, () {
      setState(() {
        _scale = 1.0;
        _offset = Offset.zero;
      });
    });
  }

  double _scale = 0;
  Offset _offset = const Offset(0, -1);

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
      offset: _offset,
      duration: const Duration(milliseconds: 500),
      child: AnimatedScale(
        duration: const Duration(milliseconds: 500),
        scale: _scale,
        curve: Curves.easeIn,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 500),
          opacity: _scale,
          child: widget.child,
        ),
      ),
    );
  }
}
