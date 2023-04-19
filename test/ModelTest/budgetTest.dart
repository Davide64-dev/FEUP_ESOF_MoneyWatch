import 'package:MoneyWatch/Model/Budget.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  group('Budget', () {
    test('constructor sets properties correctly', () {
      // Arrange
      const name = 'Test Name';
      const description = 'Test Description';
      const amount = 1000;
      const category = 'Test Category';

      // Act
      final budget = Budget(name, description, amount, category);

      // Assert
      expect(budget.name, equals(name));
      expect(budget.description, equals(description));
      expect(budget.amount, equals(amount));
      expect(budget.category, equals(category));
    });
    
    test('amount cannot be negative', () {
      // Arrange
      const name = 'Test Name';
      const description = 'Test Description';
      const amount = -10;
      const category = 'Test Category';

      // Act and assert
      expect(() => Budget(name, description, amount, category), throwsArgumentError);
    });
  });
}
