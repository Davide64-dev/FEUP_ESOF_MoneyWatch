import 'package:MoneyWatch/Model/Habit.dart';
import 'package:MoneyWatch/Model/Post.dart';
import 'package:MoneyWatch/Model/Purchase.dart';
import 'package:MoneyWatch/Model/User.dart';
import 'package:MoneyWatch/View/StatisticsPageView.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';

class MockQuerySnapshot extends Mock implements QuerySnapshot {
  @override
  List<QueryDocumentSnapshot<Object?>> get docs => [];
}

class MockDocumentSnapshot extends Mock implements QueryDocumentSnapshot<Object?> {}

void main() {
  group('User', () {

        test('constructor sets properties correctly', () {
          // Arrange
          const id = '12345';
          const username = 'TestUser';
          final habits = <Habit>[];
          final posts = <Post>[];
          final customCategories = <String>[];
          final purchases = <Purchase>[];

          // Act
          final user = User(id: id, username: username, habits: habits, posts: posts, customCategories: customCategories, purchases: purchases, email: " ");

          // Assert
          expect(user.id, equals(id));
          expect(user.username, equals(username));
          expect(user.habits, equals(habits));
          expect(user.posts, equals(posts));
          expect(user.customCategories, equals(customCategories));
          expect(user.purchases, equals(purchases));
        });


    test('addPurchase() should add a purchase to the list', () {
      User user = User(
        id: 'test_id',
        username: 'test_username',
        habits: [],
        posts: [],
        customCategories: [],
        purchases: [], email: " ",
      );

      user.addPurchase(
        "",
        10.0,
        'test_description',
        'test_category',
        1,
        DateTime.now(),
      );

      expect(user.purchases.length, 1);
    });


    test('addCustomCategory adds category to list', () {
      final user = User(
        id: '1',
        username: 'test_user',
        habits: [],
        posts: [],
        customCategories: [],
        purchases: [], email: " ",
      );
      user.addCustomCategory('New Category');
      expect(user.getCustomCategories(), contains('New Category'));
    });


    test('getCustomCategories returns list of categories', () {
      final user = User(
        id: '1',
        username: 'test_user',
        habits: [],
        posts: [],
        customCategories: ['Category 1', 'Category 2'],
        purchases: [], email: " ",
      );
      List<String> returnValue = user.getCustomCategories();
      expect(returnValue, equals(['Category 1', 'Category 2']));
    });


    test('getSumPurchases() should return a map of purchase sums', () {
      User user = User(
        id: 'test_id',
        username: 'test_username',
        habits: [],
        posts: [],
        customCategories: [],
        purchases: [
          Purchase(
            ",",
            10.0,
            'test_description',
            'test_category',
            1,
            DateTime.now(),
          ),
          Purchase(
            "",
            20.0,
            'test_description',
            'test_category_2',
            1,
            DateTime.now(),
          ),
          Purchase(
            "",
            30.0,
            'test_description',
            'test_category',
            1,
            DateTime.now(),
          ),
        ], email: " ",
      );

      Map<String, double> sums =
      user.getSumPurchases(DateTime.now().subtract(Duration(days: 1)), DateTime.now());

      expect(sums['test_category'], 40.0);
      expect(sums['test_category_2'], 20.0);
    });


    test('getBarModel() should return a list of BarModel objects', () {
      User user = User(
        id: 'test_id',
        username: 'test_username',
        habits: [],
        posts: [],
        customCategories: [],
        purchases: [
          Purchase(
            "",
            10.0,
            'test_description',
            'test_category',
            1,
            DateTime.now(),
          ),
          Purchase(
            "",
            20.0,
            'test_description',
            'test_category_2',
            1,
            DateTime.now(),
          ),
          Purchase(
            "",
            30.0,
            'test_description',
            'test_category',
            1,
            DateTime.now(),
          ),
        ], email: " ",
      );

      List<BarModel> barModels =
      user.getBarModel(DateTime.now().subtract(Duration(days: 1)), DateTime.now());

      expect(barModels.length, 2);
      expect(barModels[0].category, 'test_category');
      expect(barModels[1].category, 'test_category_2');
    });


    test('isLessThan() should return true if date1 < date2 with the same year and different months', () {
      User user = User(
        id: 'test_id',
        username: 'test_username',
        habits: [],
        posts: [],
        customCategories: [],
        purchases: [], email: " ",
      );

      user.addPurchase(
        "",
        10.0,
        'test_description1',
        'test_category',
        1,
        DateTime(2023, 3, 18),
      );

      user.addPurchase(
        "",
        20.0,
        'test_description2',
        'test_category',
        1,
        DateTime(2023, 4, 18),
      );
      expect(isLessThan(user.purchases[1].datetime, user.purchases[0].datetime), true);
    });


    test('isLessThan() should return false if date1 > date2 with the same year and different months', () {
      User user = User(
        id: 'test_id',
        username: 'test_username',
        habits: [],
        posts: [],
        customCategories: [],
        purchases: [], email: " ",
      );

      user.addPurchase(
        "",
        10.0,
        'test_description1',
        'test_category',
        1,
        DateTime(2023, 3, 18),
      );

      user.addPurchase(
        "",
        20.0,
        'test_description2',
        'test_category',
        1,
        DateTime(2023, 4, 18),
      );
      expect(isLessThan(user.purchases[0].datetime, user.purchases[1].datetime), false);
    });


    test('isLessThan() should return true if date1 < date2 with different years', () {
      User user = User(
        id: 'test_id',
        username: 'test_username',
        habits: [],
        posts: [],
        customCategories: [],
        purchases: [], email: " ",
      );

      user.addPurchase(
        "",
        10.0,
        'test_description1',
        'test_category',
        1,
        DateTime(2022, 3, 18),
      );

      user.addPurchase(
        "",
        20.0,
        'test_description2',
        'test_category',
        1,
        DateTime(2023, 4, 18),
      );
      expect(isLessThan(user.purchases[1].datetime, user.purchases[0].datetime), true);
    });


    test('isLessThan() should return false if date1 > date2 with different years', () {
      User user = User(
        id: 'test_id',
        username: 'test_username',
        habits: [],
        posts: [],
        customCategories: [],
        purchases: [], email: "",
      );

      user.addPurchase(
        "",
        10.0,
        'test_description1',
        'test_category',
        1,
        DateTime(2022, 3, 18),
      );

      user.addPurchase(
        "",
        20.0,
        'test_description2',
        'test_category',
        1,
        DateTime(2023, 3, 18),
      );
      expect(isLessThan(user.purchases[0].datetime, user.purchases[1].datetime), false);
    });
  });
}
