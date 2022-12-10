class BudgetModel {
  final String title;
  final int nominal;
  final DateTime transactionDate;
  final String type;

  BudgetModel({
    required this.title,
    required this.nominal,
    required this.transactionDate,
    required this.type
  });
}
