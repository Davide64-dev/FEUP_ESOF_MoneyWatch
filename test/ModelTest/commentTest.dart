import 'package:MoneyWatch/Model/Comment.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Comment', () {
    test('constructor sets properties correctly', () {
      // Arrange
      const content = 'Test Content';
      const user = 'Test User';

      // Act
      final comment = Comment(content, user, "dnfed");

      // Assert
      expect(comment.content, equals(content));
      expect(comment.user, equals(user));
    });

    test('content is not null', () {
      // Arrange
      const content = '';
      const user = 'Test User';

      // Act and Assert
      expect(() => Comment(content, user, "dnfed"), throwsArgumentError);
    });

    test('user is not null', () {
      // Arrange
      const content = 'Test Content';
      const user = '';

      // Act and Assert
      expect(() => Comment(content, user, "dnfed"), throwsArgumentError);
    });
  });
}
