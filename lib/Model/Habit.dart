class Habit{
  String name;
  String description;
  DateTime startDate;
  double amountPerDay;

  Habit(this.name, this.description, this.startDate, this.amountPerDay);


  void setAttributes(String name, String description, double amountPerDay){
    if (name == '' || amountPerDay < 0) {
      throw ArgumentError('Invalid Arguments');
    }
    this.name = name;
    this.description = description;
    this.amountPerDay = amountPerDay;
  }

  String getName(){
    return name;
  }
}
