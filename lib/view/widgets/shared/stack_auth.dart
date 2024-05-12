import 'package:delivery_app/core/constant/imageassets.dart';
import 'package:flutter/material.dart';

class StackAuth extends StatelessWidget {
  const StackAuth({super.key, required this.child, this.opacity});

  final Widget child;
  final double? opacity;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: opacity ?? .12,
          child: Image.asset(
            AppImageAsset.pizza,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        child
      ],
    );
  }
}
