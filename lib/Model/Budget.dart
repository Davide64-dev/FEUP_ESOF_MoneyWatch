class Budget{
  String name;
  String description;
  double amount;
  String category;

  Budget(this.name, this.description, this.amount, this.category) {
    if (amount < 0) {
      throw ArgumentError('Amount cannot be negative');
    }
  }
}