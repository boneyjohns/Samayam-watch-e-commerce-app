import 'package:flutter/material.dart';
import 'package:samayam/const/textstyle.dart';
import 'package:samayam/views/home_screen/widgets/list_of_products.dart';
import 'package:samayam/views/navigation_screen/widget/myappbar.dart';
import 'package:samayam/views/splash_screen/widget/splash_paint.dart';

class Insidecategoires extends StatelessWidget {
  const Insidecategoires({required this.brand, super.key});
  final String brand;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Myappbar(
              appbartrailing: IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {},
              ),
              title: Text(
                brand,
                style: kappbartext,
              )),
        ),
        body: Stack(
          children: [
            const Mysplashpaint(),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Listofproducts(
                brandname: brand,
              ),
            ),
          ],
        ));
  }
}
