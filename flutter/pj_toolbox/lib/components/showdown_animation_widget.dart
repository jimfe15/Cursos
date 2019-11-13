import 'dart:async';
import 'package:flutter/material.dart';

class ShowDownAnimation extends StatefulWidget {
  final Widget child;
  final int delay;

  ShowDownAnimation({@required this.child, this.delay});

  @override
  _ShowDownAnimationState createState() => _ShowDownAnimationState();
}

class _ShowDownAnimationState extends State<ShowDownAnimation>
    with TickerProviderStateMixin {
  AnimationController _animController;
  Animation<Offset> _animOffset;

  @override
  void initState() {
    super.initState();

    _animController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    final curve =
        CurvedAnimation(curve: Curves.decelerate, parent: _animController);
    _animOffset =
        Tween<Offset>(begin: Offset.zero, end: const Offset(0.0, 0.60))
            .animate(curve);

    if (widget.delay == null) {
      _animController.forward();
    } else {
      Timer(Duration(milliseconds: 50), () {
        _animController.forward();
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _animController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      child: SlideTransition(
        position: _animOffset,
        textDirection: TextDirection.ltr,
        child: widget.child,
      ),
      opacity: _animController,
    );
  }
}
