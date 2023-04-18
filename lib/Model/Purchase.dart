class Purchase implements Comparable<Purchase>{
  double amount;
  String description;
  String category;
  int nr_days; // if nr_days = 0 -> it it a uniquePurchase;
  DateTime datetime;
  Purchase(this.amount, this.description, this.category,
      this.nr_days, this.datetime);

  @override
  int compareTo(Purchase other) {

    final dateComparison = datetime.compareTo(other.datetime);
    if (dateComparison != 0) {
      return dateComparison;
    }

    return amount.compareTo(other.amount);
  }

  void setAttribures(double amount, String description, String category, int nr_days){
    this.amount = amount;
    this.description = description;
    this.category = category;
    this.nr_days = nr_days;
  }
}
