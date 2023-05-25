class Budget{
  double amount;
  String category;

  Budget(this.amount, this.category) {
    if (amount < 0) {
      throw ArgumentError('Amount cannot be negative');
    }
  }
}