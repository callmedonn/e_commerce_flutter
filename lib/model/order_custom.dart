class OrderCustom {
  final String id;
  final String total;

  OrderCustom({required this.id, required this.total});

  factory OrderCustom.fromJson(Map<String, dynamic> json) {
    return OrderCustom(
      id: json['id'],
      total: json['total'],
    );
  }

  // Map<String, dynamic> toJson() => {
  //       'id': id,
  //       'total': total,
  //     };
}
