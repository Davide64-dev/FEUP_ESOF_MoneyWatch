import 'package:cloud_firestore/cloud_firestore.dart';

import 'Habit.dart';
import 'Post.dart';
import 'Purchase.dart';

class User{
  String id = "";
  String username = "";
  List<Habit> habits = [];
  List<Post> posts = [];
  List<String> customCategories = [];
  List<Purchase> purchases = [];

  User({required this.id, required this.username,required this.habits, required
    this.posts, required this.customCategories, required this.purchases});

  factory User.fromFirestore(DocumentSnapshot value){
    Map<String, dynamic> data = value.data() as Map<String, dynamic>;
    return User(
      username: data["Name"],
      habits: [],
      posts: [],
      customCategories: [],
      purchases: [], id: ''
    );
  }



  void addPurchase(int amount, String description, String category, nr_days){
    Purchase purchase = Purchase(amount, description, category, nr_days);
    purchases.add(purchase);
  }

  void addCustomCategory(String category){
    customCategories.add(category);
  }

  List<String> getCustomCategories(){
    return customCategories;
  }


  Map<String, double> getSumPurchases(){
    Map<String, double> ret = {};
    for (Purchase purchase in purchases){
      ret[purchase.category] = purchase.amount.toDouble();
    }
    if (ret.isEmpty){
      ret["No Purchases"] = 1;
      return ret;
    }
    return ret;
  }
}
