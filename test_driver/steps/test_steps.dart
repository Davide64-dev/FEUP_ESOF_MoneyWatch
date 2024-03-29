import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart' as teste;
import 'package:gherkin/gherkin.dart';


class Given_I_have_MainButton extends Given1<String> {

  @override
  RegExp get pattern => RegExp(r"I have {string}");

  @override
  Future<void> executeStep(String input1) async {
    print("I have $input1 MainButton");
  }
}

class When_I_tap_Button extends When1WithWorld<String, FlutterWorld>{

  @override
  RegExp get pattern => RegExp(r"I tap {string}");

  @override
  Future<void> executeStep(String input1) async {
    final loginfinder = find.byValueKey(input1);
    await FlutterDriverUtils.tap(world.driver, loginfinder);
  }
}

class expect_error_message extends ThenWithWorld<FlutterWorld>{
  @override
  Future<void> executeStep() async {
  }

  @override
  RegExp get pattern => RegExp(r"I expect an error message");

}

class FillField extends When2WithWorld<String, String, FlutterWorld> {
  @override
  Future<void> executeStep(String field1, String field2) async {
    await FlutterDriverUtils.enterText(world.driver, find.byValueKey(field1), "");
    await FlutterDriverUtils.enterText(
        world.driver, find.byValueKey(field1), field2);
  }

  @override
  RegExp get pattern => RegExp(r'I fill {string} field with {string}');
}
