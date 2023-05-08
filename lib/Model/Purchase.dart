class Purchase implements Comparable<Purchase>{
  String code;
  double amount;
  String description;
  String category;
  int nr_days; // if nr_days = 0 -> it it a uniquePurchase;
  DateTime datetime;
  Purchase(this.code, this.amount, this.description, this.category,
      this.nr_days, this.datetime) {
    if (amount < 0) {
      throw ArgumentError('Amount cannot be negative');
    }
    if (nr_days < 0) {
      throw ArgumentError('Number of days cannot be negative');
    }
    if (category == '') {
      throw ArgumentError('Category cannot be empty');
    }
  }

  @override
  int compareTo(Purchase other) {

    final dateComparison = datetime.compareTo(other.datetime);
    if (dateComparison != 0) {
      return dateComparison;
    }

    return amount.compareTo(other.amount);
  }

  void setAttributes(double amount, String description, String category, int nr_days){
    if (amount < 0 || nr_days < 0 || category == '') {
      throw ArgumentError('Invalid Arguments');
    }
    this.amount = amount;
    this.description = description;
    this.category = category;
    this.nr_days = nr_days;
  }

  void setId(String newID){
    code = newID;
  }

  String getId(){
    return code;
  }
}
