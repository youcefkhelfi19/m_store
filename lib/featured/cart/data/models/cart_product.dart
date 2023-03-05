class ProductCart {
  final String productId;
  final String title;
  final String description;
  final double price;
  final int quantity;
  final List<String> images;
  final String size;
  final int color;
  final String dateTime;



  ProductCart({
    required this.productId,
    required this.title,
    required this.quantity,
    required this.description,
    required this.price,
    required this.images,
    required this.color,
    required this.size,
    required this.dateTime
  });

  factory ProductCart.fromJson(Map<dynamic, dynamic> map) {
    return ProductCart(
      productId: map['id'],
      title: map['title'],
      dateTime: map['dateTime'],
      description: map['description'],
      quantity: map['quantity'],
      price: map['price'].toDouble(),
      images: List<String>.from(map['images']),
      color: map['color'],
      size: map['color'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = productId;
    data['title'] = title;
    data['description'] = description;
    data['quantity'] = quantity;
    data['price'] = price;
    data['images'] = images;
    data['dateTime'] = dateTime;
    data['color'] = color;
    data['size'] = size;
    return data;
  }
}
