import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:samayam/const/colours.dart';
import 'package:samayam/const/const.dart';
import 'package:samayam/const/textstyle.dart';
import 'package:samayam/views/splash_screen/widget/splash_paint.dart';

class Orderdetails extends StatelessWidget {
  const Orderdetails({
    super.key,
    required this.documentSnapshot,
  });
  final QueryDocumentSnapshot<Object?> documentSnapshot;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      appBar: AppBar(
        title: Text(
          'Order details',
          style: kappbartext,
        ),
        centerTitle: true,
        backgroundColor: kappbarcolor,
      ),
      body: Stack(children: [
        CustomPaint(painter: Mypaint1(), child: Container()),
        Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: Image.network(documentSnapshot['images'][0],
                      fit: BoxFit.fitHeight),
                ),
                kheight20,
                Text(documentSnapshot['name'], style: klistofproductname),
                kheight20,
                Text(
                    "Price                        ₹${documentSnapshot['price']}",
                    style: kproductdiscription),
                kheight20,
                Text(
                    "Modelname                 ${documentSnapshot['modelname']}",
                    style: kproductdiscription),
                kheight20,
                Text(
                    "Warranty Period                ${documentSnapshot['warrantyperiod']}",
                    style: kproductdiscription),
                kheight20,
                Text(
                    "Strap Colour               ${documentSnapshot['strapcolour']}",
                    style: kproductdiscription),
                kheight20,
                Text(
                    "Straptype                 ${documentSnapshot['straptype']}",
                    style: kproductdiscription),
                kheight20,
                Text(
                    "Dual time                   ${documentSnapshot['dualtime']}",
                    style: kproductdiscription),
                kheight20,
                Text(
                  "Order status",
                  style: kbrandname,
                ),
                kheight20,
                documentSnapshot['isCanceled'] == false
                    ? Container(
                        height: 40,
                        width: 200,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(30)),
                        child: documentSnapshot['isDeliverd'] == false
                            ? Center(
                                child: Text(
                                'Order Placed',
                                style: kbuttonstyle,
                              ))
                            : Center(
                                child: Text('Shipped', style: kbuttonstyle)),
                      )
                    : Container(
                        height: 40,
                        width: 200,
                        decoration: BoxDecoration(
                            color: kred,
                            borderRadius: BorderRadius.circular(30)),
                        child: Center(
                            child: Text(
                          'Order Cancelled',
                          style: kbuttonstyle,
                        )),
                      ),
              ],
            ))
      ]),
    );
  }
}
