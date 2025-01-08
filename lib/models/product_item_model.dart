class Item {
  Item({
    required this.description,
    required this.img,
    required this.discount,
    required this.emi,
    required this.emiTkByMonth,
    required this.newPrice,
    required this.oldPrice
  });

  final String description;
  final String img;
  final int emi;
  final String emiTkByMonth;
  final double oldPrice;
  final double newPrice;
  final String discount;

}