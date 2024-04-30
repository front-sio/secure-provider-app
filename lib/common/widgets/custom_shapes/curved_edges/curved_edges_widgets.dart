import 'package:flutter/material.dart';
import 'package:secureprovider/common/widgets/custom_shapes/curved_edges/curved_edges.dart';

class SeCurvedEdges extends StatelessWidget {
  const SeCurvedEdges({
    super.key, this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: SeCustomCurvedEdges(),
      child: child,
    );
  }
}