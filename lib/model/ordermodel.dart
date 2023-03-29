class OrderedProduct {
  final String name;

  final String price;
  final String analog;
  final String id;

  final List images;
  int orderquantity = 1;

  final bool isDelivered;
  final bool isCanceled;

  OrderedProduct({
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
        'analog': analog,
        'orderquantity': orderquantity,
        'images': images,
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
      );
}
