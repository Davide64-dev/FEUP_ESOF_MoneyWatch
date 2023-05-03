import 'package:MoneyWatch/Model/User.dart';
import 'package:MoneyWatch/main.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_driver/driver_extension.dart';

void main() async {
  enableFlutterDriverExtension();
  WidgetsFlutterBinding.ensureInitialized();
  User user = User(id: '1', username: '1', habits: [], posts: [], customCategories: [], purchases: [], email: null);
  runApp(MyApp());
}