import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class FadeInUp extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Duration delay;
  final Function(AnimationController)? controller;
  final bool manualTrigger;
  final bool animate;
  final double from;

  FadeInUp({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 800),
    this.delay = const Duration(milliseconds: 0),
    this.controller,
    this.manualTrigger = false,
    this.animate = true,
    this.from = 100,
  }) {
    if (manualTrigger == true && controller == null) {
      throw FlutterError(
        'If you want to use manualTrigger:true, \n\n'
        'Then you must provide the controller property, '
        'that is a callback like:\n\n'
        '( controller: AnimationController) => yourController = controller \n\n',
      );
    }
  }

  @override
  FadeInUpState createState() => FadeInUpState();
}

class FadeInUpState extends State<FadeInUp>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  late Animation<double> animation;
  late Animation<double> opacity;

  bool disposed = false;
  bool hasAnimated = false;

  /// Unique key for VisibilityDetector.
  final Key visibilityKey = UniqueKey();

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    animation = Tween<double>(
      begin: widget.from,
      end: 0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeOut,
      ),
    );

    opacity = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0, 0.65),
      ),
    );

    if (widget.controller != null) {
      widget.controller!(controller);
    }

    // Preserve manual trigger behavior.
    if (widget.manualTrigger) {
      return;
    }

    // If animations are disabled, show the widget normally.
    if (!widget.animate) {
      controller.value = 1;
    }
  }

  void _startAnimation() {
    if (disposed || hasAnimated || widget.manualTrigger) {
      return;
    }

    if (!widget.animate) {
      return;
    }

    hasAnimated = true;

    Future.delayed(widget.delay, () {
      if (!disposed && mounted) {
        controller.forward();
      }
    });
  }

  void _handleVisibilityChanged(VisibilityInfo info) {
    if (hasAnimated || widget.manualTrigger || !widget.animate) {
      return;
    }

    // Start when at least 10% of the widget is visible.
    if (info.visibleFraction >= 0.10) {
      _startAnimation();
    }
  }

  @override
  void dispose() {
    disposed = true;
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: visibilityKey,
      onVisibilityChanged: _handleVisibilityChanged,
      child: AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget? child) {
          return Transform.translate(
            offset: Offset(
              0,
              animation.value,
            ),
            child: Opacity(
              opacity: opacity.value,
              child: widget.child,
            ),
          );
        },
      ),
    );
  }
}

class FadeInRight extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Duration delay;
  final Function(AnimationController)? controller;
  final bool manualTrigger;
  final bool animate;
  final double from;

  FadeInRight({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 800),
    this.delay = const Duration(milliseconds: 0),
    this.controller,
    this.manualTrigger = false,
    this.animate = true,
    this.from = 100,
  }) {
    if (manualTrigger == true && controller == null) {
      throw FlutterError(
        'If you want to use manualTrigger:true, \n\n'
        'Then you must provide the controller property, '
        'that is a callback like:\n\n'
        '( controller: AnimationController) => yourController = controller \n\n',
      );
    }
  }

  @override
  FadeInRightState createState() => FadeInRightState();
}

class FadeInRightState extends State<FadeInRight>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  late Animation<double> animation;
  late Animation<double> opacity;

  bool disposed = false;
  bool hasAnimated = false;

  final Key visibilityKey = UniqueKey();

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    animation = Tween<double>(
      begin: widget.from,
      end: 0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeOut,
      ),
    );

    opacity = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0, 0.65),
      ),
    );

    if (widget.controller != null) {
      widget.controller!(controller);
    }

    // Preserve manual trigger behavior.
    if (widget.manualTrigger) {
      return;
    }

    // If animations are disabled, show normally.
    if (!widget.animate) {
      controller.value = 1;
    }
  }

  void _startAnimation() {
    if (disposed || hasAnimated || widget.manualTrigger) {
      return;
    }

    if (!widget.animate) {
      return;
    }

    hasAnimated = true;

    Future.delayed(widget.delay, () {
      if (!disposed && mounted) {
        controller.forward();
      }
    });
  }

  void _handleVisibilityChanged(VisibilityInfo info) {
    if (hasAnimated || widget.manualTrigger || !widget.animate) {
      return;
    }

    // Start when at least 10% of the widget is visible.
    if (info.visibleFraction >= 0.10) {
      _startAnimation();
    }
  }

  @override
  void dispose() {
    disposed = true;
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: visibilityKey,
      onVisibilityChanged: _handleVisibilityChanged,
      child: AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget? child) {
          return Transform.translate(
            offset: Offset(
              animation.value,
              0,
            ),
            child: Opacity(
              opacity: opacity.value,
              child: widget.child,
            ),
          );
        },
      ),
    );
  }
}

class FadeInRightBig extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final Duration delay;
  final Function(AnimationController)? controller;
  final bool manualTrigger;
  final bool animate;
  final double from;

  const FadeInRightBig({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 1200),
    this.delay = const Duration(milliseconds: 0),
    this.controller,
    this.manualTrigger = false,
    this.animate = true,
    this.from = 600,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInRight(
      duration: duration,
      delay: delay,
      controller: controller,
      manualTrigger: manualTrigger,
      animate: animate,
      from: from,
      child: child,
    );
  }
}
