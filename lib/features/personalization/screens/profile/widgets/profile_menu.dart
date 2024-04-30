import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:secureprovider/utils/constants/size.dart';

class SeProfileMenu extends StatelessWidget {
  const SeProfileMenu({
    super.key, this.icon = Iconsax.arrow_right, required this.onPressed, required this.title, required this.value,
  });

final IconData icon;
final VoidCallback onPressed;
final String title, value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: SecuriteSize.spaceBtwItem / 1.5),
        child: Row(
          children: [
            Expanded(flex: 3, child: Text(title.capitalize!, style: Theme.of(context).textTheme.bodyMedium, overflow: TextOverflow.ellipsis,)),     
            Expanded(flex: 5, child: Text(value.capitalize!,  style: Theme.of(context).textTheme.bodySmall, overflow: TextOverflow.ellipsis,)),
            
            Expanded(child: Icon(icon, size: 18,))
          ],
        ),
      ),
    );
  }
}