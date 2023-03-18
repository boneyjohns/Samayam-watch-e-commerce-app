import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samayam/views/favorites_screen/wishlist_product.dart';
import 'package:samayam/views/navigation_screen/widget/myappbar.dart';
import 'package:samayam/views/settings/settings.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Myappbar(
          appbartrailing: IconButton(
              onPressed: () {
                Get.to(const Settings(),
                    transition: Transition.circularReveal,
                    duration: const Duration(seconds: 2));
              },
              icon: const Icon(Icons.settings)),
          title: const Text('Wishlist'),
        ),
        const Expanded(
          child: Wishlistproducts(),
        )
      ],
    );
  }
}
