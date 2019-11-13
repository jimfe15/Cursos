import 'package:flutter/material.dart';

class RoundAnimatedIconButton extends StatelessWidget {
  RoundAnimatedIconButton(
      {@required this.icon,
      @required this.onPressed,
      @required this.controller});

  final AnimatedIconData icon;
  final Function onPressed;
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: AnimatedIcon(
        icon: icon,
        color: Colors.blueGrey[100],
        size: 40.0,
        progress: controller,
      ),
      onPressed: onPressed,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 66.0,
        height: 66.0,
      ),
      fillColor: Colors.blueGrey[900],
      shape: CircleBorder(),
    );
  }
}
