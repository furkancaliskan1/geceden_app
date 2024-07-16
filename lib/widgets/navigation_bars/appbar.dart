import 'package:app_geceden/assets/colors.dart';
import 'package:app_geceden/assets/text_styles.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  
  final Function()? onNotificationPressed;
  final Function()? onLocationPressed;
  final Function()? onBucketPressed;
  
  const CustomAppBar({
    super.key,
    required this.onBucketPressed,
    required this.onLocationPressed,
    required this.onNotificationPressed
  });

  @override
  Size get preferredSize => const Size.fromHeight(70.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.appBackgroundColor,
      title: Text(
        'GECEDEN',
        style: AppTextStyles.appBarIconTextStyle,
      ),
      actions: [
        IconButton(
          onPressed: onBucketPressed,
          icon: const Icon(
            Icons.notifications_outlined,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 10),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.location_on_outlined,
            color: Colors.white,
            size: 24.0,
          ),
        ),
        const SizedBox(width: 10),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.shopping_bag_outlined,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}
