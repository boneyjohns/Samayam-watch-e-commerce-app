import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:samayam/const/colours.dart';

class Orderlist extends StatelessWidget {
  const Orderlist({
    super.key,
    required this.documentSnapshot,
  });

  final QueryDocumentSnapshot<Object?> documentSnapshot;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: kctransperant, borderRadius: BorderRadius.circular(30)),
        child: ListTile(
          leading: CircleAvatar(
              radius: 50,
              child: Image.network(
                documentSnapshot['images'][0],
                fit: BoxFit.cover,
              )),
          title: Text(
            documentSnapshot['name'],
            maxLines: 1,
            style: const TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          subtitle: documentSnapshot['isCanceled'] == false
              ? Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(30)),
                  child: documentSnapshot['isDeliverd'] == false
                      ? const Text('Order Placed')
                      : const Text('Shipped'),
                )
              : Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(30)),
                  child: const Text('Order Cancelled'),
                ),
        ));
  }
}
