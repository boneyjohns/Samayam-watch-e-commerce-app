import 'package:flutter/material.dart';
import 'package:samayam/const/colours.dart';
import 'package:samayam/const/const.dart';
import 'package:samayam/const/textstyle.dart';

class Cartlist extends StatelessWidget {
  const Cartlist(
      {Key? key,
      required this.cartimage,
      required this.productname,
      required this.price})
      : super(key: key);
  final String cartimage;
  final String productname;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: kctransperant,
      ),
      width: double.infinity,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: NetworkImage(cartimage),
                    fit: BoxFit.fill,
                  )),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(productname, style: kcartliststyle),
              kheight10,
              Text(
                'Price  $price',
                style: kcartliststyle,
              ),
            ],
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.delete,
                color: kred,
              ))
        ],
      ),
    );
  }
}
