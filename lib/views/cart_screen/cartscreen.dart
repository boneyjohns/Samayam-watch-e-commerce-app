import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samayam/const/const.dart';

import 'package:samayam/views/cart_screen/widget/cartlist.dart';
import 'package:samayam/views/cart_screen/widget/checkoutbob.dart';
import 'package:samayam/views/navigation_screen/widget/myappbar.dart';
import 'package:samayam/views/settings/settings.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({
    super.key,
  });

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
          title: const Text('Cart'),
        ),
        Expanded(
          child: ListView(
            children: const [
              Cartlist(
                cartimage:
                    'https://images.pexels.com/photos/190819/pexels-photo-190819.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                price: '60499',
                productname: 'Rolex',
              ),
              kheight10,
              Cartlist(
                cartimage:
                    'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcR_XgKsMgwtcXl5X4Y3BhP7FpJXu8Oa3N1CVS06JgDX_HsFr64ZxwBQwdIdTM_PYE-XmZDNZYWt2-Qz7Romq29O9GkRR8_Iv9JzgFxSOpnWcjtHhuU8MUgrxw',
                price: '41000',
                productname: 'Tisort',
              ),
              kheight10,
              Cartlist(
                cartimage:
                    'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTyE9FXe7xk1txY8Hj96mJxANYwhVDmKn6g-cCHDo0hniAJgu3rYlF4FYu6FVo40lpA3ZSUYkQr45xP_PuqOChG1UVtvKjW2QHjlry1K5e1wOe_QsgT6PqdmYkD',
                price: '21000',
                productname: 'Titan',
              ),
              kheight10,
              Cartlist(
                cartimage:
                    'https://images.pexels.com/photos/190819/pexels-photo-190819.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                price: '60499',
                productname: 'Rolex',
              ),
              kheight10,
              Cartlist(
                cartimage:
                    'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcR_XgKsMgwtcXl5X4Y3BhP7FpJXu8Oa3N1CVS06JgDX_HsFr64ZxwBQwdIdTM_PYE-XmZDNZYWt2-Qz7Romq29O9GkRR8_Iv9JzgFxSOpnWcjtHhuU8MUgrxw',
                price: '41000',
                productname: 'Tisort',
              ),
              kheight10,
              Cartlist(
                cartimage:
                    'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTyE9FXe7xk1txY8Hj96mJxANYwhVDmKn6g-cCHDo0hniAJgu3rYlF4FYu6FVo40lpA3ZSUYkQr45xP_PuqOChG1UVtvKjW2QHjlry1K5e1wOe_QsgT6PqdmYkD',
                price: '21000',
                productname: 'Titan',
              ),
            ],
          ),
        ),
        const Positioned(
          bottom: 10,
          child: Checkoutbox(),
        )
      ],
    );
  }
}
