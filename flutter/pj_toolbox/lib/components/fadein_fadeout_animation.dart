//import 'package:flutter/material.dart';
//
//import 'alternate_animations.dart';
//
//class FadeInOutAnimation extends StatefulWidget {
//  FadeInOutAnimation({this.child});
//  final Widget child;
//
//  @override
//  _FadeInOutAnimationState createState() => _FadeInOutAnimationState();
//}
//
//class _FadeInOutAnimationState extends State<FadeInOutAnimation>
//    with SingleTickerProviderStateMixin {
//  AnimationController animationController;
//  Animation<double> animation;
//
//  @override
//  void initState() {
//    super.initState();
//    animationController = AnimationController(
//      vsync: this,
//      duration: Duration(milliseconds: 1),
//    )..addListener(() => setState(() {}));
//
//    animation = Tween<double>(
//      begin: 0.0,
//      end: 1.0,
//    ).animate(animationController);
//
//    alternateAnimations(animationController);
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return FadeTransition(
//      opacity: animation,
//      child: widget.child,
//    );
//  }
//}
