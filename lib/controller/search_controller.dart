import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:samayam/model/product_model.dart';

class Searchcontroller extends GetxController {
  List<ProductModel> productList = [];
  RxList<ProductModel> searchlist = <ProductModel>[].obs;

  getproductlist() async {
    productList = await FirebaseFirestore.instance
        .collection('search')
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((e) => ProductModel.fromJson(e.data())).toList())
        .first;

    searchlist.value = productList;
  }

  @override
  void onInit() {
    getproductlist();
    super.onInit();
  }

  search(String value) {
    searchlist.value = productList
        .where((element) =>
            element.name.toLowerCase().contains(value.trim().toLowerCase()))
        .toList();

    update();
  }
}
