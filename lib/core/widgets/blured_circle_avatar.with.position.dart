import 'dart:ui';

import 'package:flutter/material.dart';

class BlurredCircleAvatarWithPosition extends StatelessWidget {
  final Color color;
  final double height;
  final double width;

  final double? top;
  final double? bottom;
  final double? left;
  final double? right;
  final double blurWeight;

  const BlurredCircleAvatarWithPosition({
    Key? key,
    required this.color,
    this.top,
    this.bottom,
    this.left,
    this.right,
    this.blurWeight = 50, required this.height, required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipOval(
            child: Container(
              width: width,
              height: height,
              color: color,
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: blurWeight, sigmaY: blurWeight),
            child: Container(
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
            ),
          )
        ],
      ),
    );
  }
}
