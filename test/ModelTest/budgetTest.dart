import 'package:MoneyWatch/Model/Budget.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  group('Budget', () {
    test('constructor sets properties correctly', () {
      // Arrange
      const amount = 1000.0;
      const category = 'Test Category';

      // Act
      final budget = Budget(amount, category);

      // Assert
      expect(budget.amount, equals(amount));
      expect(budget.category, equals(category));
    });
    
    test('amount cannot be negative', () {
      // Arrange
      const name = 'Test Name';
      const description = 'Test Description';
      const amount = -10.0;
      const category = 'Test Category';

      // Act and assert
      expect(() => Budget(amount, category), throwsArgumentError);
    });
  });
}
