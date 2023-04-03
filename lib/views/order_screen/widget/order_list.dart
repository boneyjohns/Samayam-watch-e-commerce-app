import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:samayam/const/colours.dart';
import 'package:samayam/const/textstyle.dart';
import 'package:samayam/functions/add_order.dart';

class Orderlist extends StatelessWidget {
  const Orderlist({
    super.key,
    required this.documentSnapshot,
  });

  final QueryDocumentSnapshot<Object?> documentSnapshot;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
          decoration: BoxDecoration(
              color: kctransperant, borderRadius: BorderRadius.circular(30)),
          child: ListTile(
            leading: SizedBox(
                child: Image.network(
              documentSnapshot['images'][0],
              fit: BoxFit.cover,
            )),
            contentPadding: const EdgeInsets.all(10),
            horizontalTitleGap: 40,
            title: Text(documentSnapshot['name'],
                maxLines: 1, style: klistofproductname),
            subtitle: documentSnapshot['isCanceled'] == false
                ? Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(30)),
                    child: documentSnapshot['isDeliverd'] == false
                        ? Text('Order Placed', style: kproductdiscription)
                        : Text('Shipped', style: kproductdiscription),
                  )
                : Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(30)),
                    child: Text(
                      'Order Cancelled',
                      style: kproductdiscription,
                    ),
                  ),
            trailing: IconButton(
                icon: const Icon(
                  Icons.delete,
                  color: kred,
                ),
                onPressed: () {
                  removeFromorder(id: documentSnapshot['id']);
                }),
          )),
    );
  }
}
