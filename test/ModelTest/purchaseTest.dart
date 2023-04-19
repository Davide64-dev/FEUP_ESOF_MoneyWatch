import 'package:MoneyWatch/Model/Purchase.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Purchase', () {
    test('Purchase constructor throws error if amount is negative', () {
      expect(() => Purchase(-1.0, 'test', 'test', 1, DateTime.now()),
          throwsArgumentError);
    });

    test('Purchase constructor throws error if nr_days is negative', () {
      expect(() => Purchase(1.0, 'test', 'test', -1, DateTime.now()),
          throwsArgumentError);
    });

    test('Purchase constructor throws error if category is empty', () {
      expect(() => Purchase(1.0, 'test', '', 1, DateTime.now()),
          throwsArgumentError);
    });

    test('Purchase compareTo function works correctly', () {
      var purchase1 = Purchase(10.0, 'test1', 'category', 1, DateTime.now());
      var purchase2 = Purchase(20.0, 'test2', 'category', 1, DateTime.now());
      expect(purchase1.compareTo(purchase2), lessThan(0));
      expect(purchase2.compareTo(purchase1), greaterThan(0));
      expect(purchase1.compareTo(purchase1), equals(0));
    });

    test('setAttributes function works correctly', () {
      var purchase = Purchase(10.0, 'test1', 'category', 1, DateTime.now());
      purchase.setAttributes(20.0, 'test2', 'category2', 2);
      expect(purchase.amount, equals(20.0));
      expect(purchase.description, equals('test2'));
      expect(purchase.category, equals('category2'));
      expect(purchase.nr_days, equals(2));
    });

    test('setAttributes function throws error if amount is negative', () {
      var purchase = Purchase(10.0, 'test1', 'category', 1, DateTime.now());
      expect(() => purchase.setAttributes(-1.0, 'test', 'category', 1),
          throwsArgumentError);
    });

    test('setAttributes function throws error if nr_days is negative', () {
      var purchase = Purchase(10.0, 'test1', 'category', 1, DateTime.now());
      expect(() => purchase.setAttributes(1.0, 'test', 'category', -1),
          throwsArgumentError);
    });

    test('setAttributes function throws error if category is empty', () {
      var purchase = Purchase(10.0, 'test1', 'category', 1, DateTime.now());
      expect(() => purchase.setAttributes(1.0, 'test', '', 1),
          throwsArgumentError);
    });
  });
}
