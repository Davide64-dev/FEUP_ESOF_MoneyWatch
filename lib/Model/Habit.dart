class Habit{
  String id;
  String name;
  String description;
  DateTime startDate;
  double amountPerDay;

  Habit(this.id, this.name, this.description, this.startDate, this.amountPerDay);


  void setAttributes(String name, String description, double amountPerDay){
    if (name == '' || amountPerDay < 0) {
      throw ArgumentError('Invalid Arguments');
    }
    this.id = id;
    this.name = name;
    this.description = description;
    this.amountPerDay = amountPerDay;
  }

  String getName(){
    return name;
  }
}
