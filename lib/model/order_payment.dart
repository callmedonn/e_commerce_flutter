class OrderPayment {
  final String orderNumber;
  final List<String> orderItems;
  final int orderTotal;

  OrderPayment({
    required this.orderNumber,
    required this.orderItems,
    required this.orderTotal,
  });
}

List<OrderPayment> orders = [
  OrderPayment(
    orderNumber: '1234',
    orderItems: ['Item 1', 'Item 2'],
    orderTotal: 200000,
  ),
  OrderPayment(
    orderNumber: '5678',
    orderItems: ['Item 3', 'Item 4'],
    orderTotal: 150000,
  ),
];
