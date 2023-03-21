class TransactionModel {
  String title;
  String id;
  double amount;
  DateTime date;

  TransactionModel(
      {required this.id,
      required this.title,
      required this.amount,
      required this.date});
}
