enum TransactionType { income, expense }

class MoneyTransaction {
  MoneyTransaction({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
    required this.type,
  });

  final String title;
  final double amount;
  final DateTime date;
  final String category;
  final TransactionType type;
}
