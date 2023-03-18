class ProductModel {
  final String doc;
  final String name;
  final String price;
  final String quantity;
  final String displaytype;
  final String modelname;
  final String strapcolour;
  final String straptype;
  final String warrantyperiod;
  final String dualtime;
  final List imagelist;

  ProductModel(
      {required this.name,
      required this.doc,
      required this.price,
      required this.quantity,
      required this.displaytype,
      required this.modelname,
      required this.strapcolour,
      required this.straptype,
      required this.warrantyperiod,
      required this.dualtime,
      required this.imagelist});
  Map<String, dynamic> toJson() => {
        'name': name,
        'price': price,
        'displaytype': displaytype,
        'quantity': quantity,
        'image': imagelist,
        'modelname': modelname,
        'strapcolour': strapcolour,
        'straptype': straptype,
        'warrantyperiod': warrantyperiod,
        'dualtime': dualtime,
        'doc': doc
      };

  static ProductModel fromJson(Map<String, dynamic> json) => ProductModel(
      name: json['name'],
      price: json['price'],
      quantity: json['quantity'],
      displaytype: json['displaytype'],
      modelname: json['modelname'],
      strapcolour: json['strapcolour'],
      straptype: json['straptype'],
      warrantyperiod: json['warrantyperiod'],
      dualtime: json['dualtime'],
      doc: json['doc'],
      imagelist: json['image']);
}
