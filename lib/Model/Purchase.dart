class Purchase{
  double amount;
  String description;
  String category;
  int nr_days; // if nr_days = 0 -> it it a uniquePurchase;
  DateTime datetime;
  Purchase(this.amount, this.description, this.category,
      this.nr_days, this.datetime);
}