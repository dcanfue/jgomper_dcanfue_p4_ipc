class OrderModel {
  String name;
  String address;
  DateTime? deliveryDate;
  String paymentMethod;
  bool isGift;

  OrderModel({
    this.name = '',
    this.address = '',
    this.deliveryDate,
    this.paymentMethod = 'Card', // Valor por defecto
    this.isGift = false,
  });
}