import 'Habit.dart';
import 'Post.dart';

class User{
  String id;
  String username;
  List<Habit> habits;
  List<Post> posts;

  User(this.id, this.username, this.habits, this.posts);
}
