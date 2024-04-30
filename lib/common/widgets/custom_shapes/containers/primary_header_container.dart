
import 'package:flutter/material.dart';
import 'package:secureprovider/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:secureprovider/common/widgets/custom_shapes/curved_edges/curved_edges_widgets.dart';
import 'package:secureprovider/utils/constants/colors.dart';

class SePrimaryHeaderContainer extends StatelessWidget {
  const SePrimaryHeaderContainer({
    super.key, required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SeCurvedEdges(
      child: Container(
        color: SecuriteColors.primary,
        padding: const EdgeInsets.only(bottom: 0),
        child: Stack(
          children: [
            Positioned(top: -150, right: -250, child: SeCircularContainer(backgroundColor: SecuriteColors.white.withOpacity(0.1),)),
            Positioned(top: 100, right: -300, child: SeCircularContainer(backgroundColor: SecuriteColors.white.withOpacity(0.1),)),
            child,
          ],
        ),
      ),
    );
  }
}



