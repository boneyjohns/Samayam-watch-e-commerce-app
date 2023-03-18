import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:samayam/const/colours.dart';
import 'package:samayam/controller/bottomnavcontroller.dart';
import 'package:samayam/views/cart_screen/cartscreen.dart';
import 'package:samayam/views/favorites_screen/favoritescreen.dart';
import 'package:samayam/views/home_screen/home_screen.dart';
import 'package:samayam/views/notification_screen/notification_screen.dart';
import 'package:samayam/views/profile_screen/profilescreen.dart';
import 'package:samayam/views/splash_screen/widget/splash_paint.dart';

class Navigationpage extends StatelessWidget {
  const Navigationpage({super.key});
  final int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const Homescreen(),
    const FavoritesScreen(),
    const CartScreen(),
    const NotificationScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetX<Bottomnavcontroller>(
        init: Bottomnavcontroller(),
        builder: (c) {
          return Scaffold(
            body: Stack(
              children: [
                const Mysplashpaint(),
                Center(
                  child: _widgetOptions.elementAt(c.selectedindex.value),
                ),
              ],
            ),
            bottomNavigationBar: Container(
              color: kblue,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(30), right: Radius.circular(30)),
                  color: kblack,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: GNav(
                      selectedIndex: _selectedIndex,
                      onTabChange: (index) {
                        c.bottomchange(index);
                      },
                      backgroundColor: kblack,
                      color: kblue,
                      activeColor: kred,
                      tabBackgroundColor: kgrey,
                      padding: const EdgeInsets.all(10),
                      tabs: const [
                        GButton(
                          icon: Icons.home,
                        ),
                        GButton(
                          icon: Icons.favorite,
                        ),
                        GButton(
                          icon: Icons.shopping_cart,
                        ),
                        GButton(
                          icon: Icons.notifications,
                        ),
                        GButton(
                          icon: Icons.person,
                        )
                      ]),
                ),
              ),
            ),
          );
        });
  }
}
