import 'package:MoneyWatch/Model/Habit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Habit', () {
    test('constructor initializes fields correctly', () {
      const name = 'Coffee';
      const description = 'I drink coffee twice a day';
      final startDate = DateTime.now();
      const amountPerDay = 2.0;

      final habit = Habit(name, description, startDate, amountPerDay as double);

      expect(habit.name, equals(name));
      expect(habit.description, equals(description));
      expect(habit.startDate, equals(startDate));
      expect(habit.amountPerDay, equals(amountPerDay));
    });
  });
}
