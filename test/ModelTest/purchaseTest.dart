import 'package:MoneyWatch/Model/Purchase.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {

  group('Purchase', () {
    test('Purchase constructor sets all attributes', () {
      final purchase = Purchase(
        10.0,
        'Description',
        'Category',
        5,
        DateTime.now(),
      );
      expect(purchase.amount, equals(10.0));
      expect(purchase.description, equals('Description'));
      expect(purchase.category, equals('Category'));
      expect(purchase.nr_days, equals(5));
      expect(purchase.datetime, isInstanceOf<DateTime>());
    });

    test('compareTo compares purchases by date and amount', () {
      final purchase1 = Purchase(
        10.0,
        'Description',
        'Category',
        5,
        DateTime(2022, 4, 19),
      );
      final purchase2 = Purchase(
        20.0,
        'Another description',
        'Another category',
        0,
        DateTime(2022, 4, 20),
      );
      final result = purchase1.compareTo(purchase2);
      expect(result, lessThan(0));
    });

    test('compareTo compares purchases by amount if dates are equal', () {
      final purchase1 = Purchase(
        10.0,
        'Description',
        'Category',
        5,
        DateTime.now(),
      );
      final purchase2 = Purchase(
        20.0,
        'Another description',
        'Another category',
        0,
        DateTime.now(),
      );
      final result = purchase1.compareTo(purchase2);
      expect(result, lessThan(0));
    });

    test('setAttributes sets all attributes', () {
      final purchase = Purchase(
        10.0,
        'Description',
        'Category',
        5,
        DateTime.now(),
      );
      purchase.setAttributes(20.0, 'New description', 'New category', 10);
      expect(purchase.amount, equals(20.0));
      expect(purchase.description, equals('New description'));
      expect(purchase.category, equals('New category'));
      expect(purchase.nr_days, equals(10));
    });
  });
}
