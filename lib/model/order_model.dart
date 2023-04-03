class OrderedProduct {
  final String name;
  final String price;
  final String analog;
  final String id;
  final String modelname;
  final String strapcolour;
  final String straptype;
  final String warrantyperiod;
  final String dualtime;
  final List images;
  int orderquantity = 1;
  final bool isDelivered;
  final bool isCanceled;

  OrderedProduct({
    required this.modelname,
    required this.strapcolour,
    required this.straptype,
    required this.warrantyperiod,
    required this.dualtime,
    required this.analog,
    required this.id,
    required this.name,
    required this.orderquantity,
    required this.price,
    required this.images,
    required this.isCanceled,
    required this.isDelivered,
  });
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'price': price,
        'orderquantity': orderquantity,
        'images': images,
        'modelname': modelname,
        'strapcolour': strapcolour,
        'straptype': straptype,
        'warrantyperiod': warrantyperiod,
        'dualtime': dualtime,
        'isDeliverd': isDelivered,
        'isCanceled': isCanceled,
      };

  static OrderedProduct fromJson(Map<String, dynamic> json) => OrderedProduct(
        orderquantity: json['orderquanty'],
        analog: json['analog'],
        name: json['name'],
        id: json['id'],
        price: json['price'],
        images: json['images'],
        isDelivered: json['isDeliverd'],
        isCanceled: json['isCanceled'],
        modelname: json['modelname'],
        dualtime: json['dualtime'],
        strapcolour: json['strapcolour'],
        straptype: json['straptype'],
        warrantyperiod: json['warrantyperiod'],
      );
}
