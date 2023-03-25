
class Purchase{
  int amount;
  String description;
  int nr_days; // if nr_days = 0 -> it it a uniquePurchase;
  Purchase(this.amount, this.description, this.nr_days);
}