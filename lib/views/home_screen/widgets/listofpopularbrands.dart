import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samayam/const/colours.dart';
import 'package:samayam/views/insidecategoires/inside_categoires.dart';

class Listofbrandicons extends StatelessWidget {
  const Listofbrandicons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: StreamBuilder<QuerySnapshot>(
          stream:
              FirebaseFirestore.instance.collection('categories').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    QueryDocumentSnapshot documentSnapshot =
                        snapshot.data!.docs[index];
                    return GestureDetector(
                      onTap: () {
                        Get.to(
                            () => Insidecategoires(
                                brand: documentSnapshot['name']),
                            transition: Transition.circularReveal,
                            duration: const Duration(seconds: 2));
                      },
                      child: Popularbrand(
                        brandname: documentSnapshot['name'],
                      ),
                    );
                  },
                  itemCount: snapshot.data!.docs.length,
                  separatorBuilder: (context, index) => Divider(
                    endIndent: 10,
                  ),
                ),
              );
            } else {
              return const Text('list is empty');
            }
          }),
    );
  }
}

class Popularbrand extends StatelessWidget {
  const Popularbrand({Key? key, required this.brandname}) : super(key: key);
  final String brandname;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: kctransperant,
      ),
      child: Center(child: Text(brandname)),
    );
  }
}
