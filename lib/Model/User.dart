import 'Habit.dart';
import 'Post.dart';

class User{
  String id;
  String username;
  List<Habit> habits;
  List<Post> posts;
  List<String> customCategories;

  User(this.id, this.username, this.habits, this.posts, this.customCategories);
}
