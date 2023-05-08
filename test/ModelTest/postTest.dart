import 'package:MoneyWatch/Model/Post.dart';
import 'package:MoneyWatch/Model/Comment.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  group ("Post", () {
    test('Post constructor sets properties correctly', () {
      // Arrange
      const title = 'Test Title';
      const content = 'Test Content';
      final comments = <Comment>[];
      const category = 'Test Category';

      // Act
      final post = Post(title: '', content: '', comments: [], category: '');

      // Assert
      expect(post.title, equals(title));
      expect(post.content, equals(content));
      expect(post.comments, equals(comments));
      expect(post.category, equals(category));
    });
  });
}
